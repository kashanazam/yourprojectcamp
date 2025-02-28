<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\Transaction;
use net\authorize\api\contract\v1 as AnetAPI;
use net\authorize\api\controller as AnetController;
use DateTime;
use DateTimeZone;
use Illuminate\Support\Facades\Log;

class FetchAuthorizeTransactions extends Command
{
    protected $signature = 'fetch:transactions';
    protected $description = 'Fetch new transactions from API and store in database';

    public function handle()
    {
        $merchantAuthentication = new AnetAPI\MerchantAuthenticationType();
        $merchantAuthentication->setName('5zPvH3n5xC3Z');
        $merchantAuthentication->setTransactionKey('656LNL953kBT7hyF');

        $firstSettlementDate = new DateTime('first day of this month 00:00:00', new DateTimeZone('UTC'));
        $lastSettlementDate = new DateTime('last day of this month 23:59:59', new DateTimeZone('UTC'));


        $request = new AnetAPI\GetSettledBatchListRequest();
        $request->setMerchantAuthentication($merchantAuthentication);
        $request->setFirstSettlementDate($firstSettlementDate);
        $request->setLastSettlementDate($lastSettlementDate);

        $controller = new AnetController\GetSettledBatchListController($request);
        $response = $controller->executeWithApiResponse(\net\authorize\api\constants\ANetEnvironment::PRODUCTION);

        if ($response != null && $response->getMessages()->getResultCode() == "Ok") {
            foreach ($response->getBatchList() as $batch) {
                $batchId = $batch->getBatchId();
                $this->getTransactionsForBatch($merchantAuthentication, $batchId);
            }
            Log::info('New Transactions stored successfully');
        } else {
            Log::info('Failed to fetch transactions');
        }
    }


    private function getTransactionsForBatch($merchantAuthentication, $batchId)
    {
        $request = new AnetAPI\GetTransactionListRequest();
        $request->setMerchantAuthentication($merchantAuthentication);
        $request->setBatchId($batchId);

        $controller = new AnetController\GetTransactionListController($request);
        $response = $controller->executeWithApiResponse(\net\authorize\api\constants\ANetEnvironment::PRODUCTION);

        if ($response != null && $response->getMessages()->getResultCode() == "Ok") {
            foreach ($response->getTransactions() as $transaction) {
                $transId = $transaction->getTransId();
                if (Transaction::where('transaction_id', $transId)->exists()) {
                    continue; // Skip inserting if transaction exists
                }
                $billingInfo = $this->getBillingInfo($merchantAuthentication, $transId);
                Transaction::updateOrCreate(
                    ['transaction_id' => $transId],
                    [
                        'status' => $transaction->getTransactionStatus(),
                        'amount' => $transaction->getSettleAmount(),
                        'payment_date' => $transaction->getSubmitTimeUTC(),
                        'email' => $billingInfo['email'],
                        'phone' => $billingInfo['phone'],
                        'batch_id' => $batchId
                    ]
                );
            }
        }
    }

    private function getBillingInfo($merchantAuthentication, $transId)
    {
        $request = new AnetAPI\GetTransactionDetailsRequest();
        $request->setMerchantAuthentication($merchantAuthentication);
        $request->setTransId($transId);

        $controller = new AnetController\GetTransactionDetailsController($request);
        $response = $controller->executeWithApiResponse(\net\authorize\api\constants\ANetEnvironment::PRODUCTION);

        if ($response != null && $response->getMessages()->getResultCode() == "Ok") {
            $transaction = $response->getTransaction();
            $billingInfo = $transaction->getBillTo();
            $customer = $transaction->getCustomer();

            return [
                'email' => $customer ? $customer->getEmail() : 'N/A',
                'phone' => $billingInfo && $billingInfo->getPhoneNumber() ? $billingInfo->getPhoneNumber() : 'N/A',
            ];
        }

        return ['email' => 'N/A', 'phone' => 'N/A'];
    }
}
