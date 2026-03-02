# LORISClient\InstrumentManagerApi



All URIs are relative to https://demo.loris.ca/api/v0.0.4-dev, except if the operation defines another base path.

| Method | HTTP request | Description |
| ------------- | ------------- | ------------- |
| [**getInstrumentDataHeaders()**](InstrumentManagerApi.md#getInstrumentDataHeaders) | **GET** /instrument_manager/instrument_data | Get expected CSV or TSV headers for instrument data upload. Requires format query param (LORIS_CSV/REDCAP_CSV/BIDS_TSV). |
| [**installInstrument()**](InstrumentManagerApi.md#installInstrument) | **POST** /instrument_manager | Install instrument from a LINST file, a BIDS phenotype sidecar (json), or a REDCap data dictionary (csv). Sends instrument_type field (bids/linst/redcap). |
| [**uploadInstrumentData()**](InstrumentManagerApi.md#uploadInstrumentData) | **POST** /instrument_manager/instrument_data | Bulk upload instrument data from CSV or TSV file. Sends format (LORIS_CSV/REDCAP_CSV/BIDS_TSV) and strict (true/false) fields. Client auto-detects REDCap CSV via redcap_event_name column. |


## `getInstrumentDataHeaders()`

```php
getInstrumentDataHeaders($action, $format, $instrument, $instruments): \SplFileObject
```

Get expected CSV or TSV headers for instrument data upload. Requires format query param (LORIS_CSV/REDCAP_CSV/BIDS_TSV).

### Example

```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');


// Configure Bearer (JWT) authorization: BearerAuth
$config = LORISClient\Configuration::getDefaultConfiguration()->setAccessToken('YOUR_ACCESS_TOKEN');


$apiInstance = new LORISClient\Api\InstrumentManagerApi(
    // If you want use custom http client, pass your client which implements `GuzzleHttp\ClientInterface`.
    // This is optional, `GuzzleHttp\Client` will be used as default.
    new GuzzleHttp\Client(),
    $config
);
$action = 'action_example'; // string | Either CREATE_SESSIONS or VALIDATE_SESSIONS
$format = 'format_example'; // string | Data format for the returned headers template. LORIS_CSV — standard LORIS CSV headers REDCAP_CSV — REDCap-style CSV headers (includes redcap_event_name etc.) BIDS_TSV — BIDS phenotype TSV headers (cannot be combined with CREATE_SESSIONS)
$instrument = 'instrument_example'; // string | Single instrument name
$instruments = array('instruments_example'); // string[] | Multiple instrument names

try {
    $result = $apiInstance->getInstrumentDataHeaders($action, $format, $instrument, $instruments);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling InstrumentManagerApi->getInstrumentDataHeaders: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **action** | **string**| Either CREATE_SESSIONS or VALIDATE_SESSIONS | |
| **format** | **string**| Data format for the returned headers template. LORIS_CSV — standard LORIS CSV headers REDCAP_CSV — REDCap-style CSV headers (includes redcap_event_name etc.) BIDS_TSV — BIDS phenotype TSV headers (cannot be combined with CREATE_SESSIONS) | |
| **instrument** | **string**| Single instrument name | [optional] |
| **instruments** | [**string[]**](../Model/string.md)| Multiple instrument names | [optional] |

### Return type

**\SplFileObject**

### Authorization

[BearerAuth](../../README.md#BearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/octet-stream`, `application/json`

[[Back to top]](#) [[Back to API list]](../../README.md#endpoints)
[[Back to Model list]](../../README.md#models)
[[Back to README]](../../README.md)

## `installInstrument()`

```php
installInstrument($install_file, $instrument_type): \LORISClient\LORISClient\Model\InstallInstrument201Response
```

Install instrument from a LINST file, a BIDS phenotype sidecar (json), or a REDCap data dictionary (csv). Sends instrument_type field (bids/linst/redcap).

### Example

```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');


// Configure Bearer (JWT) authorization: BearerAuth
$config = LORISClient\Configuration::getDefaultConfiguration()->setAccessToken('YOUR_ACCESS_TOKEN');


$apiInstance = new LORISClient\Api\InstrumentManagerApi(
    // If you want use custom http client, pass your client which implements `GuzzleHttp\ClientInterface`.
    // This is optional, `GuzzleHttp\Client` will be used as default.
    new GuzzleHttp\Client(),
    $config
);
$install_file = '/path/to/file.txt'; // \SplFileObject | Instrument definition file to install. Can be a LINST file (.linst), a BIDS JSON sidecar (.json), or a CSV file with one or more REDCap data dictionaries (.csv).
$instrument_type = 'instrument_type_example'; // string | Instrument type — must match the file extension. Client auto-detects: .csv → redcap, .linst → linst, .json → bids

try {
    $result = $apiInstance->installInstrument($install_file, $instrument_type);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling InstrumentManagerApi->installInstrument: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **install_file** | **\SplFileObject****\SplFileObject**| Instrument definition file to install. Can be a LINST file (.linst), a BIDS JSON sidecar (.json), or a CSV file with one or more REDCap data dictionaries (.csv). | |
| **instrument_type** | **string**| Instrument type — must match the file extension. Client auto-detects: .csv → redcap, .linst → linst, .json → bids | |

### Return type

[**\LORISClient\LORISClient\Model\InstallInstrument201Response**](../Model/InstallInstrument201Response.md)

### Authorization

[BearerAuth](../../README.md#BearerAuth)

### HTTP request headers

- **Content-Type**: `multipart/form-data`
- **Accept**: `application/json`

[[Back to top]](#) [[Back to API list]](../../README.md#endpoints)
[[Back to Model list]](../../README.md#models)
[[Back to README]](../../README.md)

## `uploadInstrumentData()`

```php
uploadInstrumentData($action, $format, $data_file, $strict, $instrument, $multi_instrument): \LORISClient\LORISClient\Model\UploadInstrumentData200Response
```

Bulk upload instrument data from CSV or TSV file. Sends format (LORIS_CSV/REDCAP_CSV/BIDS_TSV) and strict (true/false) fields. Client auto-detects REDCap CSV via redcap_event_name column.

### Example

```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');


// Configure Bearer (JWT) authorization: BearerAuth
$config = LORISClient\Configuration::getDefaultConfiguration()->setAccessToken('YOUR_ACCESS_TOKEN');


$apiInstance = new LORISClient\Api\InstrumentManagerApi(
    // If you want use custom http client, pass your client which implements `GuzzleHttp\ClientInterface`.
    // This is optional, `GuzzleHttp\Client` will be used as default.
    new GuzzleHttp\Client(),
    $config
);
$action = 'action_example'; // string | Either CREATE_SESSIONS or VALIDATE_SESSIONS. VALIDATE_SESSIONS is used when all sessions already exist. Note: BIDS_TSV format cannot be combined with CREATE_SESSIONS.
$format = 'format_example'; // string | Data format of the uploaded file. LORIS_CSV — standard LORIS CSV export REDCAP_CSV — REDCap CSV export (contains redcap_event_name column) BIDS_TSV — BIDS phenotype TSV (tab-separated) Client auto-detects: .tsv → BIDS_TSV, CSV with redcap_event_name → REDCAP_CSV, else → LORIS_CSV
$data_file = '/path/to/file.txt'; // \SplFileObject | CSV or TSV file with instrument data. Headers must match the headers of the set instrument(s).
$strict = false; // bool | Column validation mode. true — all template columns must be present in the uploaded file false — non-essential columns (e.g. _status, _date suffixes) may be missing Pipeline always sends false.
$instrument = 'instrument_example'; // string | Set when a single instrument is selected
$multi_instrument = 'multi_instrument_example'; // string | Set when multiple instruments are selected (JSON array with format [{\\\"value\\\":\\\"instrument1\\\"},{\\\"value\\\":\\\"instrument2\\\"}])

try {
    $result = $apiInstance->uploadInstrumentData($action, $format, $data_file, $strict, $instrument, $multi_instrument);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling InstrumentManagerApi->uploadInstrumentData: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **action** | **string**| Either CREATE_SESSIONS or VALIDATE_SESSIONS. VALIDATE_SESSIONS is used when all sessions already exist. Note: BIDS_TSV format cannot be combined with CREATE_SESSIONS. | |
| **format** | **string**| Data format of the uploaded file. LORIS_CSV — standard LORIS CSV export REDCAP_CSV — REDCap CSV export (contains redcap_event_name column) BIDS_TSV — BIDS phenotype TSV (tab-separated) Client auto-detects: .tsv → BIDS_TSV, CSV with redcap_event_name → REDCAP_CSV, else → LORIS_CSV | |
| **data_file** | **\SplFileObject****\SplFileObject**| CSV or TSV file with instrument data. Headers must match the headers of the set instrument(s). | |
| **strict** | **bool**| Column validation mode. true — all template columns must be present in the uploaded file false — non-essential columns (e.g. _status, _date suffixes) may be missing Pipeline always sends false. | [optional] [default to false] |
| **instrument** | **string**| Set when a single instrument is selected | [optional] |
| **multi_instrument** | **string**| Set when multiple instruments are selected (JSON array with format [{\\\&quot;value\\\&quot;:\\\&quot;instrument1\\\&quot;},{\\\&quot;value\\\&quot;:\\\&quot;instrument2\\\&quot;}]) | [optional] |

### Return type

[**\LORISClient\LORISClient\Model\UploadInstrumentData200Response**](../Model/UploadInstrumentData200Response.md)

### Authorization

[BearerAuth](../../README.md#BearerAuth)

### HTTP request headers

- **Content-Type**: `multipart/form-data`
- **Accept**: `application/json`

[[Back to top]](#) [[Back to API list]](../../README.md#endpoints)
[[Back to Model list]](../../README.md#models)
[[Back to README]](../../README.md)
