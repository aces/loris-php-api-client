# LORISClient\CandidatesApi

Candidate management

All URIs are relative to https://demo.loris.ca/api/v0.0.4-dev, except if the operation defines another base path.

| Method | HTTP request | Description |
| ------------- | ------------- | ------------- |
| [**createCandidate()**](CandidatesApi.md#createCandidate) | **POST** /candidates | Create a new candidate |
| [**getCandidate()**](CandidatesApi.md#getCandidate) | **GET** /candidates/{candid} | Get candidate details |
| [**getCandidates()**](CandidatesApi.md#getCandidates) | **GET** /candidates | Get list of candidates |


## `createCandidate()`

```php
createCandidate($candidateCreateRequest): \LORISClient\LORISClient\Model\CandidateObject
```

Create a new candidate

### Example

```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');


// Configure Bearer (JWT) authorization: BearerAuth
$config = LORISClient\Configuration::getDefaultConfiguration()->setAccessToken('YOUR_ACCESS_TOKEN');


$apiInstance = new LORISClient\Api\CandidatesApi(
    // If you want use custom http client, pass your client which implements `GuzzleHttp\ClientInterface`.
    // This is optional, `GuzzleHttp\Client` will be used as default.
    new GuzzleHttp\Client(),
    $config
);
$candidateCreateRequest = new \LORISClient\LORISClient\Model\CandidateCreateRequest(); // \LORISClient\LORISClient\Model\CandidateCreateRequest

try {
    $result = $apiInstance->createCandidate($candidateCreateRequest);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling CandidatesApi->createCandidate: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **candidateCreateRequest** | [**\LORISClient\LORISClient\Model\CandidateCreateRequest**](../Model/CandidateCreateRequest.md)|  | |

### Return type

[**\LORISClient\LORISClient\Model\CandidateObject**](../Model/CandidateObject.md)

### Authorization

[BearerAuth](../../README.md#BearerAuth)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`

[[Back to top]](#) [[Back to API list]](../../README.md#endpoints)
[[Back to Model list]](../../README.md#models)
[[Back to README]](../../README.md)

## `getCandidate()`

```php
getCandidate($candid): \LORISClient\LORISClient\Model\CandidateObject
```

Get candidate details

### Example

```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');


// Configure Bearer (JWT) authorization: BearerAuth
$config = LORISClient\Configuration::getDefaultConfiguration()->setAccessToken('YOUR_ACCESS_TOKEN');


$apiInstance = new LORISClient\Api\CandidatesApi(
    // If you want use custom http client, pass your client which implements `GuzzleHttp\ClientInterface`.
    // This is optional, `GuzzleHttp\Client` will be used as default.
    new GuzzleHttp\Client(),
    $config
);
$candid = 'candid_example'; // string

try {
    $result = $apiInstance->getCandidate($candid);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling CandidatesApi->getCandidate: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **candid** | **string**|  | |

### Return type

[**\LORISClient\LORISClient\Model\CandidateObject**](../Model/CandidateObject.md)

### Authorization

[BearerAuth](../../README.md#BearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`

[[Back to top]](#) [[Back to API list]](../../README.md#endpoints)
[[Back to Model list]](../../README.md#models)
[[Back to README]](../../README.md)

## `getCandidates()`

```php
getCandidates(): \LORISClient\LORISClient\Model\CandidatesResponse
```

Get list of candidates

### Example

```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');


// Configure Bearer (JWT) authorization: BearerAuth
$config = LORISClient\Configuration::getDefaultConfiguration()->setAccessToken('YOUR_ACCESS_TOKEN');


$apiInstance = new LORISClient\Api\CandidatesApi(
    // If you want use custom http client, pass your client which implements `GuzzleHttp\ClientInterface`.
    // This is optional, `GuzzleHttp\Client` will be used as default.
    new GuzzleHttp\Client(),
    $config
);

try {
    $result = $apiInstance->getCandidates();
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling CandidatesApi->getCandidates: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**\LORISClient\LORISClient\Model\CandidatesResponse**](../Model/CandidatesResponse.md)

### Authorization

[BearerAuth](../../README.md#BearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`

[[Back to top]](#) [[Back to API list]](../../README.md#endpoints)
[[Back to Model list]](../../README.md#models)
[[Back to README]](../../README.md)
