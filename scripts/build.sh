#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored messages
log_info() { echo -e "${GREEN}[INFO]${NC} $1"; }
log_warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
log_error() { echo -e "${RED}[ERROR]${NC} $1"; }

# Function to check if command exists
check_command() {
    if ! command -v $1 &> /dev/null; then
        log_error "$1 is required but not installed."
        exit 1
    fi
}

# Check required tools
check_command "npm"
check_command "flutter"

# Copy README to subdirectories
copy_readme() {
    log_info "Copying README to package directories..."
    cp README.md ts/README.md
    cp README.md dart/README.md
}

# Clean up generated files
cleanup_readme() {
    log_info "Cleaning up generated files..."
    rm -f ts/README.md
    rm -f dart/README.md
}

# Generate patterns
generate_patterns() {
    log_info "Generating patterns..."
    cd ts
    node scripts/build-patterns.js
    cd ..
}

# Build TypeScript package
build_typescript() {
    log_info "Building TypeScript package..."
    cd ts
    
    # Clean
    log_info "Cleaning previous build..."
    npm run clean
    
    # Install dependencies
    log_info "Installing dependencies..."
    npm install
    
    # Generate patterns
    log_info "Generating patterns..."
    npm run prebuild
    
    # Run linting
    log_info "Running linter..."
    npm run lint
    
    # Build
    log_info "Building package..."
    npm run build
    
    # Run tests
    log_info "Running tests..."
    npm test
    
    cd ..
}

# Build Dart package
build_dart() {
    log_info "Building Dart package..."
    cd dart
    
    # Get dependencies
    log_info "Getting dependencies..."
    flutter pub get
    
    # Update dependencies
    log_info "Checking for outdated packages..."
    flutter pub outdated
    
    # Format code
    log_info "Formatting code..."
    dart format .
    
    # Analyze
    log_info "Running analyzer..."
    flutter analyze
    
    # Run tests
    log_info "Running tests..."
    flutter test
    
    cd ..
}

# Main execution
main() {
    log_info "Starting build process..."

    # Parse arguments
    while [[ "$#" -gt 0 ]]; do
        case $1 in
            --ts-only) build_ts_only=true ;;
            --dart-only) build_dart_only=true ;;
            --watch) watch_mode=true ;;
            --patterns-only) patterns_only=true ;;
            *) log_error "Unknown parameter: $1"; exit 1 ;;
        esac
        shift
    done

    # Set up trap to clean up on exit
    trap cleanup_readme EXIT

    # Copy README files
    copy_readme

    # Generate patterns if needed
    if [ "$patterns_only" = true ]; then
        generate_patterns
        exit 0
    fi

    # Build based on arguments
    if [ "$build_ts_only" = true ]; then
        generate_patterns
        build_typescript
    elif [ "$build_dart_only" = true ]; then
        build_dart
    else
        generate_patterns
        build_typescript
        build_dart
    fi

    log_info "Build completed successfully!"
}

# Run main function with all arguments
main "$@"