# LORIS PHP API Client

PHP client for LORIS REST API. Authentication via JWT.

## Installation

```bash
composer require aces/loris-php-api-client
```

## Dynamic API Version

```php
<?php
require_once __DIR__ . '/vendor/autoload.php';

use LORISClient\Configuration;

$baseUrl    = 'https://your-loris.ca';
$apiVersion = 'v0.0.4-dev';  // v0.0.3 | v0.0.3-dev | v0.0.4-dev | v0.0.4

$config = Configuration::getDefaultConfiguration()
    ->setHost("{$baseUrl}/api/{$apiVersion}");
```

## Authentication API

```php
use LORISClient\Api\AuthenticationApi;
use LORISClient\Model\LoginRequest;
use GuzzleHttp\Client;

$authApi = new AuthenticationApi(new Client(), $config);

$response = $authApi->login(new LoginRequest([
    'username' => 'user',
    'password' => 'pass'
]));

$config->setAccessToken($response->getToken());
```

## InstrumentManager API

```php
use LORISClient\Api\InstrumentManagerApi;
use SplFileObject;

$api = new InstrumentManagerApi(new Client(), $config);

// Install instrument (LINST or REDCap CSV)
$api->installInstrument(new SplFileObject('instrument.linst'));

// Get expected CSV headers
$headers = $api->getInstrumentDataHeaders('CREATE_SESSIONS', 'demographics');

// Upload data - CREATE_SESSIONS (creates missing candidates/sessions)
$result = $api->uploadInstrumentData(
    'CREATE_SESSIONS',
    'demographics',
    null,
    new SplFileObject('data.csv')
);

// Upload data - VALIDATE_SESSIONS (requires existing candidates/sessions)
$result = $api->uploadInstrumentData(
    'VALIDATE_SESSIONS',
    'demographics',
    null,
    new SplFileObject('data.csv')
);

// Check result
if ($result->getSuccess()) {
    echo $result->getMessage();
    foreach ($result->getIdMapping() ?? [] as $map) {
        echo "{$map->getExtStudyId()} → {$map->getCandId()}\n";
    }
}
```

## API Reference

### AuthenticationApi
| Method | HTTP | Endpoint | Description |
|--------|------|----------|-------------|
| `login()` | POST | `/login` | Get JWT token |

### InstrumentManagerApi
| Method | HTTP | Endpoint | Description |
|--------|------|----------|-------------|
| `installInstrument()` | POST | `/instrument_manager` | Install LINST/REDCap instrument |
| `getInstrumentDataHeaders()` | GET | `/instrument_manager/instrument_data` | Get expected CSV headers |
| `uploadInstrumentData()` | POST | `/instrument_manager/instrument_data` | Bulk upload CSV data |

### CandidatesApi
| Method | HTTP | Endpoint | Description |
|--------|------|----------|-------------|
| `getCandidates()` | GET | `/candidates` | List all candidates |
| `getCandidate()` | GET | `/candidates/{candid}` | Get candidate details |
| `createCandidate()` | POST | `/candidates` | Create new candidate |

### VisitsApi
| Method | HTTP | Endpoint | Description |
|--------|------|----------|-------------|
| `getVisit()` | GET | `/candidates/{candid}/{visit}` | Get visit details |
| `createVisit()` | PUT | `/candidates/{candid}/{visit}` | Create new visit |

### InstrumentsApi
| Method | HTTP | Endpoint | Description |
|--------|------|----------|-------------|
| `getVisitInstruments()` | GET | `/candidates/{candid}/{visit}/instruments` | List visit instruments |
| `getInstrumentData()` | GET | `/candidates/{candid}/{visit}/instruments/{instrument}` | Get instrument data |
| `putInstrumentData()` | PUT | `/candidates/{candid}/{visit}/instruments/{instrument}` | Replace instrument data |
| `patchInstrumentData()` | PATCH | `/candidates/{candid}/{visit}/instruments/{instrument}` | Update instrument data |

### ProjectsApi
| Method | HTTP | Endpoint | Description |
|--------|------|----------|-------------|
| `getProjects()` | GET | `/projects` | List projects |
| `getProject()` | GET | `/projects/{project}` | Get project details |
| `getProjectInstruments()` | GET | `/projects/{project}/instruments` | List project instruments |

### SitesApi
| Method | HTTP | Endpoint | Description |
|--------|------|----------|-------------|
| `getSites()` | GET | `/sites` | List sites |

## Models

### Request Models
| Model | Usage |
|-------|-------|
| `LoginRequest` | Authentication credentials |
| `CandidateCreateRequest` | New candidate data |
| `VisitCreateRequest` | New visit data |
| `InstrumentDataRequest` | Instrument data update |

### Response Models
| Model | Usage |
|-------|-------|
| `LoginResponse` | JWT token |
| `CandidateObject` | Candidate details |
| `CandidatesResponse` | List of candidates |
| `VisitObject` | Visit details |
| `InstrumentData` | Instrument data (Meta + Data) |
| `InstrumentDataResponse` | Bulk upload result (success, message, idMapping) |
| `IdMapping` | PSCID → CandID mapping |
| `ProjectResponse` | Project with instruments |
| `SitesResponse` | List of sites |
| `ErrorResponse` | Error message |
| `SuccessResponse` | Success confirmation |

## Regenerate Client

```bash
# Using Docker (recommended)
USE_DOCKER=1 ./generate.sh

# Using local OpenAPI Generator
./generate.sh

# Clean regenerate
./generate.sh --clean
```

### generate.sh

The script:
1. Reads `schema.yml` and `openapi-config.json`
2. Generates PHP client to `lib/`

## Upload Actions

| Action | Behavior |
|--------|----------|
| `CREATE_SESSIONS` | Creates candidates/sessions if missing |
| `VALIDATE_SESSIONS` | Fails if candidate/session doesn't exist |

---

[OpenAPI Generator](https://openapi-generator.tech)