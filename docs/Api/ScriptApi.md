# LORISClient\ScriptApi



All URIs are relative to https://demo.loris.ca/api/v0.0.4-dev, except if the operation defines another base path.

| Method | HTTP request | Description |
| ------------- | ------------- | ------------- |
| [**runBidsImport()**](ScriptApi.md#runBidsImport) | **POST** /cbigr_api/script/bidsimport | Import BIDS dataset into LORIS |
| [**runTarchiveLoader()**](ScriptApi.md#runTarchiveLoader) | **POST** /cbigr_api/script/tarchiveloader | Load DICOM tarchive into LORIS |


## `runBidsImport()`

```php
runBidsImport($bids_import_request): \LORISClient\LORISClient\Model\ScriptSyncResponse
```

Import BIDS dataset into LORIS

Executes import_bids_dataset.py to import a BIDS dataset into LORIS.

### Example

```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');


// Configure Bearer (JWT) authorization: BearerAuth
$config = LORISClient\Configuration::getDefaultConfiguration()->setAccessToken('YOUR_ACCESS_TOKEN');


$apiInstance = new LORISClient\Api\ScriptApi(
    // If you want use custom http client, pass your client which implements `GuzzleHttp\ClientInterface`.
    // This is optional, `GuzzleHttp\Client` will be used as default.
    new GuzzleHttp\Client(),
    $config
);
$bids_import_request = new \LORISClient\LORISClient\Model\BidsImportRequest(); // \LORISClient\LORISClient\Model\BidsImportRequest

try {
    $result = $apiInstance->runBidsImport($bids_import_request);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling ScriptApi->runBidsImport: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **bids_import_request** | [**\LORISClient\LORISClient\Model\BidsImportRequest**](../Model/BidsImportRequest.md)|  | |

### Return type

[**\LORISClient\LORISClient\Model\ScriptSyncResponse**](../Model/ScriptSyncResponse.md)

### Authorization

[BearerAuth](../../README.md#BearerAuth)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`

[[Back to top]](#) [[Back to API list]](../../README.md#endpoints)
[[Back to Model list]](../../README.md#models)
[[Back to README]](../../README.md)

## `runTarchiveLoader()`

```php
runTarchiveLoader($tarchive_loader_request): \LORISClient\LORISClient\Model\ScriptSyncResponse
```

Load DICOM tarchive into LORIS

Executes tarchiveLoader.pl to process a DICOM archive.

### Example

```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');


// Configure Bearer (JWT) authorization: BearerAuth
$config = LORISClient\Configuration::getDefaultConfiguration()->setAccessToken('YOUR_ACCESS_TOKEN');


$apiInstance = new LORISClient\Api\ScriptApi(
    // If you want use custom http client, pass your client which implements `GuzzleHttp\ClientInterface`.
    // This is optional, `GuzzleHttp\Client` will be used as default.
    new GuzzleHttp\Client(),
    $config
);
$tarchive_loader_request = new \LORISClient\LORISClient\Model\TarchiveLoaderRequest(); // \LORISClient\LORISClient\Model\TarchiveLoaderRequest

try {
    $result = $apiInstance->runTarchiveLoader($tarchive_loader_request);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling ScriptApi->runTarchiveLoader: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **tarchive_loader_request** | [**\LORISClient\LORISClient\Model\TarchiveLoaderRequest**](../Model/TarchiveLoaderRequest.md)|  | |

### Return type

[**\LORISClient\LORISClient\Model\ScriptSyncResponse**](../Model/ScriptSyncResponse.md)

### Authorization

[BearerAuth](../../README.md#BearerAuth)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`

[[Back to top]](#) [[Back to API list]](../../README.md#endpoints)
[[Back to Model list]](../../README.md#models)
[[Back to README]](../../README.md)
