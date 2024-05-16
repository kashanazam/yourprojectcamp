-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 28, 2023 at 07:26 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `syncwavecrm`
--

-- --------------------------------------------------------

--
-- Table structure for table `author_websites`
--

CREATE TABLE `author_websites` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `author_name` text DEFAULT NULL,
  `email_address` text DEFAULT NULL,
  `contact_number` text DEFAULT NULL,
  `address` text DEFAULT NULL,
  `postal_code` text DEFAULT NULL,
  `city` text DEFAULT NULL,
  `desired_domain` text DEFAULT NULL,
  `own_domain` text DEFAULT NULL,
  `login_ip` text DEFAULT NULL,
  `brief_overview` text DEFAULT NULL,
  `purpose` text DEFAULT NULL,
  `user_perform` text DEFAULT NULL,
  `user_perform_other` text DEFAULT NULL,
  `feel_website` text DEFAULT NULL,
  `have_logo` tinyint(4) NOT NULL DEFAULT 0,
  `specific_look` tinyint(4) NOT NULL DEFAULT 0,
  `competitor_website_link_1` text DEFAULT NULL,
  `competitor_website_link_2` text DEFAULT NULL,
  `competitor_website_link_3` text DEFAULT NULL,
  `pages_sections` text DEFAULT NULL,
  `written_content` tinyint(4) NOT NULL DEFAULT 0,
  `need_copywriting` tinyint(4) NOT NULL DEFAULT 0,
  `cms_site` tinyint(4) NOT NULL DEFAULT 0,
  `existing_site` tinyint(4) NOT NULL DEFAULT 0,
  `about_your_book` text DEFAULT NULL,
  `social_networks` tinyint(4) NOT NULL DEFAULT 0,
  `social_linked` tinyint(4) NOT NULL DEFAULT 0,
  `social_marketing` tinyint(4) NOT NULL DEFAULT 0,
  `advertising_book` tinyint(4) NOT NULL DEFAULT 0,
  `regular_updating` tinyint(4) NOT NULL DEFAULT 0,
  `updating_yourself` tinyint(4) NOT NULL DEFAULT 0,
  `already_written` tinyint(4) NOT NULL DEFAULT 0,
  `features_pages` tinyint(4) NOT NULL DEFAULT 0,
  `typical_homepage` text DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `invoice_id` bigint(20) UNSIGNED DEFAULT NULL,
  `agent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `purpose_other` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `barks`
--

CREATE TABLE `barks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `book_covers`
--

CREATE TABLE `book_covers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` text DEFAULT NULL,
  `subtitle` text DEFAULT NULL,
  `author` text DEFAULT NULL,
  `contributors` text DEFAULT NULL,
  `genre` text DEFAULT NULL,
  `isbn` text DEFAULT NULL,
  `trim_size` text DEFAULT NULL,
  `explain` text DEFAULT NULL,
  `information` text DEFAULT NULL,
  `about` text DEFAULT NULL,
  `keywords` text DEFAULT NULL,
  `images_provide` text DEFAULT NULL,
  `category` text DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `invoice_id` bigint(20) UNSIGNED DEFAULT NULL,
  `agent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `book_formattings`
--

CREATE TABLE `book_formattings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `book_title` varchar(255) DEFAULT NULL,
  `book_subtitle` varchar(255) DEFAULT NULL,
  `author_name` varchar(255) DEFAULT NULL,
  `contributors` varchar(255) DEFAULT NULL,
  `publish_your_book` text DEFAULT NULL,
  `book_formatted` text DEFAULT NULL,
  `trim_size` varchar(255) DEFAULT NULL,
  `other_trim_size` varchar(255) DEFAULT NULL,
  `additional_instructions` text DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `invoice_id` bigint(20) UNSIGNED DEFAULT NULL,
  `agent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `book_writings`
--

CREATE TABLE `book_writings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `book_title` varchar(255) DEFAULT NULL,
  `genre_book` text DEFAULT NULL,
  `brief_summary` text DEFAULT NULL,
  `purpose` text DEFAULT NULL,
  `target_audience` text DEFAULT NULL,
  `desired_length` text DEFAULT NULL,
  `specific_characters` text DEFAULT NULL,
  `specific_themes` text DEFAULT NULL,
  `writing_style` text DEFAULT NULL,
  `specific_tone` text DEFAULT NULL,
  `existing_materials` text DEFAULT NULL,
  `existing_books` text DEFAULT NULL,
  `specific_deadlines` varchar(255) DEFAULT NULL,
  `specific_instructions` text DEFAULT NULL,
  `research` varchar(255) DEFAULT NULL,
  `specific_chapter` text DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `invoice_id` bigint(20) UNSIGNED DEFAULT NULL,
  `agent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `auth_key` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `phone_tel` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `address_link` varchar(255) DEFAULT NULL,
  `sign` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brand_users`
--

CREATE TABLE `brand_users` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category_project`
--

CREATE TABLE `category_project` (
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category_users`
--

