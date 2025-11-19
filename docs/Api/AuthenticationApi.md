# LORISClient\AuthenticationApi

Authentication and token management

All URIs are relative to https://localhost/api/v0.0.4, except if the operation defines another base path.

| Method | HTTP request | Description |
| ------------- | ------------- | ------------- |
| [**authenticate()**](AuthenticationApi.md#authenticate) | **POST** /login | Authenticate and obtain JWT token |


## `authenticate()`

```php
authenticate($authenticateRequest): \LORISClient\LORISClient\Model\Authenticate200Response
```

Authenticate and obtain JWT token

Login to LORIS API with username and password credentials

### Example

```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');



$apiInstance = new LORISClient\Api\AuthenticationApi(
    // If you want use custom http client, pass your client which implements `GuzzleHttp\ClientInterface`.
    // This is optional, `GuzzleHttp\Client` will be used as default.
    new GuzzleHttp\Client()
);
$authenticateRequest = new \LORISClient\LORISClient\Model\AuthenticateRequest(); // \LORISClient\LORISClient\Model\AuthenticateRequest

try {
    $result = $apiInstance->authenticate($authenticateRequest);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling AuthenticationApi->authenticate: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **authenticateRequest** | [**\LORISClient\LORISClient\Model\AuthenticateRequest**](../Model/AuthenticateRequest.md)|  | |

### Return type

[**\LORISClient\LORISClient\Model\Authenticate200Response**](../Model/Authenticate200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`

[[Back to top]](#) [[Back to API list]](../../README.md#endpoints)
[[Back to Model list]](../../README.md#models)
[[Back to README]](../../README.md)
