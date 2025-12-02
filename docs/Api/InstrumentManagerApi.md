# LORISClient\InstrumentManagerApi

Instrument installation and bulk data upload. Configure: &#x60;$config-&gt;setHost($baseUrl)&#x60; (no &#x60;/api/{version}&#x60;)

All URIs are relative to http://http:, except if the operation defines another base path.

| Method | HTTP request | Description |
| ------------- | ------------- | ------------- |
| [**getInstrumentDataHeaders()**](InstrumentManagerApi.md#getInstrumentDataHeaders) | **GET** /instrument_manager/instrument_data | Get expected CSV headers for instrument data upload |
| [**installInstrument()**](InstrumentManagerApi.md#installInstrument) | **POST** /instrument_manager | Install instrument from LINST file or REDCap data dictionary |
| [**uploadInstrumentData()**](InstrumentManagerApi.md#uploadInstrumentData) | **POST** /instrument_manager/instrument_data | Bulk upload instrument data from CSV |


## `getInstrumentDataHeaders()`

```php
getInstrumentDataHeaders($action, $instrument, $instruments): string
```

Get expected CSV headers for instrument data upload

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
$instrument = 'instrument_example'; // string
$instruments = 'instruments_example'; // string

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
| **action** | **string**|  | |
| **instrument** | **string**|  | [optional] |
| **instruments** | **string**|  | [optional] |

### Return type

**string**

### Authorization

[BearerAuth](../../README.md#BearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `text/csv`, `application/json`

[[Back to top]](#) [[Back to API list]](../../README.md#endpoints)
[[Back to Model list]](../../README.md#models)
[[Back to README]](../../README.md)

## `installInstrument()`

```php
installInstrument($installFile): \LORISClient\LORISClient\Model\SuccessResponse
```

Install instrument from LINST file or REDCap data dictionary

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
$installFile = '/path/to/file.txt'; // \SplFileObject | LINST file or REDCap CSV to install

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
| **installFile** | **\SplFileObject****\SplFileObject**| LINST file or REDCap CSV to install | |

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

Bulk upload instrument data from CSV

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
$dataFile = '/path/to/file.txt'; // \SplFileObject | CSV file with instrument data
$instrument = 'instrument_example'; // string | Single instrument name
$multiInstrument = 'multiInstrument_example'; // string | Set to \\\"true\\\" for multi-instrument CSV

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
| **action** | **string**|  | |
| **dataFile** | **\SplFileObject****\SplFileObject**| CSV file with instrument data | |
| **instrument** | **string**| Single instrument name | [optional] |
| **multiInstrument** | **string**| Set to \\\&quot;true\\\&quot; for multi-instrument CSV | [optional] |

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
