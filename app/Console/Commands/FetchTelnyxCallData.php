<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Http\Controllers\CallDataController;

class FetchTelnyxCallData extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'fetch:calldata';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Fetch call data from Telnyx and store it in the database';

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $controller = new CallDataController();
        $controller->fetchCallData();
        return 0;
    }
}