CREATE TABLE `category_users` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `service` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `stripe_token` varchar(255) DEFAULT NULL,
  `assign_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_files`
--

CREATE TABLE `client_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `task_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_check` tinyint(4) NOT NULL,
  `show_to_client` bigint(20) UNSIGNED DEFAULT NULL,
  `production_check` tinyint(4) NOT NULL DEFAULT 0,
  `message_id` int(11) NOT NULL DEFAULT 0,
  `subtask_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `content_writing_forms`
--

CREATE TABLE `content_writing_forms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `company_details` varchar(255) DEFAULT NULL,
  `company_industry` varchar(255) DEFAULT NULL,
  `company_reason` varchar(255) DEFAULT NULL,
  `company_products` text DEFAULT NULL,
  `short_description` text DEFAULT NULL,
  `keywords` text DEFAULT NULL,
  `competitor` text DEFAULT NULL,
  `company_business` text DEFAULT NULL,
  `customers_accomplish` text DEFAULT NULL,
  `company_sets` text DEFAULT NULL,
  `mission_statement` text DEFAULT NULL,
  `existing_taglines` text DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `invoice_id` bigint(20) UNSIGNED DEFAULT NULL,
  `agent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `create_categories`
--

CREATE TABLE `create_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `short_name` varchar(255) NOT NULL,
  `sign` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `form_files`
--

CREATE TABLE `form_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `logo_form_id` bigint(20) UNSIGNED DEFAULT NULL,
  `form_code` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `brand` bigint(20) UNSIGNED NOT NULL,
  `service` varchar(255) NOT NULL,
  `package` varchar(255) NOT NULL,
  `currency` varchar(255) NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `invoice_number` varchar(255) NOT NULL,
  `invoice_date` date NOT NULL,
  `sales_agent_id` int(10) UNSIGNED DEFAULT NULL,
  `discription` text DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `payment_status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `payment_type` tinyint(4) NOT NULL DEFAULT 0,
  `custom_package` varchar(255) DEFAULT NULL,
  `transaction_id` varchar(255) NOT NULL,
  `createform` tinyint(4) NOT NULL DEFAULT 0,
  `merchant_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `logo_forms`
--

CREATE TABLE `logo_forms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `logo_name` varchar(255) NOT NULL,
  `slogan` varchar(255) DEFAULT NULL,
  `business` text NOT NULL,
  `logo_categories` text NOT NULL,
  `icon_based_logo` text NOT NULL,
  `font_style` varchar(255) NOT NULL,
  `additional_information` text DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `invoice_id` bigint(20) UNSIGNED DEFAULT NULL,
  `agent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `merchants`
--

CREATE TABLE `merchants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `public_key` varchar(255) NOT NULL,
  `secret_key` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `login_id` varchar(255) DEFAULT NULL,
  `is_authorized` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `message` text NOT NULL,
  `sender_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `task_id` bigint(20) UNSIGNED DEFAULT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_04_26_085235_add_is_employee_in_users_table', 1),
