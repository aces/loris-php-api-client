# LORISClient\InstrumentManagerApi

Bulk CSV upload (used by ClinicalPipeline)

All URIs are relative to https://demo.loris.ca/api/v0.0.4-dev, except if the operation defines another base path.

| Method | HTTP request | Description |
| ------------- | ------------- | ------------- |
| [**createInstrument()**](InstrumentManagerApi.md#createInstrument) | **POST** /instrument_manager | Create instrument from LINST or REDCap data dictionary |
| [**getInstrumentDataHeaders()**](InstrumentManagerApi.md#getInstrumentDataHeaders) | **GET** /instrument_manager/instrument_data | Get expected CSV headers for instrument data |
| [**uploadInstrumentData()**](InstrumentManagerApi.md#uploadInstrumentData) | **POST** /instrument_manager/instrument_data | Bulk insert instrument data from CSV |


## `createInstrument()`

```php
createInstrument($installFile): \LORISClient\LORISClient\Model\SuccessResponse
```

Create instrument from LINST or REDCap data dictionary

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
$installFile = '/path/to/file.txt'; // \SplFileObject | LINST file or REDCap CSV

try {
    $result = $apiInstance->createInstrument($installFile);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling InstrumentManagerApi->createInstrument: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **installFile** | **\SplFileObject****\SplFileObject**| LINST file or REDCap CSV | [optional] |

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

## `getInstrumentDataHeaders()`

```php
getInstrumentDataHeaders($action, $instrument, $instruments): \SplFileObject
```

Get expected CSV headers for instrument data

Returns CSV with expected headers for the specified instrument(s). Either \"instrument\" OR \"instruments\" must be set, not both.

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
$action = 'action_example'; // string | CREATE_SESSIONS or VALIDATE_SESSIONS
$instrument = 'instrument_example'; // string | Single instrument name
$instruments = 'instruments_example'; // string | Multiple instrument names (comma-separated)

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
| **action** | **string**| CREATE_SESSIONS or VALIDATE_SESSIONS | |
| **instrument** | **string**| Single instrument name | [optional] |
| **instruments** | **string**| Multiple instrument names (comma-separated) | [optional] |

### Return type

**\SplFileObject**

### Authorization

[BearerAuth](../../README.md#BearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/octet-stream`

[[Back to top]](#) [[Back to API list]](../../README.md#endpoints)
[[Back to Model list]](../../README.md#models)
[[Back to README]](../../README.md)

## `uploadInstrumentData()`

```php
uploadInstrumentData($action, $dataFile, $instrument, $multiInstrument): \LORISClient\LORISClient\Model\InstrumentDataResponse
```

Bulk insert instrument data from CSV

Upload CSV file to insert data for one or more instruments. CREATE_SESSIONS mode will create candidates/sessions if they don't exist. VALIDATE_SESSIONS mode requires all sessions to already exist.

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
$action = 'action_example'; // string | CREATE_SESSIONS creates missing candidates/sessions
$dataFile = '/path/to/file.txt'; // \SplFileObject | CSV with instrument data (headers must match)
$instrument = 'instrument_example'; // string | Single instrument name
$multiInstrument = 'multiInstrument_example'; // string | Multiple instruments flag

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
| **action** | **string**| CREATE_SESSIONS creates missing candidates/sessions | |
| **dataFile** | **\SplFileObject****\SplFileObject**| CSV with instrument data (headers must match) | |
| **instrument** | **string**| Single instrument name | [optional] |
| **multiInstrument** | **string**| Multiple instruments flag | [optional] |

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
