# LORISClient\AuthenticationApi



All URIs are relative to https://demo.loris.ca/api/v0.0.4-dev, except if the operation defines another base path.

| Method | HTTP request | Description |
| ------------- | ------------- | ------------- |
| [**loginPost()**](AuthenticationApi.md#loginPost) | **POST** /login | Authenticate and obtain JWT token |


## `loginPost()`

```php
loginPost($loginRequest): \LORISClient\LORISClient\Model\LoginResponse
```

Authenticate and obtain JWT token

### Example

```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');


// Configure Bearer (JWT) authorization: BearerAuth
$config = LORISClient\Configuration::getDefaultConfiguration()->setAccessToken('YOUR_ACCESS_TOKEN');


$apiInstance = new LORISClient\Api\AuthenticationApi(
    // If you want use custom http client, pass your client which implements `GuzzleHttp\ClientInterface`.
    // This is optional, `GuzzleHttp\Client` will be used as default.
    new GuzzleHttp\Client(),
    $config
);
$loginRequest = new \LORISClient\LORISClient\Model\LoginRequest(); // \LORISClient\LORISClient\Model\LoginRequest

try {
    $result = $apiInstance->loginPost($loginRequest);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling AuthenticationApi->loginPost: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **loginRequest** | [**\LORISClient\LORISClient\Model\LoginRequest**](../Model/LoginRequest.md)|  | |

### Return type

[**\LORISClient\LORISClient\Model\LoginResponse**](../Model/LoginResponse.md)

### Authorization

[BearerAuth](../../README.md#BearerAuth)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`

[[Back to top]](#) [[Back to API list]](../../README.md#endpoints)
[[Back to Model list]](../../README.md#models)
[[Back to README]](../../README.md)