(5, '2021_04_30_053839_add_paid_to_users_table', 1),
(6, '2021_04_30_063838_add_seller__registration__colums_to_users', 1),
(7, '2021_04_30_222006_add_status_and_block_to_users_table', 1),
(8, '2021_05_15_085430_create_categories_table', 1),
(9, '2021_05_15_114723_create_brands_table', 1),
(10, '2021_05_17_021212_removing_extra_cols_from_users_table', 1),
(11, '2021_05_17_021442_add_brand_id_to_users_table', 1),
(12, '2021_05_17_050739_create_category_users_table', 1),
(13, '2021_05_17_221242_create_projects_table', 1),
(14, '2021_05_17_224857_create_clients_table', 1),
(15, '2021_05_18_231609_add_user_id_to_clients_table', 1),
(16, '2021_05_18_235551_add_status_id_to_clients_table', 1),
(17, '2021_05_30_023444_add_cost_to_projects_table', 1),
(18, '2021_05_30_023757_add_client_id_to_projects_table', 1),
(19, '2021_06_02_153024_create_category_project_table', 1),
(20, '2021_06_02_154432_add_updated_at_to_category_project_table', 1),
(21, '2021_06_02_155205_add_brand_id_to_projects_table', 1),
(22, '2021_06_02_174646_create_tasks_table', 1),
(23, '2021_06_02_175212_add_status_to_tasks_table', 1),
(24, '2021_06_03_125327_create_client_files_table', 1),
(25, '2021_06_03_143047_add_user_id_to_tasks_table', 1),
(26, '2021_06_04_150205_add_brand_id_to_tasks_table', 1),
(27, '2021_06_04_175834_create_sub_task_table', 1),
(28, '2021_06_04_181801_add_user_id_to_sub_task_table', 1),
(29, '2021_07_10_044235_add_logo_and_auth_key_to_brands_table', 1),
(30, '2021_07_10_052315_add_phone_and_email_and_address_to_brands_table', 1),
(31, '2021_07_10_061447_add_image_to_users_table', 1),
(32, '2021_07_12_134410_add_sign_to_brands_table', 1),
(33, '2021_07_12_144124_create_services_table', 1),
(34, '2021_07_12_194309_add_brand_id_to_clients_table', 1),
(35, '2021_07_12_222433_add_url_and_subject_and_services_and_message_to_clients_table', 1),
(36, '2021_07_12_230717_remove_unique_from_email_to_clients_table', 1),
(37, '2021_09_26_014422_create_brand_users_table', 1),
(38, '2021_09_26_053725_add_duedate_to_tasks_table', 1),
(39, '2021_09_26_062003_add_duedate_to_sub_task_table', 1),
(40, '2021_09_27_050444_add_user_id_status_to_client_files_table', 1),
(41, '2021_10_03_044823_create_packages_table', 1),
(42, '2021_10_03_055711_add_paid_status_packages_table', 1),
(43, '2021_10_03_062735_create_currencies_table', 1),
(44, '2021_10_03_065724_add_sign_to_packages_table', 1),
(45, '2021_10_04_221625_create_notifications_table', 1),
(46, '2021_10_10_045955_create_invoices_table', 1),
(47, '2021_10_10_054657_add_payment_type_to_invoices_table', 1),
(48, '2021_10_17_065317_add_custom_package_name_to_invoice_table', 1),
(49, '2021_10_17_083112_add_customer_stripe_to_invoice_table', 1),
(50, '2021_10_19_041420_add_transaction_id_to_invoices_table', 1),
(51, '2021_11_14_090646_create_roles_table', 1),
(52, '2021_11_14_091258_add_role_id_to_role_table', 1),
(53, '2021_11_14_092153_change_contact_nullable_to_clients_table', 1),
(54, '2021_11_14_100803_add_client_id_to_users_table', 1),
(55, '2021_11_14_113442_create_messages_table', 1),
(56, '2021_11_15_073747_add_assign_id_to_clients_table', 1),
(57, '2021_11_17_060848_create_logo_forms_table', 1),
(58, '2021_11_17_062331_add_form_to_services_table', 1),
(59, '2021_11_17_071631_add_invoice_id_to_logo_forms_table', 1),
(60, '2021_11_18_224522_create_form_files_table', 1),
(61, '2021_11_19_042252_create_web_forms_table', 1),
(62, '2021_11_21_104402_add_agent_id_to_logo_forms_table', 1),
(63, '2021_11_21_105635_add_agent_id_to_web_forms_table', 1),
(64, '2021_11_25_054339_add_form_id_to_projects_table', 1),
(65, '2022_02_18_043224_add_show_to_client_table', 1),
(66, '2022_02_19_042415_add_task_id_to_messages_table', 1),
(67, '2022_02_22_230845_create_smm_forms_table', 1),
(68, '2022_02_22_235626_add_agent_id_to_users_table', 1),
(69, '2022_02_23_001005_create_content_writing_forms_table', 1),
(70, '2022_02_23_002300_create_seo_forms_table', 1),
(71, '2022_02_23_054710_add_company_name_to_seo_forms_table', 1),
(72, '2022_02_24_232047_add_assign_id_to_sub_task_table', 1),
(73, '2022_02_25_012213_add_status_to_sub_task_table', 1),
(74, '2022_02_25_041300_add_production_check_to_client_files_table', 1),
(75, '2022_02_25_053710_add_production_check_to_sub_task_table', 1),
(76, '2022_02_26_005155_add_notes_to_tasks_table', 1),
(77, '2022_02_26_035651_add_message_id_to_client_files_table', 1),
(78, '2022_03_13_060339_add_role_id_to_users_table', 1),
(79, '2022_04_04_223829_add_createform_to_invoices_table', 1),
(80, '2022_04_08_025125_add_client_id_to_messages_table', 1),
(81, '2022_05_21_023130_add_seen_to_projects_table', 1),
(82, '2022_06_24_005818_create_no_forms_table', 1),
(83, '2022_07_06_055954_add_client_id_to_no_forms_table', 1),
(84, '2022_07_06_213609_add_client_id_to_logo_forms_table', 1),
(85, '2022_07_06_213718_add_client_id_to_web_forms_table', 1),
(86, '2022_07_06_213942_add_client_id_to_smm_forms_table', 1),
(87, '2022_07_06_214232_add_client_id_to_content_writing_forms_table', 1),
(88, '2022_08_09_023113_add_client_id_to_seo_forms_table', 1),
(89, '2022_09_09_003459_create_barks_table', 1),
(90, '2022_09_13_052449_add_verfication_code_to_users_table', 1),
(91, '2022_09_29_052740_create_merchants_table', 1),
(92, '2022_09_29_055249_add_status_to_merchants_table', 1),
(93, '2022_09_29_062824_add_merchant_id_to_invoices_table', 1),
(94, '2022_11_05_042839_add_authorized_to_merchants_table', 1),
(95, '2023_01_23_234541_create_book_formattings_table', 1),
(96, '2023_01_24_000341_add_client_id_to_book_formattings_table', 1),
(97, '2023_01_24_045353_create_book_writings_table', 1),
(98, '2023_01_30_225352_add_platforms_to_smm_forms_table', 1),
(99, '2023_02_01_003353_create_author_websites_table', 1),
(100, '2023_02_01_021229_add_user_perform_other_to_author_websites_table', 1),
(101, '2023_02_22_060158_create_proofreadings_table', 1),
(102, '2023_02_22_231356_create_book_covers_table', 1),
(103, '2023_05_03_031300_create_production_member_assigns_table', 1),
(104, '2023_05_05_040657_create_production_messages_table', 1),
(105, '2023_05_16_050342_add_subtask_id_to_client_files_table', 1),
(106, '2023_05_17_223134_create_subtas_k_due_dates_table', 1),
(107, '2023_09_12_001828_create_task_member_list_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `no_forms`
--

CREATE TABLE `no_forms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `agent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `invoice_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `actual_price` decimal(65,2) NOT NULL,
  `price` varchar(255) NOT NULL,
  `cut_price` varchar(255) NOT NULL,
  `details` text NOT NULL,
  `addon` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `best_selling` tinyint(4) NOT NULL DEFAULT 0,
  `on_landing` tinyint(4) NOT NULL DEFAULT 0,
  `is_combo` tinyint(4) NOT NULL DEFAULT 0,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `currencies_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `production_member_assigns`
--

CREATE TABLE `production_member_assigns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `task_id` bigint(20) UNSIGNED NOT NULL,
  `subtask_id` bigint(20) UNSIGNED NOT NULL,
  `assigned_by` bigint(20) UNSIGNED NOT NULL,
  `assigned_to` bigint(20) UNSIGNED NOT NULL,
  `comments` text DEFAULT NULL,
  `duadate` date NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `production_messages`
--

CREATE TABLE `production_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `production_member_assigns_id` bigint(20) UNSIGNED NOT NULL,
  `messages` text DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `product_status` tinyint(4) NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cost` varchar(255) DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `form_id` bigint(20) UNSIGNED DEFAULT NULL,
  `form_checker` tinyint(4) NOT NULL DEFAULT 0,
  `seen` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `proofreadings`
--

CREATE TABLE `proofreadings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` text DEFAULT NULL,
  `word_count` text DEFAULT NULL,
  `services` text DEFAULT NULL,
  `completion` text DEFAULT NULL,
  `previously` text DEFAULT NULL,
  `specific_areas` text DEFAULT NULL,
  `suggestions` text DEFAULT NULL,
  `mention` text DEFAULT NULL,
  `major` text DEFAULT NULL,
  `trigger` text DEFAULT NULL,
  `character` text DEFAULT NULL,
  `guide` text DEFAULT NULL,
  `areas` text DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `invoice_id` bigint(20) UNSIGNED DEFAULT NULL,
  `agent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `column_name` varchar(255) NOT NULL,
  `role_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seo_forms`
--

CREATE TABLE `seo_forms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `business_established` varchar(255) DEFAULT NULL,
  `original_owner` varchar(255) DEFAULT NULL,
  `age_current_site` varchar(255) DEFAULT NULL,
  `top_goals` varchar(255) DEFAULT NULL,
  `core_offer` varchar(255) DEFAULT NULL,
  `average_order_value` varchar(255) DEFAULT NULL,
  `selling_per_month` varchar(255) DEFAULT NULL,
  `client_lifetime_value` varchar(255) DEFAULT NULL,
  `supplementary_offers` varchar(255) DEFAULT NULL,
  `getting_clients` varchar(255) DEFAULT NULL,
  `currently_spending` varchar(255) DEFAULT NULL,
  `monthly_visitors` varchar(255) DEFAULT NULL,
  `people_adding` varchar(255) DEFAULT NULL,
  `monthly_financial` varchar(255) DEFAULT NULL,
  `that_much` varchar(255) DEFAULT NULL,
  `specific_target` text DEFAULT NULL,
  `competitors` varchar(255) DEFAULT NULL,
  `third_party_marketing` varchar(255) DEFAULT NULL,
  `current_monthly_sales` varchar(255) DEFAULT NULL,
  `current_monthly_revenue` varchar(255) DEFAULT NULL,
  `target_region` varchar(255) DEFAULT NULL,
  `looking_to_execute` varchar(255) DEFAULT NULL,
  `time_zone` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `invoice_id` bigint(20) UNSIGNED DEFAULT NULL,
  `agent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `form` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `smm_forms`
--

CREATE TABLE `smm_forms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `desired_results` varchar(255) DEFAULT NULL,
  `business_name` varchar(255) DEFAULT NULL,
  `business_email_address` varchar(255) DEFAULT NULL,
  `business_phone_number` varchar(255) DEFAULT NULL,
  `business_mailing_address` varchar(255) DEFAULT NULL,
  `business_location` varchar(255) DEFAULT NULL,
  `business_website_address` varchar(255) DEFAULT NULL,
  `business_working_hours` varchar(255) DEFAULT NULL,
  `business_category` varchar(255) DEFAULT NULL,
  `social_media_platforms` varchar(255) DEFAULT NULL,
  `target_locations` varchar(255) DEFAULT NULL,
  `target_audience` varchar(255) DEFAULT NULL,
  `age_bracket` varchar(255) DEFAULT NULL,
  `represent_your_business` text DEFAULT NULL,
  `business_usp` text DEFAULT NULL,
  `do_not_want_us_to_use` text DEFAULT NULL,
  `competitors` text DEFAULT NULL,
  `additional_comments` text DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `invoice_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `agent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `facebook_page` text DEFAULT NULL,
  `instagram_page` text DEFAULT NULL,
  `instagram_password` text DEFAULT NULL,
  `twitter_page` text DEFAULT NULL,
  `twitter_password` text DEFAULT NULL,
  `linkedin_page` text DEFAULT NULL,
  `pinterest_page` text DEFAULT NULL,
  `pinterest_password` text DEFAULT NULL,
  `youtube_page` text DEFAULT NULL,
  `gmail_address_youtube` text DEFAULT NULL,
  `gmail_password_youtube` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subtas_k_due_dates`
--

CREATE TABLE `subtas_k_due_dates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subtask_id` bigint(20) UNSIGNED NOT NULL,
  `duadate` date NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_task`
--

CREATE TABLE `sub_task` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `task_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `duedate` date DEFAULT NULL,
  `assign_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `sub_task_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `duedate` date NOT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task_member_list`
--

CREATE TABLE `task_member_list` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `task_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_employee` tinyint(1) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `block` tinyint(4) NOT NULL DEFAULT 0,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `verfication_code` varchar(255) DEFAULT NULL,
  `verfication_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `is_employee`, `last_name`, `contact`, `status`, `block`, `brand_id`, `image`, `client_id`, `verfication_code`, `verfication_datetime`) VALUES
