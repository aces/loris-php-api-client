# LORISClient\ClinicalApi

Clinical data operations

All URIs are relative to https://localhost/api/v0.0.4, except if the operation defines another base path.

| Method | HTTP request | Description |
| ------------- | ------------- | ------------- |
| [**createCandidate()**](ClinicalApi.md#createCandidate) | **POST** /candidates | Create a new candidate |
| [**createTimepoint()**](ClinicalApi.md#createTimepoint) | **PUT** /candidates/{candID}/{visitLabel} | Create timepoint/visit |
| [**getCandidate()**](ClinicalApi.md#getCandidate) | **GET** /candidates/{candID} | Get candidate details |
| [**getCandidates()**](ClinicalApi.md#getCandidates) | **GET** /candidates | Get list of candidates |
| [**getInstrumentData()**](ClinicalApi.md#getInstrumentData) | **GET** /candidates/{candID}/{visitLabel}/instruments/{instrument} | Get instrument data |
| [**getInstruments()**](ClinicalApi.md#getInstruments) | **GET** /instruments | Get list of instruments |
| [**getVisit()**](ClinicalApi.md#getVisit) | **GET** /candidates/{candID}/{visitLabel} | Get visit/timepoint information |
| [**uploadInstrumentCSV()**](ClinicalApi.md#uploadInstrumentCSV) | **POST** /instrument_manager/instrument_data | Upload instrument CSV file |
| [**uploadInstrumentData()**](ClinicalApi.md#uploadInstrumentData) | **PUT** /candidates/{candID}/{visitLabel}/instruments/{instrument} | Upload instrument data |


## `createCandidate()`

```php
createCandidate($candidateCreate): \LORISClient\LORISClient\Model\CreateCandidate201Response
```

Create a new candidate

Create a new candidate record in LORIS

### Example

```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');


// Configure Bearer (JWT) authorization: BearerAuth
$config = LORISClient\Configuration::getDefaultConfiguration()->setAccessToken('YOUR_ACCESS_TOKEN');


$apiInstance = new LORISClient\Api\ClinicalApi(
    // If you want use custom http client, pass your client which implements `GuzzleHttp\ClientInterface`.
    // This is optional, `GuzzleHttp\Client` will be used as default.
    new GuzzleHttp\Client(),
    $config
);
$candidateCreate = new \LORISClient\LORISClient\Model\CandidateCreate(); // \LORISClient\LORISClient\Model\CandidateCreate

try {
    $result = $apiInstance->createCandidate($candidateCreate);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling ClinicalApi->createCandidate: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **candidateCreate** | [**\LORISClient\LORISClient\Model\CandidateCreate**](../Model/CandidateCreate.md)|  | |

### Return type

[**\LORISClient\LORISClient\Model\CreateCandidate201Response**](../Model/CreateCandidate201Response.md)

### Authorization

[BearerAuth](../../README.md#BearerAuth)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`

[[Back to top]](#) [[Back to API list]](../../README.md#endpoints)
[[Back to Model list]](../../README.md#models)
[[Back to README]](../../README.md)

## `createTimepoint()`

```php
createTimepoint($candID, $visitLabel, $visitCreate)
```

Create timepoint/visit

Create a new timepoint for a candidate

### Example

```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');


// Configure Bearer (JWT) authorization: BearerAuth
$config = LORISClient\Configuration::getDefaultConfiguration()->setAccessToken('YOUR_ACCESS_TOKEN');


$apiInstance = new LORISClient\Api\ClinicalApi(
    // If you want use custom http client, pass your client which implements `GuzzleHttp\ClientInterface`.
    // This is optional, `GuzzleHttp\Client` will be used as default.
    new GuzzleHttp\Client(),
    $config
);
$candID = 'candID_example'; // string | Candidate ID
$visitLabel = 'visitLabel_example'; // string | Visit/Timepoint label
$visitCreate = new \LORISClient\LORISClient\Model\VisitCreate(); // \LORISClient\LORISClient\Model\VisitCreate

try {
    $apiInstance->createTimepoint($candID, $visitLabel, $visitCreate);
} catch (Exception $e) {
    echo 'Exception when calling ClinicalApi->createTimepoint: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **candID** | **string**| Candidate ID | |
| **visitLabel** | **string**| Visit/Timepoint label | |
| **visitCreate** | [**\LORISClient\LORISClient\Model\VisitCreate**](../Model/VisitCreate.md)|  | |

### Return type

void (empty response body)

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
getCandidate($candID): \LORISClient\LORISClient\Model\CandidateDetail
```

Get candidate details

Retrieve detailed information about a specific candidate

### Example

```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');


// Configure Bearer (JWT) authorization: BearerAuth
$config = LORISClient\Configuration::getDefaultConfiguration()->setAccessToken('YOUR_ACCESS_TOKEN');


$apiInstance = new LORISClient\Api\ClinicalApi(
    // If you want use custom http client, pass your client which implements `GuzzleHttp\ClientInterface`.
    // This is optional, `GuzzleHttp\Client` will be used as default.
    new GuzzleHttp\Client(),
    $config
);
$candID = 'candID_example'; // string | Candidate ID

try {
    $result = $apiInstance->getCandidate($candID);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling ClinicalApi->getCandidate: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **candID** | **string**| Candidate ID | |

### Return type

[**\LORISClient\LORISClient\Model\CandidateDetail**](../Model/CandidateDetail.md)

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
getCandidates($pSCID, $site, $project): \LORISClient\LORISClient\Model\GetCandidates200Response
```

Get list of candidates

Retrieve all candidates matching the filters

### Example

```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');


// Configure Bearer (JWT) authorization: BearerAuth
$config = LORISClient\Configuration::getDefaultConfiguration()->setAccessToken('YOUR_ACCESS_TOKEN');


$apiInstance = new LORISClient\Api\ClinicalApi(
    // If you want use custom http client, pass your client which implements `GuzzleHttp\ClientInterface`.
    // This is optional, `GuzzleHttp\Client` will be used as default.
    new GuzzleHttp\Client(),
    $config
);
$pSCID = 'pSCID_example'; // string
$site = 'site_example'; // string
$project = 'project_example'; // string

try {
    $result = $apiInstance->getCandidates($pSCID, $site, $project);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling ClinicalApi->getCandidates: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **pSCID** | **string**|  | [optional] |
| **site** | **string**|  | [optional] |
| **project** | **string**|  | [optional] |

### Return type

[**\LORISClient\LORISClient\Model\GetCandidates200Response**](../Model/GetCandidates200Response.md)

### Authorization

[BearerAuth](../../README.md#BearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`

[[Back to top]](#) [[Back to API list]](../../README.md#endpoints)
[[Back to Model list]](../../README.md#models)
[[Back to README]](../../README.md)

## `getInstrumentData()`

```php
getInstrumentData($candID, $visitLabel, $instrument): array<string,mixed>
```

Get instrument data

Retrieve instrument data for a candidate's visit

### Example

```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');


// Configure Bearer (JWT) authorization: BearerAuth
$config = LORISClient\Configuration::getDefaultConfiguration()->setAccessToken('YOUR_ACCESS_TOKEN');


$apiInstance = new LORISClient\Api\ClinicalApi(
    // If you want use custom http client, pass your client which implements `GuzzleHttp\ClientInterface`.
    // This is optional, `GuzzleHttp\Client` will be used as default.
    new GuzzleHttp\Client(),
    $config
);
$candID = 'candID_example'; // string | Candidate ID
$visitLabel = 'visitLabel_example'; // string | Visit/Timepoint label
$instrument = 'instrument_example'; // string | Instrument name

try {
    $result = $apiInstance->getInstrumentData($candID, $visitLabel, $instrument);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling ClinicalApi->getInstrumentData: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **candID** | **string**| Candidate ID | |
| **visitLabel** | **string**| Visit/Timepoint label | |
| **instrument** | **string**| Instrument name | |

### Return type

**array<string,mixed>**

### Authorization

[BearerAuth](../../README.md#BearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`

[[Back to top]](#) [[Back to API list]](../../README.md#endpoints)
[[Back to Model list]](../../README.md#models)
[[Back to README]](../../README.md)

## `getInstruments()`

```php
getInstruments(): \LORISClient\LORISClient\Model\GetInstruments200Response
```

Get list of instruments

Retrieve all available instruments in LORIS

### Example

```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');


// Configure Bearer (JWT) authorization: BearerAuth
$config = LORISClient\Configuration::getDefaultConfiguration()->setAccessToken('YOUR_ACCESS_TOKEN');


$apiInstance = new LORISClient\Api\ClinicalApi(
    // If you want use custom http client, pass your client which implements `GuzzleHttp\ClientInterface`.
    // This is optional, `GuzzleHttp\Client` will be used as default.
    new GuzzleHttp\Client(),
    $config
);

try {
    $result = $apiInstance->getInstruments();
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling ClinicalApi->getInstruments: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**\LORISClient\LORISClient\Model\GetInstruments200Response**](../Model/GetInstruments200Response.md)

### Authorization

[BearerAuth](../../README.md#BearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`

[[Back to top]](#) [[Back to API list]](../../README.md#endpoints)
[[Back to Model list]](../../README.md#models)
[[Back to README]](../../README.md)

## `getVisit()`

```php
getVisit($candID, $visitLabel): \LORISClient\LORISClient\Model\Visit
```

Get visit/timepoint information

Retrieve information about a specific visit for a candidate

### Example

```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');


// Configure Bearer (JWT) authorization: BearerAuth
$config = LORISClient\Configuration::getDefaultConfiguration()->setAccessToken('YOUR_ACCESS_TOKEN');


$apiInstance = new LORISClient\Api\ClinicalApi(
    // If you want use custom http client, pass your client which implements `GuzzleHttp\ClientInterface`.
    // This is optional, `GuzzleHttp\Client` will be used as default.
    new GuzzleHttp\Client(),
    $config
);
$candID = 'candID_example'; // string | Candidate ID
$visitLabel = 'visitLabel_example'; // string | Visit/Timepoint label

try {
    $result = $apiInstance->getVisit($candID, $visitLabel);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling ClinicalApi->getVisit: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **candID** | **string**| Candidate ID | |
| **visitLabel** | **string**| Visit/Timepoint label | |

### Return type

[**\LORISClient\LORISClient\Model\Visit**](../Model/Visit.md)

### Authorization

[BearerAuth](../../README.md#BearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`

[[Back to top]](#) [[Back to API list]](../../README.md#endpoints)
[[Back to Model list]](../../README.md#models)
[[Back to README]](../../README.md)

## `uploadInstrumentCSV()`

```php
uploadInstrumentCSV($instrument, $action, $dataFile): \LORISClient\LORISClient\Model\UploadInstrumentCSV200Response
```

Upload instrument CSV file

Bulk upload instrument data via CSV file

### Example

```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');


// Configure Bearer (JWT) authorization: BearerAuth
$config = LORISClient\Configuration::getDefaultConfiguration()->setAccessToken('YOUR_ACCESS_TOKEN');


$apiInstance = new LORISClient\Api\ClinicalApi(
    // If you want use custom http client, pass your client which implements `GuzzleHttp\ClientInterface`.
    // This is optional, `GuzzleHttp\Client` will be used as default.
    new GuzzleHttp\Client(),
    $config
);
$instrument = 'instrument_example'; // string | Instrument name
$action = 'CREATE_SESSIONS'; // string
$dataFile = '/path/to/file.txt'; // \SplFileObject | CSV file with instrument data

try {
    $result = $apiInstance->uploadInstrumentCSV($instrument, $action, $dataFile);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling ClinicalApi->uploadInstrumentCSV: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **instrument** | **string**| Instrument name | |
| **action** | **string**|  | [default to &#39;CREATE_SESSIONS&#39;] |
| **dataFile** | **\SplFileObject****\SplFileObject**| CSV file with instrument data | |

### Return type

[**\LORISClient\LORISClient\Model\UploadInstrumentCSV200Response**](../Model/UploadInstrumentCSV200Response.md)

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
uploadInstrumentData($candID, $visitLabel, $instrument, $requestBody)
```

Upload instrument data

Upload or update instrument data for a candidate's visit

### Example

```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');


// Configure Bearer (JWT) authorization: BearerAuth
$config = LORISClient\Configuration::getDefaultConfiguration()->setAccessToken('YOUR_ACCESS_TOKEN');


$apiInstance = new LORISClient\Api\ClinicalApi(
    // If you want use custom http client, pass your client which implements `GuzzleHttp\ClientInterface`.
    // This is optional, `GuzzleHttp\Client` will be used as default.
    new GuzzleHttp\Client(),
    $config
);
$candID = 'candID_example'; // string | Candidate ID
$visitLabel = 'visitLabel_example'; // string | Visit/Timepoint label
$instrument = 'instrument_example'; // string | Instrument name
$requestBody = NULL; // array<string,mixed>

try {
    $apiInstance->uploadInstrumentData($candID, $visitLabel, $instrument, $requestBody);
} catch (Exception $e) {
    echo 'Exception when calling ClinicalApi->uploadInstrumentData: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **candID** | **string**| Candidate ID | |
| **visitLabel** | **string**| Visit/Timepoint label | |
| **instrument** | **string**| Instrument name | |
| **requestBody** | [**array<string,mixed>**](../Model/mixed.md)|  | |

### Return type

void (empty response body)

### Authorization

[BearerAuth](../../README.md#BearerAuth)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`

[[Back to top]](#) [[Back to API list]](../../README.md#endpoints)
[[Back to Model list]](../../README.md#models)
[[Back to README]](../../README.md)
