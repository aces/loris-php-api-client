# LORISClient\InstrumentManagerApi

Instrument installation and bulk data operations: - Install instruments from LINST/REDCap files - Bulk upload instrument data via CSV - Get expected CSV headers

All URIs are relative to https://demo.loris.ca/api/v0.0.4-dev, except if the operation defines another base path.

| Method | HTTP request | Description |
| ------------- | ------------- | ------------- |
| [**getInstrumentDataHeaders()**](InstrumentManagerApi.md#getInstrumentDataHeaders) | **GET** /instrument_manager/instrument_data | Get expected CSV headers for instrument data ingestion |
| [**installInstrument()**](InstrumentManagerApi.md#installInstrument) | **POST** /instrument_manager | Install instrument from LINST file or REDCap data dictionary |
| [**uploadInstrumentData()**](InstrumentManagerApi.md#uploadInstrumentData) | **POST** /instrument_manager/instrument_data | Bulk insert instrument data from CSV file |


## `getInstrumentDataHeaders()`

```php
getInstrumentDataHeaders($action, $instrument, $instruments): \SplFileObject
```

Get expected CSV headers for instrument data ingestion

Generates and returns a CSV file with the expected headers for the specified instrument(s). Either \"instrument\" OR \"instruments\" must be set, not both.

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
$action = 'action_example'; // string | - CREATE_SESSIONS: For when sessions may need to be created - VALIDATE_SESSIONS: For when all sessions must already exist
$instrument = 'instrument_example'; // string | Single instrument name (mutually exclusive with instruments)
$instruments = 'instruments_example'; // string | Multiple instrument names, comma-separated (mutually exclusive with instrument)

try {
    $result = $apiInstance->getInstrumentDataHeaders($action, $instrument, $instruments);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling InstrumentManagerApi->getInstrumentDataHeaders: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **action** | **string**| - CREATE_SESSIONS: For when sessions may need to be created - VALIDATE_SESSIONS: For when all sessions must already exist | |
| **instrument** | **string**| Single instrument name (mutually exclusive with instruments) | [optional] |
| **instruments** | **string**| Multiple instrument names, comma-separated (mutually exclusive with instrument) | [optional] |

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
installInstrument($installFile): \LORISClient\LORISClient\Model\SuccessResponse
```

Install instrument from LINST file or REDCap data dictionary

Creates/installs a new instrument in LORIS from either: - A LINST file (.linst) - A CSV file with one or more REDCap data dictionaries

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
$installFile = '/path/to/file.txt'; // \SplFileObject | Instrument definition file to install: - LINST file (.linst) - CSV with REDCap data dictionary

try {
    $result = $apiInstance->installInstrument($installFile);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling InstrumentManagerApi->installInstrument: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **installFile** | **\SplFileObject****\SplFileObject**| Instrument definition file to install: - LINST file (.linst) - CSV with REDCap data dictionary | |

### Return type

[**\LORISClient\LORISClient\Model\SuccessResponse**](../Model/SuccessResponse.md)

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
uploadInstrumentData($action, $dataFile, $instrument, $multiInstrument): \LORISClient\LORISClient\Model\InstrumentDataResponse
```

Bulk insert instrument data from CSV file

Uploads a CSV file to insert data for one or more instruments.  Actions: - CREATE_SESSIONS: Creates candidates and sessions if they don't exist - VALIDATE_SESSIONS: Requires all candidates/sessions to already exist  CSV must have columns: PSCID, Visit_label, plus instrument fields.

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
$action = 'action_example'; // string | - CREATE_SESSIONS: Creates candidates/sessions if missing - VALIDATE_SESSIONS: Fails if any candidate/session doesn't exist
$dataFile = '/path/to/file.txt'; // \SplFileObject | CSV file with instrument data (must include PSCID, Visit_label columns)
$instrument = 'instrument_example'; // string | Single instrument name
$multiInstrument = 'multiInstrument_example'; // string | Set to \\\"true\\\" when uploading multi-instrument CSV

try {
    $result = $apiInstance->uploadInstrumentData($action, $dataFile, $instrument, $multiInstrument);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling InstrumentManagerApi->uploadInstrumentData: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **action** | **string**| - CREATE_SESSIONS: Creates candidates/sessions if missing - VALIDATE_SESSIONS: Fails if any candidate/session doesn&#39;t exist | |
| **dataFile** | **\SplFileObject****\SplFileObject**| CSV file with instrument data (must include PSCID, Visit_label columns) | |
| **instrument** | **string**| Single instrument name | [optional] |
| **multiInstrument** | **string**| Set to \\\&quot;true\\\&quot; when uploading multi-instrument CSV | [optional] |

### Return type

[**\LORISClient\LORISClient\Model\InstrumentDataResponse**](../Model/InstrumentDataResponse.md)

### Authorization

[BearerAuth](../../README.md#BearerAuth)

### HTTP request headers

- **Content-Type**: `multipart/form-data`
- **Accept**: `application/json`

[[Back to top]](#) [[Back to API list]](../../README.md#endpoints)
[[Back to Model list]](../../README.md#models)
[[Back to README]](../../README.md)
