# Keeplist Social

[![TypeScript Tests](https://github.com/keeplist-io/keeplist-social/actions/workflows/typescript.yml/badge.svg)](https://github.com/keeplist-io/keeplist-social/actions/workflows/typescript.yml)
[![Dart Tests](https://github.com/keeplist-io/keeplist-social/actions/workflows/dart.yml/badge.svg)](https://github.com/keeplist-io/keeplist-social/actions/workflows/dart.yml)
[![npm version](https://badge.fury.io/js/keeplist-social.svg)](https://www.npmjs.com/package/keeplist-social)
[![Pub Version](https://img.shields.io/pub/v/keeplist_social)](https://pub.dev/packages/keeplist_social)

A cross-platform library for validating, sanitizing, and standardizing social media profile URLs and identifiers. Available for [TypeScript/JavaScript](https://www.npmjs.com/package/keeplist-social) and [Dart/Flutter](https://pub.dev/packages/keeplist_social).

> **Credits**: 
> - This project is inspired by and based on [social-links](https://github.com/gkucmierz/social-links) by [Grzegorz Kućmierz](https://github.com/gkucmierz). We've expanded it to support multiple platforms and plan to evolve it further.
> - Development was assisted by [Cursor](https://cursor.sh/) using Claude-3.5-20241022.

> **Note**: This is currently an MVP (Minimum Viable Product) version. A complete rewrite in Rust is planned, which will:
> - Use WebAssembly (WASM) for cross-language compatibility
> - Enable single-source-of-truth implementation
> - Support multiple language bindings through WASM
> - Reduce maintenance overhead of multiple implementations

## Purpose

Keeplist Social solves several common problems when working with social media URLs:

1. **URL Validation**: Verify if a URL is a valid social media profile link
2. **Profile ID Extraction**: Extract the unique identifier from various URL formats
3. **URL Standardization**: Convert different URL formats to a canonical form
4. **Cross-Platform Support**: Works in both web and mobile environments

## Features

- Supports 25+ social platforms including:
  - Major social networks (Twitter/X, Facebook, Instagram, LinkedIn)
  - Professional platforms (GitHub, StackOverflow)
  - Media platforms (YouTube, Spotify, Apple Podcasts)
  - Messaging platforms (Discord, Telegram, WhatsApp)
  - And many more

- Handles various URL formats:
  - Different protocols (http, https)
  - With/without www prefix
  - Mobile URLs (m.example.com)
  - Country-specific domains
  - With/without trailing slashes
  - Query parameters (optional)

## Usage

### TypeScript/JavaScript
```typescript
import { SocialLinks } from 'keeplist-social';

const social = await SocialLinks.create();

// Validate URLs
social.isValid('twitter', 'https://x.com/username');  // true
social.isValid('twitter', 'not-a-url');  // false

// Extract profile IDs
social.getProfileId('github', 'https://github.com/username');  // 'username'

// Standardize URLs
social.sanitize('linkedin', 'www.linkedin.com/in/username');  
// Returns: 'https://linkedin.com/in/username'
```

### Dart/Flutter
```dart
import 'package:social/social.dart';

final social = await SocialLinks.create();

// Validate URLs
social.isValid('twitter', 'https://x.com/username');  // true

// Extract profile IDs
social.getProfileId('github', 'https://github.com/username');  // 'username'

// Standardize URLs
social.sanitize('linkedin', 'www.linkedin.com/in/username');
// Returns: 'https://linkedin.com/in/username'
```

## Configuration

```typescript
const social = await SocialLinks.create({
  trimInput: true,              // Trim whitespace from inputs
  filterForQueryParams: false,  // Allow/strip query parameters
});
```

## Adding New Platforms

Platforms are defined in JSON pattern files under `/patterns`:

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
After adding a pattern file, run `../scripts/build.sh --patterns-only` to
regenerate the compiled sources.

## Development

1. Install dependencies:
```bash
# For TypeScript
npm install

# For Dart
flutter pub get
```

2. Build generated pattern files:
```bash
../scripts/build.sh --patterns-only
```
This compiles the JSON definitions under `../patterns/` into the source
code so they ship with the package.

3. Run tests:
```bash
# TypeScript
npm test

# Dart
flutter test
```

## Publishing

### NPM Package
1. Update version in `ts/package.json`
2. Build the package:
```bash
cd ts
npm run build
```
3. Publish to NPM:
```bash
npm publish
```

### Dart/Flutter Package
1. Update version in `dart/pubspec.yaml`
2. Run tests:
```bash
cd dart
flutter test
```
3. Publish to pub.dev:
```bash
flutter pub publish
```

### Installation

#### NPM
```bash
npm install keeplist-social
```

#### Dart/Flutter
Add to your pubspec.yaml:
```yaml
dependencies:
  keeplist_social: ^1.0.0
```
Then run:
```bash
flutter pub get
```

## License

MIT License 

## Future Plans

### Rust + WebAssembly Implementation
The current TypeScript and Dart implementations serve as a proof of concept. The next major version will:

1. Rewrite the core functionality in Rust
2. Compile to WebAssembly for:
   - JavaScript/TypeScript (via wasm-bindgen)
   - Dart/Flutter (via flutter_rust_bridge)
   - Python (via PyO3)
   - Other languages as needed

3. Provide improved features:
   - Better performance
   - Smaller package size
   - Type-safe bindings
   - Unified test suite
   - Easier maintenance

Stay tuned for updates on the Rust implementation! 