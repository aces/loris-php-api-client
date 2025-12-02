# LORISClient\InstrumentDataApi



All URIs are relative to http://localhost, except if the operation defines another base path.

| Method | HTTP request | Description |
| ------------- | ------------- | ------------- |
| [**instrumentManagerInstrumentDataGet()**](InstrumentDataApi.md#instrumentManagerInstrumentDataGet) | **GET** /instrument_manager/instrument_data | Generate CSV headers for one or more instruments |
| [**instrumentManagerInstrumentDataPost()**](InstrumentDataApi.md#instrumentManagerInstrumentDataPost) | **POST** /instrument_manager/instrument_data | Upload CSV to insert instrument data |


## `instrumentManagerInstrumentDataGet()`

```php
instrumentManagerInstrumentDataGet($action, $instrument, $instruments): \SplFileObject
```

Generate CSV headers for one or more instruments

Either `instrument` or `instruments` must be set, not both.

### Example

```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');



$apiInstance = new LORISClient\Api\InstrumentDataApi(
    // If you want use custom http client, pass your client which implements `GuzzleHttp\ClientInterface`.
    // This is optional, `GuzzleHttp\Client` will be used as default.
    new GuzzleHttp\Client()
);
$action = 'action_example'; // string | Either CREATE_SESSIONS or VALIDATE_SESSIONS. The latter is used when all sessions already exist.
$instrument = 'instrument_example'; // string | Single instrument name
$instruments = 'instruments_example'; // string | Comma-separated list of instruments

try {
    $result = $apiInstance->instrumentManagerInstrumentDataGet($action, $instrument, $instruments);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling InstrumentDataApi->instrumentManagerInstrumentDataGet: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **action** | **string**| Either CREATE_SESSIONS or VALIDATE_SESSIONS. The latter is used when all sessions already exist. | |
| **instrument** | **string**| Single instrument name | [optional] |
| **instruments** | **string**| Comma-separated list of instruments | [optional] |

### Return type

**\SplFileObject**

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/octet-stream`

[[Back to top]](#) [[Back to API list]](../../README.md#endpoints)
[[Back to Model list]](../../README.md#models)
[[Back to README]](../../README.md)

## `instrumentManagerInstrumentDataPost()`

```php
instrumentManagerInstrumentDataPost($action, $dataFile, $instrument, $multiInstrument): \LORISClient\LORISClient\Model\InstrumentManagerInstrumentDataPost200Response
```

Upload CSV to insert instrument data

CREATE_SESSIONS: creates missing candidates/sessions.   VALIDATE_SESSIONS: fails if any candidate/session is missing.

### Example

```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');



$apiInstance = new LORISClient\Api\InstrumentDataApi(
    // If you want use custom http client, pass your client which implements `GuzzleHttp\ClientInterface`.
    // This is optional, `GuzzleHttp\Client` will be used as default.
    new GuzzleHttp\Client()
);
$action = 'action_example'; // string | CREATE_SESSIONS: creates missing candidates/sessions. VALIDATE_SESSIONS: fails if missing.
$dataFile = '/path/to/file.txt'; // \SplFileObject | CSV file containing instrument data. Headers must match instrument(s).
$instrument = 'instrument_example'; // string | Single instrument name
$multiInstrument = 'multiInstrument_example'; // string | Set to 'true' if uploading a multi-instrument CSV

try {
    $result = $apiInstance->instrumentManagerInstrumentDataPost($action, $dataFile, $instrument, $multiInstrument);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling InstrumentDataApi->instrumentManagerInstrumentDataPost: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **action** | **string**| CREATE_SESSIONS: creates missing candidates/sessions. VALIDATE_SESSIONS: fails if missing. | |
| **dataFile** | **\SplFileObject****\SplFileObject**| CSV file containing instrument data. Headers must match instrument(s). | |
| **instrument** | **string**| Single instrument name | [optional] |
| **multiInstrument** | **string**| Set to &#39;true&#39; if uploading a multi-instrument CSV | [optional] |

### Return type

[**\LORISClient\LORISClient\Model\InstrumentManagerInstrumentDataPost200Response**](../Model/InstrumentManagerInstrumentDataPost200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: `multipart/form-data`
- **Accept**: `application/json`

[[Back to top]](#) [[Back to API list]](../../README.md#endpoints)
[[Back to Model list]](../../README.md#models)
[[Back to README]](../../README.md)
