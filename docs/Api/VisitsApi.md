# LORISClient\VisitsApi

Visit/timepoint management

All URIs are relative to http://http:, except if the operation defines another base path.

| Method | HTTP request | Description |
| ------------- | ------------- | ------------- |
| [**createVisit()**](VisitsApi.md#createVisit) | **PUT** /candidates/{candid}/{visit} | Create a new visit |
| [**getVisit()**](VisitsApi.md#getVisit) | **GET** /candidates/{candid}/{visit} | Get visit details |


## `createVisit()`

```php
createVisit($candid, $visit, $visit_create_request): \LORISClient\LORISClient\Model\VisitObject
```

Create a new visit

### Example

```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');


// Configure Bearer (JWT) authorization: BearerAuth
$config = LORISClient\Configuration::getDefaultConfiguration()->setAccessToken('YOUR_ACCESS_TOKEN');


$apiInstance = new LORISClient\Api\VisitsApi(
    // If you want use custom http client, pass your client which implements `GuzzleHttp\ClientInterface`.
    // This is optional, `GuzzleHttp\Client` will be used as default.
    new GuzzleHttp\Client(),
    $config
);
$candid = 'candid_example'; // string
$visit = 'visit_example'; // string
$visit_create_request = new \LORISClient\LORISClient\Model\VisitCreateRequest(); // \LORISClient\LORISClient\Model\VisitCreateRequest

try {
    $result = $apiInstance->createVisit($candid, $visit, $visit_create_request);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling VisitsApi->createVisit: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **candid** | **string**|  | |
| **visit** | **string**|  | |
| **visit_create_request** | [**\LORISClient\LORISClient\Model\VisitCreateRequest**](../Model/VisitCreateRequest.md)|  | |

### Return type

[**\LORISClient\LORISClient\Model\VisitObject**](../Model/VisitObject.md)

### Authorization

[BearerAuth](../../README.md#BearerAuth)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`

[[Back to top]](#) [[Back to API list]](../../README.md#endpoints)
[[Back to Model list]](../../README.md#models)
[[Back to README]](../../README.md)

## `getVisit()`

```php
getVisit($candid, $visit): \LORISClient\LORISClient\Model\VisitObject
```

Get visit details

### Example

```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');


// Configure Bearer (JWT) authorization: BearerAuth
$config = LORISClient\Configuration::getDefaultConfiguration()->setAccessToken('YOUR_ACCESS_TOKEN');


$apiInstance = new LORISClient\Api\VisitsApi(
    // If you want use custom http client, pass your client which implements `GuzzleHttp\ClientInterface`.
    // This is optional, `GuzzleHttp\Client` will be used as default.
    new GuzzleHttp\Client(),
    $config
);
$candid = 'candid_example'; // string
$visit = 'visit_example'; // string

try {
    $result = $apiInstance->getVisit($candid, $visit);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling VisitsApi->getVisit: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **candid** | **string**|  | |
| **visit** | **string**|  | |

### Return type

[**\LORISClient\LORISClient\Model\VisitObject**](../Model/VisitObject.md)

### Authorization

[BearerAuth](../../README.md#BearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`

[[Back to top]](#) [[Back to API list]](../../README.md#endpoints)
[[Back to Model list]](../../README.md#models)
[[Back to README]](../../README.md)
