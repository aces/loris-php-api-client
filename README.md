# OpenAPIClient-php

LORIS REST API and Module endpoints.

## Server Configuration

| Type | Configuration | Endpoints |
|------|---------------|-----------|
| REST API | `setHost(\"{$baseUrl}/api/{$version}\")` | /login, /candidates, /projects, /sites |
| Module | `setHost($baseUrl)` | /instrument_manager/_* |


For more information, please visit [https://github.com/aces/Loris](https://github.com/aces/Loris).

## Installation & Usage

### Requirements

PHP 8.1 and later.

### Composer

To install the bindings via [Composer](https://getcomposer.org/), add the following to `composer.json`:

```json
{
  "repositories": [
    {
      "type": "vcs",
      "url": "https://github.com/aces/loris-php-api-client.git"
    }
  ],
  "require": {
    "aces/loris-php-api-client": "*@dev"
  }
}
```

Then run `composer install`

### Manual Installation

Download the files and include `autoload.php`:

```php
<?php
require_once('/path/to/OpenAPIClient-php/vendor/autoload.php');
```

## Getting Started

Please follow the [installation procedure](#installation--usage) and then run the following:

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

## API Endpoints

All URIs are relative to *http://http:*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*AuthenticationApi* | [**login**](docs/Api/AuthenticationApi.md#login) | **POST** /login | Authenticate and obtain JWT token
*CandidatesApi* | [**createCandidate**](docs/Api/CandidatesApi.md#createcandidate) | **POST** /candidates | Create a new candidate
*CandidatesApi* | [**getCandidate**](docs/Api/CandidatesApi.md#getcandidate) | **GET** /candidates/{candid} | Get candidate details
*CandidatesApi* | [**getCandidates**](docs/Api/CandidatesApi.md#getcandidates) | **GET** /candidates | List all candidates
*InstrumentManagerApi* | [**getInstrumentDataHeaders**](docs/Api/InstrumentManagerApi.md#getinstrumentdataheaders) | **GET** /instrument_manager/instrument_data | Get expected CSV headers for instrument data upload
*InstrumentManagerApi* | [**installInstrument**](docs/Api/InstrumentManagerApi.md#installinstrument) | **POST** /instrument_manager | Install instrument from LINST file or REDCap data dictionary
*InstrumentManagerApi* | [**uploadInstrumentData**](docs/Api/InstrumentManagerApi.md#uploadinstrumentdata) | **POST** /instrument_manager/instrument_data | Bulk upload instrument data from CSV
*InstrumentsApi* | [**getInstrumentData**](docs/Api/InstrumentsApi.md#getinstrumentdata) | **GET** /candidates/{candid}/{visit}/instruments/{instrument} | Get instrument data
*InstrumentsApi* | [**getVisitInstruments**](docs/Api/InstrumentsApi.md#getvisitinstruments) | **GET** /candidates/{candid}/{visit}/instruments | List instruments for a visit
*InstrumentsApi* | [**patchInstrumentData**](docs/Api/InstrumentsApi.md#patchinstrumentdata) | **PATCH** /candidates/{candid}/{visit}/instruments/{instrument} | Update instrument data
*InstrumentsApi* | [**putInstrumentData**](docs/Api/InstrumentsApi.md#putinstrumentdata) | **PUT** /candidates/{candid}/{visit}/instruments/{instrument} | Replace instrument data
*ProjectsApi* | [**getProject**](docs/Api/ProjectsApi.md#getproject) | **GET** /projects/{project} | Get project details
*ProjectsApi* | [**getProjectInstruments**](docs/Api/ProjectsApi.md#getprojectinstruments) | **GET** /projects/{project}/instruments | List project instruments
*ProjectsApi* | [**getProjects**](docs/Api/ProjectsApi.md#getprojects) | **GET** /projects | List projects
*SitesApi* | [**getSites**](docs/Api/SitesApi.md#getsites) | **GET** /sites | List sites
*VisitsApi* | [**createVisit**](docs/Api/VisitsApi.md#createvisit) | **PUT** /candidates/{candid}/{visit} | Create a new visit
*VisitsApi* | [**getVisit**](docs/Api/VisitsApi.md#getvisit) | **GET** /candidates/{candid}/{visit} | Get visit details

## Models

- [CandidateCreateRequest](docs/Model/CandidateCreateRequest.md)
- [CandidateCreateRequestCandidate](docs/Model/CandidateCreateRequestCandidate.md)
- [CandidateObject](docs/Model/CandidateObject.md)
- [CandidatesResponse](docs/Model/CandidatesResponse.md)
- [ErrorResponse](docs/Model/ErrorResponse.md)
- [IdMapping](docs/Model/IdMapping.md)
- [InstrumentData](docs/Model/InstrumentData.md)
- [InstrumentDataMeta](docs/Model/InstrumentDataMeta.md)
- [InstrumentDataRequest](docs/Model/InstrumentDataRequest.md)
- [InstrumentDataRequestMeta](docs/Model/InstrumentDataRequestMeta.md)
- [InstrumentDataResponse](docs/Model/InstrumentDataResponse.md)
- [InstrumentDataResponseMessage](docs/Model/InstrumentDataResponseMessage.md)
- [InstrumentMeta](docs/Model/InstrumentMeta.md)
- [InstrumentsResponse](docs/Model/InstrumentsResponse.md)
- [LoginRequest](docs/Model/LoginRequest.md)
- [LoginResponse](docs/Model/LoginResponse.md)
- [ProjectResponse](docs/Model/ProjectResponse.md)
- [ProjectsResponse](docs/Model/ProjectsResponse.md)
- [Site](docs/Model/Site.md)
- [SitesResponse](docs/Model/SitesResponse.md)
- [SuccessResponse](docs/Model/SuccessResponse.md)
- [VisitCreateRequest](docs/Model/VisitCreateRequest.md)
- [VisitInstrumentsResponse](docs/Model/VisitInstrumentsResponse.md)
- [VisitObject](docs/Model/VisitObject.md)
- [VisitObjectMeta](docs/Model/VisitObjectMeta.md)

## Authorization

Authentication schemes defined for the API:
### BearerAuth

- **Type**: Bearer authentication (JWT)

## Tests

To run the tests, use:

```bash
composer install
vendor/bin/phpunit
```

## Author



## About this package

This PHP package is automatically generated by the [OpenAPI Generator](https://openapi-generator.tech) project:

- API version: `0.0.4-dev`
    - Package version: `0.0.4-dev`
    - Generator version: `7.17.0`
- Build package: `org.openapitools.codegen.languages.PhpClientCodegen`
