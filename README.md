# URI Checker

A DART command-line application.

## Purpose

The application is designed to clean-up a CSV file with URIs from any **unaccessible** ones.
As the result, the output CSV file will contain only URIs that are **alive** (or were **alive** at the moment of checking).

### Meanings 

- **unaccessible** - any URI, GET request to which leads to 404 response code. 
- **alive** - any URI, GET request to which leads to 200 response code.

## Installation

1. Install DART according to your platform needs: https://www.dartlang.org/install
2. Clone the repository to your local 

## Execution

1. change directory to the repository on your local machine ```$ cd ~/whenever/uri_checker```
2. pull the dependencies with ```$ pub get```
3. run the app with ```$ dart bin/main.dart -h=http://domain.com -i=path/to/csv/file.csv -o=path/to/new/csv_file.csv```

### Allowed arguments
#### host
Defines HOST to check the URIs against [```-h=url```]

```-h=http://domain.com```
#### input csv
Defines PATH to input CSV file with URIs to check [```-i=path```]

```-i=path/to/csv/file.csv```
#### output csv
Defines output CSV FILE to write the results into [```-o=path```]

```-o=path/to/new/csv_file.csv```

### Tests
Unit tests are available at ```test/``` directory.

All tests could be executed at once by running: ```$ pub run test test/```

## License

Available under a MIT License (see LICENSE file for details).