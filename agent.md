# Keeplist Social Agent

This document outlines the project structure, development workflow, and future plans for the Keeplist Social library. It is intended to be a guide for AI agents and human developers working on this project.

## Project Overview

Keeplist Social is a cross-platform library for validating, sanitizing, and standardizing social media profile URLs and identifiers. It is currently available for TypeScript/JavaScript and Dart/Flutter.

The core functionality of the library includes:

- **URL Validation**: Verifying if a URL is a valid social media profile link.
- **Profile ID Extraction**: Extracting the unique identifier from various URL formats.
- **URL Standardization**: Converting different URL formats to a canonical form.

The library is designed to be extensible, with new platforms being added by creating a JSON definition file in the `patterns` directory.

## Directory Structure

The project is organized into the following main directories:

- `dart/`: Contains the Dart/Flutter implementation of the library.
- `ts/`: Contains the TypeScript/JavaScript implementation of the library.
- `patterns/`: Contains JSON files that define the patterns for each social media platform.
- `scripts/`: Contains build and publish scripts for the project.
- `examples/`: Contains example usage of the library.

### Dart Implementation (`dart/`)

- `lib/`: The main source code for the Dart package.
- `test/`: Unit tests for the Dart package.
- `pubspec.yaml`: The package definition file for the Dart project.

### TypeScript Implementation (`ts/`)

- `src/`: The main source code for the TypeScript package.
- `test/`: Unit tests for the TypeScript package.
- `package.json`: The package definition file for the TypeScript project.
- `rollup.config.js`: The configuration for Rollup, which is used to bundle the package.

## Development Workflow

### Adding a New Platform

To add support for a new social media platform, create a new JSON file in the `patterns/` directory. The JSON file should follow this structure:

```json
{
  "name": "platform_name",
  "matches": [
    {
      "match": "(https?://)?([\\w.]*\\.)?platform\\.com/({PROFILE_ID})/?",
      "group": 3,
      "pattern": "https://platform.com/{PROFILE_ID}"
    }
  ]
}
```

After adding the new pattern, you will need to run the build script to include it in the library.

### Building the Project

The project can be built using the `build.sh` script in the `scripts/` directory.

```bash
./scripts/build.sh
```

This script will:
1.  Read all the JSON files from the `patterns` directory.
2.  Generate a single `patterns.json` file.
3.  Copy the `patterns.json` file to the `dart` and `ts` directories.
4.  Build the TypeScript and Dart packages.

### Running Tests

To run the tests for both packages, use the following commands:

```bash
# TypeScript
npm test --prefix ts

# Dart
(cd dart && flutter test)
```

### Publishing

The `publish.sh` script in the `scripts/` directory can be used to publish the packages to npm and pub.dev.

## Future Plans

The long-term vision for Keeplist Social is to rewrite the core logic in Rust and compile it to WebAssembly (WASM). This will provide a single source of truth for the validation and sanitization logic, and allow the library to be used in a wider range of languages.

The key goals of the Rust rewrite are:

-   **Single Source of Truth**: The core logic will be implemented once in Rust.
-   **Cross-Language Compatibility**: The Rust code will be compiled to WASM, with bindings for different languages (TypeScript, Dart, Python, etc.).
-   **Improved Performance**: Rust and WASM will provide better performance than the current JavaScript and Dart implementations.
-   **Smaller Package Size**: The WASM binary will be smaller than the current library implementations.
-   **Easier Maintenance**: Having a single codebase will make it easier to maintain and extend the library. 