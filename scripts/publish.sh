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

# Version validation
validate_version() {
    if ! [[ $1 =~ ^[0-9]+\.[0-9]+\.[0-9]+(-[0-9A-Za-z-]+(\.[0-9A-Za-z-]+)*)?(\+[0-9A-Za-z-]+(\.[0-9A-Za-z-]+)*)?$ ]]; then
        log_error "Invalid version format. Please use semantic versioning (x.y.z)"
        exit 1
    fi
}

# Check required tools
check_command "yarn"
check_command "flutter"
check_command "git"


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

# Function to ensure we're on main branch with no uncommitted changes
check_git_status() {
    if [ "$(git branch --show-current)" != "main" ]; then
        log_error "Not on main branch"
        exit 1
    fi

    if [ -n "$(git status --porcelain)" ]; then
        log_error "Working directory not clean. Commit or stash changes first."
        exit 1
    fi
}

# Function to update versions
update_versions() {
    local version=$1
    
    # Use the TypeScript version script
    log_info "Updating versions..."
    cd ts
    npm run version "$version"
    if [ $? -ne 0 ]; then
        log_error "Version update failed"
        exit 1
    fi
    cd ..

    # Create git tag
    git add ts/package.json dart/pubspec.yaml
    git commit -m "chore: bump version to $version"
    git tag -a "v$version" -m "Version $version"
}

# Function to publish TypeScript package
publish_typescript() {
    log_info "Publishing TypeScript package..."
    cd ts

    # Run linting
    log_info "Running linter..."
    if ! yarn run lint; then
        log_error "Linting failed"
        exit 1
    fi

    # Run tests
    log_info "Running TypeScript tests..."
    if ! yarn test; then
        log_error "TypeScript tests failed"
        exit 1
    fi

    # Build package
    log_info "Building TypeScript package..."
    if ! yarn run build; then
        log_error "TypeScript build failed"
        exit 1
    fi

    # Publish to yarn
    log_info "Publishing to yarn..."
    if ! yarn publish; then
        log_error "yarn publish failed"
        exit 1
    fi

    cd ..
    log_info "TypeScript package published successfully"
}

# Function to publish Dart package
publish_dart() {
    log_info "Publishing Dart package..."
    cd dart

    # Get dependencies
    log_info "Getting Dart dependencies..."
    if ! flutter pub get; then
        log_error "flutter pub get failed"
        exit 1
    fi

    # Format code
    log_info "Formatting Dart code..."
    if ! dart format --set-exit-if-changed .; then
        log_error "Dart formatting check failed"
        exit 1
    fi

    # Analyze code
    log_info "Analyzing Dart code..."
    if ! flutter analyze; then
        log_error "Dart analysis failed"
        exit 1
    fi

    # Run tests
    log_info "Running Dart tests..."
    if ! flutter test; then
        log_error "Dart tests failed"
        exit 1
    fi

    # Publish dry run
    log_info "Running pub publish dry run..."
    if ! flutter pub publish --dry-run; then
        log_error "Dart package validation failed"
        exit 1
    fi

    # Publish to pub.dev
    log_info "Publishing to pub.dev..."
    if ! flutter pub publish --force; then
        log_error "flutter pub publish failed"
        exit 1
    fi

    cd ..
    log_info "Dart package published successfully"
}

# Main execution
main() {
    log_info "Starting publish process..."
    
    # Check git status
    check_git_status

    # Get version
    read -p "Enter version number (x.y.z): " version
    validate_version $version

    # Confirm version
    read -p "Publish version $version? (y/n) " confirm
    if [ "$confirm" != "y" ]; then
        log_info "Aborting publish"
        exit 0
    fi

    # Update versions
    update_versions $version

    # Ask which packages to publish
    read -p "Publish TypeScript package? (y/n) " publish_ts
    read -p "Publish Dart package? (y/n) " publish_dart
    # Set up trap to clean up on exit
    trap cleanup_readme EXIT
    # Copy README files
    copy_readme

    if [ "$publish_ts" = "y" ]; then
        publish_typescript
    fi

    if [ "$publish_dart" = "y" ]; then
        publish_dart
    fi

    # Push changes
    log_info "Pushing changes and tags..."
    git push && git push --tags

    log_info "All publishing tasks completed!"
}

# Run main function
main