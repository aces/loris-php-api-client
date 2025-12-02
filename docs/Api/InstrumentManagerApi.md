# LORISClient\InstrumentManagerApi



All URIs are relative to https://demo.loris.ca/api/v0.0.4-dev, except if the operation defines another base path.

| Method | HTTP request | Description |
| ------------- | ------------- | ------------- |
| [**instrumentManagerInstrumentDataGet()**](InstrumentManagerApi.md#instrumentManagerInstrumentDataGet) | **GET** /instrument_manager/instrument_data | Generate expected CSV headers for instrument data ingestion |
| [**instrumentManagerInstrumentDataPost()**](InstrumentManagerApi.md#instrumentManagerInstrumentDataPost) | **POST** /instrument_manager/instrument_data | Bulk insert instrument data from CSV |
| [**instrumentManagerPost()**](InstrumentManagerApi.md#instrumentManagerPost) | **POST** /instrument_manager | Install instrument from LINST file or REDCap CSV |


## `instrumentManagerInstrumentDataGet()`

```php
instrumentManagerInstrumentDataGet($action, $instrument, $instruments): \SplFileObject
```

Generate expected CSV headers for instrument data ingestion

Either `instrument` or `instruments` must be set, not both

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
$action = 'action_example'; // string | CREATE_SESSIONS (creates missing sessions) or VALIDATE_SESSIONS (requires sessions exist)
$instrument = 'instrument_example'; // string | Single instrument name
$instruments = 'instruments_example'; // string | Comma-separated list of instruments

try {
    $result = $apiInstance->instrumentManagerInstrumentDataGet($action, $instrument, $instruments);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling InstrumentManagerApi->instrumentManagerInstrumentDataGet: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **action** | **string**| CREATE_SESSIONS (creates missing sessions) or VALIDATE_SESSIONS (requires sessions exist) | |
| **instrument** | **string**| Single instrument name | [optional] |
| **instruments** | **string**| Comma-separated list of instruments | [optional] |

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

## `instrumentManagerInstrumentDataPost()`

```php
instrumentManagerInstrumentDataPost($action, $dataFile, $instrument, $multiInstrument): \LORISClient\LORISClient\Model\InstrumentDataResponse
```

Bulk insert instrument data from CSV

Actions: - CREATE_SESSIONS: creates candidates/sessions if missing - VALIDATE_SESSIONS: fails if candidate/session doesn't exist

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
$action = 'action_example'; // string
$dataFile = '/path/to/file.txt'; // \SplFileObject
$instrument = 'instrument_example'; // string
$multiInstrument = 'multiInstrument_example'; // string

try {
    $result = $apiInstance->instrumentManagerInstrumentDataPost($action, $dataFile, $instrument, $multiInstrument);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling InstrumentManagerApi->instrumentManagerInstrumentDataPost: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **action** | **string**|  | |
| **dataFile** | **\SplFileObject****\SplFileObject**|  | |
| **instrument** | **string**|  | [optional] |
| **multiInstrument** | **string**|  | [optional] |

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

## `instrumentManagerPost()`

```php
instrumentManagerPost($installFile): \LORISClient\LORISClient\Model\SuccessResponse
```

Install instrument from LINST file or REDCap CSV

Create/install a new instrument in LORIS from: - LINST file (.linst) - CSV with REDCap data dictionary(s)

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
$installFile = '/path/to/file.txt'; // \SplFileObject | LINST or REDCap CSV instrument

try {
    $result = $apiInstance->instrumentManagerPost($installFile);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling InstrumentManagerApi->instrumentManagerPost: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **installFile** | **\SplFileObject****\SplFileObject**| LINST or REDCap CSV instrument | |

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