(1, 'Admin', 'admin@syncwavecrm.com', NULL, '$2y$10$sGvYghV.uUjkqsRfGOkiF.ljHQIW7wc39CLdzkr5MoCGaAY2lsr8e', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, NULL, NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `web_forms`
--

CREATE TABLE `web_forms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `business_name` varchar(255) DEFAULT NULL,
  `website_address` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `decision_makers` text DEFAULT NULL,
  `about_company` text DEFAULT NULL,
  `purpose` text DEFAULT NULL,
  `deadline` text DEFAULT NULL,
  `potential_clients` text DEFAULT NULL,
  `competitor` text DEFAULT NULL,
  `user_perform` text DEFAULT NULL,
  `pages` text DEFAULT NULL,
  `written_content` varchar(255) DEFAULT NULL,
  `copywriting_photography_services` tinyint(4) NOT NULL DEFAULT 0,
  `cms_site` tinyint(4) NOT NULL DEFAULT 0,
  `re_design` tinyint(4) NOT NULL DEFAULT 0,
  `working_current_site` tinyint(4) NOT NULL DEFAULT 0,
  `going_to_need` varchar(255) DEFAULT NULL,
  `additional_features` text DEFAULT NULL,
  `feel_about_company` text DEFAULT NULL,
  `incorporated` text DEFAULT NULL,
  `need_designed` text DEFAULT NULL,
  `specific_look` text DEFAULT NULL,
  `competition` text DEFAULT NULL,
  `websites_link` text DEFAULT NULL,
  `people_find_business` text DEFAULT NULL,
  `market_site` text DEFAULT NULL,
  `accounts_setup` text DEFAULT NULL,
  `links_accounts_setup` text DEFAULT NULL,
  `service_account` text DEFAULT NULL,
  `use_advertising` text DEFAULT NULL,
  `printed_materials` text DEFAULT NULL,
  `domain_name` text DEFAULT NULL,
  `hosting_account` text DEFAULT NULL,
  `login_ip` text DEFAULT NULL,
  `domain_like_name` text DEFAULT NULL,
  `section_regular_updating` varchar(255) DEFAULT NULL,
  `updating_yourself` varchar(255) DEFAULT NULL,
  `blog_written` text DEFAULT NULL,
  `regular_basis` varchar(255) DEFAULT NULL,
  `fugure_pages` text DEFAULT NULL,
  `additional_information` text DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `invoice_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `agent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `author_websites`
--
ALTER TABLE `author_websites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `author_websites_user_id_foreign` (`user_id`),
  ADD KEY `author_websites_invoice_id_foreign` (`invoice_id`),
  ADD KEY `author_websites_agent_id_foreign` (`agent_id`),
  ADD KEY `author_websites_client_id_foreign` (`client_id`);

--
-- Indexes for table `barks`
--
ALTER TABLE `barks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `barks_user_id_foreign` (`user_id`);

--
-- Indexes for table `book_covers`
--
ALTER TABLE `book_covers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_covers_user_id_foreign` (`user_id`),
  ADD KEY `book_covers_invoice_id_foreign` (`invoice_id`),
  ADD KEY `book_covers_agent_id_foreign` (`agent_id`),
  ADD KEY `book_covers_client_id_foreign` (`client_id`);

--
-- Indexes for table `book_formattings`
--
ALTER TABLE `book_formattings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_formattings_user_id_foreign` (`user_id`),
  ADD KEY `book_formattings_invoice_id_foreign` (`invoice_id`),
  ADD KEY `book_formattings_agent_id_foreign` (`agent_id`),
  ADD KEY `book_formattings_client_id_foreign` (`client_id`);

--
-- Indexes for table `book_writings`
--
ALTER TABLE `book_writings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_writings_user_id_foreign` (`user_id`),
  ADD KEY `book_writings_invoice_id_foreign` (`invoice_id`),
  ADD KEY `book_writings_agent_id_foreign` (`agent_id`),
  ADD KEY `book_writings_client_id_foreign` (`client_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brand_users`
--
ALTER TABLE `brand_users`
  ADD KEY `brand_users_user_id_foreign` (`user_id`),
  ADD KEY `brand_users_brand_id_foreign` (`brand_id`);

--
-- Indexes for table `category_project`
--
ALTER TABLE `category_project`
  ADD KEY `category_project_project_id_foreign` (`project_id`),
  ADD KEY `category_project_category_id_foreign` (`category_id`);

--
-- Indexes for table `category_users`
--
ALTER TABLE `category_users`
  ADD KEY `category_users_user_id_foreign` (`user_id`),
  ADD KEY `category_users_category_id_foreign` (`category_id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clients_user_id_foreign` (`user_id`),
  ADD KEY `clients_brand_id_foreign` (`brand_id`),
  ADD KEY `clients_assign_id_foreign` (`assign_id`);

--
-- Indexes for table `client_files`
--
ALTER TABLE `client_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_files_user_id_foreign` (`user_id`),
  ADD KEY `client_files_show_to_client_foreign` (`show_to_client`),
  ADD KEY `client_files_subtask_id_foreign` (`subtask_id`);

--
-- Indexes for table `content_writing_forms`
--
ALTER TABLE `content_writing_forms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `content_writing_forms_user_id_foreign` (`user_id`),
  ADD KEY `content_writing_forms_invoice_id_foreign` (`invoice_id`),
  ADD KEY `content_writing_forms_agent_id_foreign` (`agent_id`),
  ADD KEY `content_writing_forms_client_id_foreign` (`client_id`);

--
-- Indexes for table `create_categories`
--
ALTER TABLE `create_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `form_files`
--
ALTER TABLE `form_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_brand_foreign` (`brand`),
  ADD KEY `invoices_client_id_foreign` (`client_id`),
  ADD KEY `invoices_merchant_id_foreign` (`merchant_id`);

--
-- Indexes for table `logo_forms`
--
ALTER TABLE `logo_forms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `logo_forms_user_id_foreign` (`user_id`),
  ADD KEY `logo_forms_invoice_id_foreign` (`invoice_id`),
  ADD KEY `logo_forms_agent_id_foreign` (`agent_id`),
  ADD KEY `logo_forms_client_id_foreign` (`client_id`);

--
-- Indexes for table `merchants`
--
ALTER TABLE `merchants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `no_forms`
--
ALTER TABLE `no_forms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `no_forms_agent_id_foreign` (`agent_id`),
  ADD KEY `no_forms_user_id_foreign` (`user_id`),
  ADD KEY `no_forms_invoice_id_foreign` (`invoice_id`),
  ADD KEY `no_forms_client_id_foreign` (`client_id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `packages_brand_id_foreign` (`brand_id`),
  ADD KEY `packages_service_id_foreign` (`service_id`),
  ADD KEY `packages_currencies_id_foreign` (`currencies_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `production_member_assigns`
--
ALTER TABLE `production_member_assigns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `production_member_assigns_task_id_foreign` (`task_id`),
  ADD KEY `production_member_assigns_subtask_id_foreign` (`subtask_id`),
  ADD KEY `production_member_assigns_assigned_by_foreign` (`assigned_by`),
  ADD KEY `production_member_assigns_assigned_to_foreign` (`assigned_to`);

--
-- Indexes for table `production_messages`
--
ALTER TABLE `production_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `production_messages_production_member_assigns_id_foreign` (`production_member_assigns_id`),
  ADD KEY `production_messages_user_id_foreign` (`user_id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `projects_user_id_foreign` (`user_id`),
  ADD KEY `projects_client_id_foreign` (`client_id`),
  ADD KEY `projects_brand_id_foreign` (`brand_id`);

--
-- Indexes for table `proofreadings`
--
ALTER TABLE `proofreadings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proofreadings_user_id_foreign` (`user_id`),
  ADD KEY `proofreadings_invoice_id_foreign` (`invoice_id`),
  ADD KEY `proofreadings_agent_id_foreign` (`agent_id`),
  ADD KEY `proofreadings_client_id_foreign` (`client_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seo_forms`
--
ALTER TABLE `seo_forms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seo_forms_user_id_foreign` (`user_id`),
  ADD KEY `seo_forms_invoice_id_foreign` (`invoice_id`),
  ADD KEY `seo_forms_agent_id_foreign` (`agent_id`),
  ADD KEY `seo_forms_client_id_foreign` (`client_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `services_brand_id_foreign` (`brand_id`);

--
-- Indexes for table `smm_forms`
--
ALTER TABLE `smm_forms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `smm_forms_user_id_foreign` (`user_id`),
  ADD KEY `smm_forms_invoice_id_foreign` (`invoice_id`),
  ADD KEY `smm_forms_agent_id_foreign` (`agent_id`),
  ADD KEY `smm_forms_client_id_foreign` (`client_id`);

--
-- Indexes for table `subtas_k_due_dates`
--
ALTER TABLE `subtas_k_due_dates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subtas_k_due_dates_subtask_id_foreign` (`subtask_id`),
  ADD KEY `subtas_k_due_dates_user_id_foreign` (`user_id`);

--
-- Indexes for table `sub_task`
--
ALTER TABLE `sub_task`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_task_task_id_foreign` (`task_id`),
  ADD KEY `sub_task_user_id_foreign` (`user_id`),
  ADD KEY `sub_task_assign_id_foreign` (`assign_id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tasks_project_id_foreign` (`project_id`),
  ADD KEY `tasks_category_id_foreign` (`category_id`),
  ADD KEY `tasks_user_id_foreign` (`user_id`),
  ADD KEY `tasks_brand_id_foreign` (`brand_id`);

--
-- Indexes for table `task_member_list`
--
ALTER TABLE `task_member_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_member_list_user_id_foreign` (`user_id`),
  ADD KEY `task_member_list_task_id_foreign` (`task_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_brand_id_foreign` (`brand_id`);

--
-- Indexes for table `web_forms`
--
ALTER TABLE `web_forms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `web_forms_user_id_foreign` (`user_id`),
  ADD KEY `web_forms_invoice_id_foreign` (`invoice_id`),
  ADD KEY `web_forms_agent_id_foreign` (`agent_id`),
  ADD KEY `web_forms_client_id_foreign` (`client_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `author_websites`
--
ALTER TABLE `author_websites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `barks`
--
ALTER TABLE `barks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `book_covers`
--
ALTER TABLE `book_covers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `book_formattings`
--
ALTER TABLE `book_formattings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `book_writings`
--
ALTER TABLE `book_writings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_files`
--
ALTER TABLE `client_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `content_writing_forms`
--
ALTER TABLE `content_writing_forms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `create_categories`
--
ALTER TABLE `create_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `form_files`
--
ALTER TABLE `form_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logo_forms`
--
ALTER TABLE `logo_forms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `merchants`
--
ALTER TABLE `merchants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `no_forms`
--
ALTER TABLE `no_forms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `production_member_assigns`
--
ALTER TABLE `production_member_assigns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `production_messages`
--
ALTER TABLE `production_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `proofreadings`
--
ALTER TABLE `proofreadings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seo_forms`
--
ALTER TABLE `seo_forms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `smm_forms`
--
ALTER TABLE `smm_forms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subtas_k_due_dates`
--
ALTER TABLE `subtas_k_due_dates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_task`
--
ALTER TABLE `sub_task`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task_member_list`
--
ALTER TABLE `task_member_list`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `web_forms`
--
ALTER TABLE `web_forms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `author_websites`
--
ALTER TABLE `author_websites`
  ADD CONSTRAINT `author_websites_agent_id_foreign` FOREIGN KEY (`agent_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `author_websites_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `author_websites_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`),
  ADD CONSTRAINT `author_websites_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `barks`
--
ALTER TABLE `barks`
  ADD CONSTRAINT `barks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `book_covers`
--
ALTER TABLE `book_covers`
  ADD CONSTRAINT `book_covers_agent_id_foreign` FOREIGN KEY (`agent_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `book_covers_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `book_covers_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`),
  ADD CONSTRAINT `book_covers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `book_formattings`
--
ALTER TABLE `book_formattings`
  ADD CONSTRAINT `book_formattings_agent_id_foreign` FOREIGN KEY (`agent_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `book_formattings_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `book_formattings_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`),
  ADD CONSTRAINT `book_formattings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `book_writings`
--
ALTER TABLE `book_writings`
  ADD CONSTRAINT `book_writings_agent_id_foreign` FOREIGN KEY (`agent_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `book_writings_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `book_writings_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`),
  ADD CONSTRAINT `book_writings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `brand_users`
--
ALTER TABLE `brand_users`
  ADD CONSTRAINT `brand_users_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `brand_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_project`
--
ALTER TABLE `category_project`
  ADD CONSTRAINT `category_project_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `create_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_project_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_users`
--
ALTER TABLE `category_users`
  ADD CONSTRAINT `category_users_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `create_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_assign_id_foreign` FOREIGN KEY (`assign_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `clients_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  ADD CONSTRAINT `clients_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `client_files`
--
ALTER TABLE `client_files`
  ADD CONSTRAINT `client_files_show_to_client_foreign` FOREIGN KEY (`show_to_client`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `client_files_subtask_id_foreign` FOREIGN KEY (`subtask_id`) REFERENCES `sub_task` (`id`),
  ADD CONSTRAINT `client_files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `content_writing_forms`
--
ALTER TABLE `content_writing_forms`
  ADD CONSTRAINT `content_writing_forms_agent_id_foreign` FOREIGN KEY (`agent_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `content_writing_forms_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `content_writing_forms_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`),
  ADD CONSTRAINT `content_writing_forms_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_brand_foreign` FOREIGN KEY (`brand`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invoices_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invoices_merchant_id_foreign` FOREIGN KEY (`merchant_id`) REFERENCES `merchants` (`id`);

--
-- Constraints for table `logo_forms`
--
ALTER TABLE `logo_forms`
  ADD CONSTRAINT `logo_forms_agent_id_foreign` FOREIGN KEY (`agent_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `logo_forms_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `logo_forms_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`),
  ADD CONSTRAINT `logo_forms_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `no_forms`
--
ALTER TABLE `no_forms`
  ADD CONSTRAINT `no_forms_agent_id_foreign` FOREIGN KEY (`agent_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `no_forms_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `no_forms_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`),
  ADD CONSTRAINT `no_forms_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `packages`
--
ALTER TABLE `packages`
  ADD CONSTRAINT `packages_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `packages_currencies_id_foreign` FOREIGN KEY (`currencies_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `packages_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `production_member_assigns`
--
ALTER TABLE `production_member_assigns`
  ADD CONSTRAINT `production_member_assigns_assigned_by_foreign` FOREIGN KEY (`assigned_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `production_member_assigns_assigned_to_foreign` FOREIGN KEY (`assigned_to`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `production_member_assigns_subtask_id_foreign` FOREIGN KEY (`subtask_id`) REFERENCES `sub_task` (`id`),
  ADD CONSTRAINT `production_member_assigns_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`);

--
-- Constraints for table `production_messages`
--
ALTER TABLE `production_messages`
  ADD CONSTRAINT `production_messages_production_member_assigns_id_foreign` FOREIGN KEY (`production_member_assigns_id`) REFERENCES `production_member_assigns` (`id`),
  ADD CONSTRAINT `production_messages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  ADD CONSTRAINT `projects_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `projects_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `proofreadings`
--
ALTER TABLE `proofreadings`
  ADD CONSTRAINT `proofreadings_agent_id_foreign` FOREIGN KEY (`agent_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `proofreadings_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `proofreadings_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`),
  ADD CONSTRAINT `proofreadings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `seo_forms`
--
ALTER TABLE `seo_forms`
  ADD CONSTRAINT `seo_forms_agent_id_foreign` FOREIGN KEY (`agent_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `seo_forms_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `seo_forms_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`),
  ADD CONSTRAINT `seo_forms_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`);

--
-- Constraints for table `smm_forms`
--
ALTER TABLE `smm_forms`
  ADD CONSTRAINT `smm_forms_agent_id_foreign` FOREIGN KEY (`agent_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `smm_forms_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `smm_forms_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`),
  ADD CONSTRAINT `smm_forms_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `subtas_k_due_dates`
--
ALTER TABLE `subtas_k_due_dates`
  ADD CONSTRAINT `subtas_k_due_dates_subtask_id_foreign` FOREIGN KEY (`subtask_id`) REFERENCES `sub_task` (`id`),
  ADD CONSTRAINT `subtas_k_due_dates_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `sub_task`
--
ALTER TABLE `sub_task`
  ADD CONSTRAINT `sub_task_assign_id_foreign` FOREIGN KEY (`assign_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `sub_task_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`),
  ADD CONSTRAINT `sub_task_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  ADD CONSTRAINT `tasks_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `create_categories` (`id`),
  ADD CONSTRAINT `tasks_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  ADD CONSTRAINT `tasks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `task_member_list`
--
ALTER TABLE `task_member_list`
  ADD CONSTRAINT `task_member_list_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`),
  ADD CONSTRAINT `task_member_list_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`);

--
-- Constraints for table `web_forms`
--
ALTER TABLE `web_forms`
  ADD CONSTRAINT `web_forms_agent_id_foreign` FOREIGN KEY (`agent_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `web_forms_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `web_forms_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`),
  ADD CONSTRAINT `web_forms_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
