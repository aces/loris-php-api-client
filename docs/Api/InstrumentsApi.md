# LORISClient\InstrumentsApi



All URIs are relative to https://demo.loris.ca/api/v0.0.4-dev, except if the operation defines another base path.

| Method | HTTP request | Description |
| ------------- | ------------- | ------------- |
| [**getInstrumentData()**](InstrumentsApi.md#getInstrumentData) | **GET** /candidates/{candid}/{visit}/instruments/{instrument} | Get instrument data for a candidate/visit |
| [**getVisitInstruments()**](InstrumentsApi.md#getVisitInstruments) | **GET** /candidates/{candid}/{visit}/instruments | Get instruments for a visit |
| [**patchInstrumentData()**](InstrumentsApi.md#patchInstrumentData) | **PATCH** /candidates/{candid}/{visit}/instruments/{instrument} | Update instrument data (preserves unspecified fields) |
| [**putInstrumentData()**](InstrumentsApi.md#putInstrumentData) | **PUT** /candidates/{candid}/{visit}/instruments/{instrument} | Replace instrument data (nulls unspecified fields) |


## `getInstrumentData()`

```php
getInstrumentData($candid, $visit, $instrument): \LORISClient\LORISClient\Model\InstrumentData
```

Get instrument data for a candidate/visit

### Example

```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');


// Configure Bearer (JWT) authorization: BearerAuth
$config = LORISClient\Configuration::getDefaultConfiguration()->setAccessToken('YOUR_ACCESS_TOKEN');


$apiInstance = new LORISClient\Api\InstrumentsApi(
    // If you want use custom http client, pass your client which implements `GuzzleHttp\ClientInterface`.
    // This is optional, `GuzzleHttp\Client` will be used as default.
    new GuzzleHttp\Client(),
    $config
);
$candid = 'candid_example'; // string
$visit = 'visit_example'; // string
$instrument = 'instrument_example'; // string

try {
    $result = $apiInstance->getInstrumentData($candid, $visit, $instrument);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling InstrumentsApi->getInstrumentData: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **candid** | **string**|  | |
| **visit** | **string**|  | |
| **instrument** | **string**|  | |

### Return type

[**\LORISClient\LORISClient\Model\InstrumentData**](../Model/InstrumentData.md)

### Authorization

[BearerAuth](../../README.md#BearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`

[[Back to top]](#) [[Back to API list]](../../README.md#endpoints)
[[Back to Model list]](../../README.md#models)
[[Back to README]](../../README.md)

## `getVisitInstruments()`

```php
getVisitInstruments($candid, $visit): \LORISClient\LORISClient\Model\VisitInstrumentsResponse
```

Get instruments for a visit

### Example

```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');


// Configure Bearer (JWT) authorization: BearerAuth
$config = LORISClient\Configuration::getDefaultConfiguration()->setAccessToken('YOUR_ACCESS_TOKEN');


$apiInstance = new LORISClient\Api\InstrumentsApi(
    // If you want use custom http client, pass your client which implements `GuzzleHttp\ClientInterface`.
    // This is optional, `GuzzleHttp\Client` will be used as default.
    new GuzzleHttp\Client(),
    $config
);
$candid = 'candid_example'; // string
$visit = 'visit_example'; // string

try {
    $result = $apiInstance->getVisitInstruments($candid, $visit);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling InstrumentsApi->getVisitInstruments: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **candid** | **string**|  | |
| **visit** | **string**|  | |

### Return type

[**\LORISClient\LORISClient\Model\VisitInstrumentsResponse**](../Model/VisitInstrumentsResponse.md)

### Authorization

[BearerAuth](../../README.md#BearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`

[[Back to top]](#) [[Back to API list]](../../README.md#endpoints)
[[Back to Model list]](../../README.md#models)
[[Back to README]](../../README.md)

## `patchInstrumentData()`

```php
patchInstrumentData($candid, $visit, $instrument, $instrumentDataRequest): \LORISClient\LORISClient\Model\InstrumentData
```

Update instrument data (preserves unspecified fields)

### Example

```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');


// Configure Bearer (JWT) authorization: BearerAuth
$config = LORISClient\Configuration::getDefaultConfiguration()->setAccessToken('YOUR_ACCESS_TOKEN');


$apiInstance = new LORISClient\Api\InstrumentsApi(
    // If you want use custom http client, pass your client which implements `GuzzleHttp\ClientInterface`.
    // This is optional, `GuzzleHttp\Client` will be used as default.
    new GuzzleHttp\Client(),
    $config
);
$candid = 'candid_example'; // string
$visit = 'visit_example'; // string
$instrument = 'instrument_example'; // string
$instrumentDataRequest = new \LORISClient\LORISClient\Model\InstrumentDataRequest(); // \LORISClient\LORISClient\Model\InstrumentDataRequest

try {
    $result = $apiInstance->patchInstrumentData($candid, $visit, $instrument, $instrumentDataRequest);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling InstrumentsApi->patchInstrumentData: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **candid** | **string**|  | |
| **visit** | **string**|  | |
| **instrument** | **string**|  | |
| **instrumentDataRequest** | [**\LORISClient\LORISClient\Model\InstrumentDataRequest**](../Model/InstrumentDataRequest.md)|  | |

### Return type

[**\LORISClient\LORISClient\Model\InstrumentData**](../Model/InstrumentData.md)

### Authorization

[BearerAuth](../../README.md#BearerAuth)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`

[[Back to top]](#) [[Back to API list]](../../README.md#endpoints)
[[Back to Model list]](../../README.md#models)
[[Back to README]](../../README.md)

## `putInstrumentData()`

```php
putInstrumentData($candid, $visit, $instrument, $instrumentDataRequest): \LORISClient\LORISClient\Model\InstrumentData
```

Replace instrument data (nulls unspecified fields)

### Example

```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');


// Configure Bearer (JWT) authorization: BearerAuth
$config = LORISClient\Configuration::getDefaultConfiguration()->setAccessToken('YOUR_ACCESS_TOKEN');


$apiInstance = new LORISClient\Api\InstrumentsApi(
    // If you want use custom http client, pass your client which implements `GuzzleHttp\ClientInterface`.
    // This is optional, `GuzzleHttp\Client` will be used as default.
    new GuzzleHttp\Client(),
    $config
);
$candid = 'candid_example'; // string
$visit = 'visit_example'; // string
$instrument = 'instrument_example'; // string
$instrumentDataRequest = new \LORISClient\LORISClient\Model\InstrumentDataRequest(); // \LORISClient\LORISClient\Model\InstrumentDataRequest

try {
    $result = $apiInstance->putInstrumentData($candid, $visit, $instrument, $instrumentDataRequest);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling InstrumentsApi->putInstrumentData: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **candid** | **string**|  | |
| **visit** | **string**|  | |
| **instrument** | **string**|  | |
| **instrumentDataRequest** | [**\LORISClient\LORISClient\Model\InstrumentDataRequest**](../Model/InstrumentDataRequest.md)|  | |

### Return type

[**\LORISClient\LORISClient\Model\InstrumentData**](../Model/InstrumentData.md)

### Authorization

[BearerAuth](../../README.md#BearerAuth)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`

[[Back to top]](#) [[Back to API list]](../../README.md#endpoints)
[[Back to Model list]](../../README.md#models)
[[Back to README]](../../README.md)
