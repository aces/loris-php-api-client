# LORISClient\AuthenticationApi

JWT authentication

All URIs are relative to http://http:, except if the operation defines another base path.

| Method | HTTP request | Description |
| ------------- | ------------- | ------------- |
| [**login()**](AuthenticationApi.md#login) | **POST** /login | Authenticate and obtain JWT token |


## `login()`

```php
login($loginRequest): \LORISClient\LORISClient\Model\LoginResponse
```

Authenticate and obtain JWT token

### Example

```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');



$apiInstance = new LORISClient\Api\AuthenticationApi(
    // If you want use custom http client, pass your client which implements `GuzzleHttp\ClientInterface`.
    // This is optional, `GuzzleHttp\Client` will be used as default.
    new GuzzleHttp\Client()
);
$loginRequest = new \LORISClient\LORISClient\Model\LoginRequest(); // \LORISClient\LORISClient\Model\LoginRequest

try {
    $result = $apiInstance->login($loginRequest);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling AuthenticationApi->login: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **loginRequest** | [**\LORISClient\LORISClient\Model\LoginRequest**](../Model/LoginRequest.md)|  | |

### Return type

[**\LORISClient\LORISClient\Model\LoginResponse**](../Model/LoginResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`

[[Back to top]](#) [[Back to API list]](../../README.md#endpoints)
[[Back to Model list]](../../README.md#models)
[[Back to README]](../../README.md)
