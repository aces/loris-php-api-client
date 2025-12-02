# LORISClient\InstrumentManagerApi

**Module endpoints (non-versioned)**  These endpoints do NOT use the &#x60;/api/{version}&#x60; prefix. Configure client with base URL only.  &#x60;&#x60;&#x60;php // For InstrumentManager, use base URL without /api/{version} $moduleConfig-&gt;setHost(&#39;https://your-loris.ca&#39;); &#x60;&#x60;&#x60;

All URIs are relative to https://demo.loris.ca/api/v0.0.4-dev, except if the operation defines another base path.

| Method | HTTP request | Description |
| ------------- | ------------- | ------------- |
| [**getInstrumentDataHeaders()**](InstrumentManagerApi.md#getInstrumentDataHeaders) | **GET** /instrument_manager/instrument_data | Get expected CSV headers for instrument data upload |
| [**installInstrument()**](InstrumentManagerApi.md#installInstrument) | **POST** /instrument_manager | Install instrument from LINST file or REDCap data dictionary |
| [**uploadInstrumentData()**](InstrumentManagerApi.md#uploadInstrumentData) | **POST** /instrument_manager/instrument_data | Bulk upload instrument data from CSV |


## `getInstrumentDataHeaders()`

```php
getInstrumentDataHeaders($action, $instrument, $instruments): string
```
### URI(s):
- {protocol}://{host} Module endpoint (non-versioned)
    - Variables:
      - protocol:  No description provided
        - Allowed values:
          - http
          - https
        - Default value: https

      - host:  No description provided
        - Default value: demo.loris.ca

Get expected CSV headers for instrument data upload

Returns a CSV template with expected headers for the specified instrument(s). Use either `instrument` (single) or `instruments` (comma-separated), not both.  **Note**: This is a module endpoint. Configure client with base URL only.

### Example

```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');


// Configure Bearer (JWT) authorization: BearerAuth
$config = LORISClient\Configuration::getDefaultConfiguration()->setAccessToken('YOUR_ACCESS_TOKEN');


$apiInstance = new LORISClient\Api\InstrumentManagerApi(
    // If you want use custom http client, pass your client which implements `GuzzleHttp\ClientInterface`.
    // This is optional, `GuzzleHttp\Client` will be used as default.
    new GuzzleHttp\Client(),
    $config
);
$action = 'action_example'; // string | - CREATE_SESSIONS: Headers for creating new candidates/sessions - VALIDATE_SESSIONS: Headers for existing candidates/sessions only
$instrument = 'instrument_example'; // string | Single instrument name
$instruments = 'instruments_example'; // string | Multiple instrument names (comma-separated)

$hostIndex = 0;
$variables = [
    'protocol' => 'YOUR_VALUE',
    'host' => 'YOUR_VALUE',
];

try {
    $result = $apiInstance->getInstrumentDataHeaders($action, $instrument, $instruments, $hostIndex, $variables);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling InstrumentManagerApi->getInstrumentDataHeaders: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **action** | **string**| - CREATE_SESSIONS: Headers for creating new candidates/sessions - VALIDATE_SESSIONS: Headers for existing candidates/sessions only | |
| **instrument** | **string**| Single instrument name | [optional] |
| **instruments** | **string**| Multiple instrument names (comma-separated) | [optional] |
| hostIndex | null|int | Host index. Defaults to null. If null, then the library will use $this->hostIndex instead | [optional] |
| variables | array | Associative array of variables to pass to the host. Defaults to empty array. | [optional] |

### Return type

**string**

### Authorization

[BearerAuth](../../README.md#BearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `text/csv`, `application/json`

[[Back to top]](#) [[Back to API list]](../../README.md#endpoints)
[[Back to Model list]](../../README.md#models)
[[Back to README]](../../README.md)

## `installInstrument()`

```php
installInstrument($installFile): \LORISClient\LORISClient\Model\SuccessResponse
```
### URI(s):
- {protocol}://{host} Module endpoint (non-versioned)
    - Variables:
      - protocol:  No description provided
        - Allowed values:
          - http
          - https
        - Default value: https

      - host:  No description provided
        - Default value: demo.loris.ca

Install instrument from LINST file or REDCap data dictionary

Installs a new instrument in LORIS from either: - A LINST file (.linst) - A CSV file with REDCap data dictionary format  **Note**: This is a module endpoint. Configure client with base URL only, not `/api/{version}`.

### Example

```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');


// Configure Bearer (JWT) authorization: BearerAuth
$config = LORISClient\Configuration::getDefaultConfiguration()->setAccessToken('YOUR_ACCESS_TOKEN');


$apiInstance = new LORISClient\Api\InstrumentManagerApi(
    // If you want use custom http client, pass your client which implements `GuzzleHttp\ClientInterface`.
    // This is optional, `GuzzleHttp\Client` will be used as default.
    new GuzzleHttp\Client(),
    $config
);
$installFile = '/path/to/file.txt'; // \SplFileObject | LINST file or REDCap CSV to install

$hostIndex = 0;
$variables = [
    'protocol' => 'YOUR_VALUE',
    'host' => 'YOUR_VALUE',
];

try {
    $result = $apiInstance->installInstrument($installFile, $hostIndex, $variables);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling InstrumentManagerApi->installInstrument: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **installFile** | **\SplFileObject****\SplFileObject**| LINST file or REDCap CSV to install | |
| hostIndex | null|int | Host index. Defaults to null. If null, then the library will use $this->hostIndex instead | [optional] |
| variables | array | Associative array of variables to pass to the host. Defaults to empty array. | [optional] |

### Return type

[**\LORISClient\LORISClient\Model\SuccessResponse**](../Model/SuccessResponse.md)

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
uploadInstrumentData($action, $dataFile, $instrument, $multiInstrument): \LORISClient\LORISClient\Model\InstrumentDataResponse
```
### URI(s):
- {protocol}://{host} Module endpoint (non-versioned)
    - Variables:
      - protocol:  No description provided
        - Allowed values:
          - http
          - https
        - Default value: https

      - host:  No description provided
        - Default value: demo.loris.ca

Bulk upload instrument data from CSV

Uploads CSV data for one or more instruments.  **Actions**: - `CREATE_SESSIONS`: Creates candidates/sessions if they don't exist - `VALIDATE_SESSIONS`: Fails if any candidate/session is missing  **CSV Requirements**: - Must include `PSCID` and `Visit_label` columns - For single instrument: include instrument field columns - For multi-instrument: set `multi-instrument=true` and include `Instrument` column  **Note**: This is a module endpoint. Configure client with base URL only.

### Example

```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');


// Configure Bearer (JWT) authorization: BearerAuth
$config = LORISClient\Configuration::getDefaultConfiguration()->setAccessToken('YOUR_ACCESS_TOKEN');


$apiInstance = new LORISClient\Api\InstrumentManagerApi(
    // If you want use custom http client, pass your client which implements `GuzzleHttp\ClientInterface`.
    // This is optional, `GuzzleHttp\Client` will be used as default.
    new GuzzleHttp\Client(),
    $config
);
$action = 'action_example'; // string
$dataFile = '/path/to/file.txt'; // \SplFileObject | CSV file with instrument data
$instrument = 'instrument_example'; // string | Single instrument name (omit for multi-instrument)
$multiInstrument = 'multiInstrument_example'; // string | Set to \\\"true\\\" for multi-instrument CSV

$hostIndex = 0;
$variables = [
    'protocol' => 'YOUR_VALUE',
    'host' => 'YOUR_VALUE',
];

try {
    $result = $apiInstance->uploadInstrumentData($action, $dataFile, $instrument, $multiInstrument, $hostIndex, $variables);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling InstrumentManagerApi->uploadInstrumentData: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **action** | **string**|  | |
| **dataFile** | **\SplFileObject****\SplFileObject**| CSV file with instrument data | |
| **instrument** | **string**| Single instrument name (omit for multi-instrument) | [optional] |
| **multiInstrument** | **string**| Set to \\\&quot;true\\\&quot; for multi-instrument CSV | [optional] |
| hostIndex | null|int | Host index. Defaults to null. If null, then the library will use $this->hostIndex instead | [optional] |
| variables | array | Associative array of variables to pass to the host. Defaults to empty array. | [optional] |

### Return type

[**\LORISClient\LORISClient\Model\InstrumentDataResponse**](../Model/InstrumentDataResponse.md)

### Authorization

[BearerAuth](../../README.md#BearerAuth)

### HTTP request headers

- **Content-Type**: `multipart/form-data`
- **Accept**: `application/json`

[[Back to top]](#) [[Back to API list]](../../README.md#endpoints)
[[Back to Model list]](../../README.md#models)
[[Back to README]](../../README.md)
