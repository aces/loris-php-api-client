# LORISClient\InstrumentManagerApi



All URIs are relative to http://localhost, except if the operation defines another base path.

| Method | HTTP request | Description |
| ------------- | ------------- | ------------- |
| [**instrumentManagerPost()**](InstrumentManagerApi.md#instrumentManagerPost) | **POST** /instrument_manager | Install an instrument from a LINST file or REDCap data dictionary |


## `instrumentManagerPost()`

```php
instrumentManagerPost($installFile): \LORISClient\LORISClient\Model\InstrumentManagerPost201Response
```

Install an instrument from a LINST file or REDCap data dictionary

### Example

```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');



$apiInstance = new LORISClient\Api\InstrumentManagerApi(
    // If you want use custom http client, pass your client which implements `GuzzleHttp\ClientInterface`.
    // This is optional, `GuzzleHttp\Client` will be used as default.
    new GuzzleHttp\Client()
);
$installFile = '/path/to/file.txt'; // \SplFileObject | Instrument to install. Can be a LINST file (.linst) or a CSV with REDCap data dictionary.

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
| **installFile** | **\SplFileObject****\SplFileObject**| Instrument to install. Can be a LINST file (.linst) or a CSV with REDCap data dictionary. | |

### Return type

[**\LORISClient\LORISClient\Model\InstrumentManagerPost201Response**](../Model/InstrumentManagerPost201Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: `multipart/form-data`
- **Accept**: `application/json`

[[Back to top]](#) [[Back to API list]](../../README.md#endpoints)
[[Back to Model list]](../../README.md#models)
[[Back to README]](../../README.md)
