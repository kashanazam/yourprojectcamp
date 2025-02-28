<?php

namespace App\Console\Commands;

use App\Models\DBInvoice;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

class FetchInvoiceData extends Command
{
    protected $signature = 'fetch:invoice-data';

    protected $description = 'Fetch new invoice data from API and store in database';

    public function handle()
    {
        $latestRecord = DBInvoice::latest()->first();
        $latestId = $latestRecord ? $latestRecord->id : 0;

        $apiUrl = 'https://projectwall.net/api/invoice-bank';
        $apiToken = env('BRAND_API_TOKEN');

        $response = Http::withHeaders([
            'X-API-TOKEN' => $apiToken,
            'Accept' => 'application/json',
        ])->get($apiUrl, ['latest_id' => $latestId]);

        if ($response->failed()) {
            Log::error('Failed to fetch Invoice Data', ['error' => $response->body()]);
            return;
        }

        $data = $response->json();
        if (!$data['success']) {
            Log::error('API request failed', ['response' => $data]);
            return;
        }

        $insertedRecords = 0;

        foreach ($data['data'] as $record) {
            // Ensure required fields exist before inserting
            if (!isset($record['id'], $record['invoice_number'])) {
                Log::warning('Skipping invalid record', ['record' => $record]);
                continue;
            }

            // Check if the invoice already exists to avoid duplicates
            $existingInvoice = DBInvoice::where('id', $record['id'])->first();
            if ($existingInvoice) {
                Log::info('Skipping duplicate invoice', ['id' => $record['id']]);
                continue;
            }

            // Insert data into the database
            DBInvoice::create([
                'id' => $record['id'],
                'name' => $record['name'] ?? null,
                'email' => $record['email'] ?? null,
                'contact' => $record['contact'] ?? null,
                'brand' => $record['brand'] ?? null,
                'service' => $record['service'] ?? null,
                'package' => $record['package'] ?? null,
                'currency' => $record['currency'] ?? null,
                'client_id' => $record['client_id'] ?? null,
                'invoice_number' => $record['invoice_number'],
                'invoice_date' => $record['invoice_date'] ?? null,
                'sales_agent_id' => $record['sales_agent_id'] ?? null,
                'discription' => $record['discription'] ?? null,
                'amount' => $record['amount'] ?? 0,
                'payment_status' => $record['payment_status'] ?? 'pending',
                'payment_type' => $record['payment_type'] ?? null,
                'custom_package' => $record['custom_package'] ?? null,
                'transaction_id' => $record['transaction_id'] ?? null,
                'createform' => $record['createform'] ?? null,
                'merchant_id' => $record['merchant_id'] ?? null,
                'created_at' => $record['created_at'] ?? now(),
                'updated_at' => $record['updated_at'] ?? now()
            ]);

            $insertedRecords++;
        }

        Log::info('Invoice Data fetched successfully', ['new_records' => $insertedRecords]);

    }
}
