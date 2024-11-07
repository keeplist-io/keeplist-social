import { readFileSync, writeFileSync } from 'fs';
import { join } from 'path';

interface PackageJson {
  version: string;
}

interface PubspecYaml {
  version: string;
}

function updateVersion(version: string) {
  // Update package.json
  const packagePath = join(__dirname, '../package.json');
  const packageJson = JSON.parse(readFileSync(packagePath, 'utf8')) as PackageJson;
  packageJson.version = version;
  writeFileSync(packagePath, JSON.stringify(packageJson, null, 2) + '\n');

  // Update pubspec.yaml
  const pubspecPath = join(__dirname, '../../dart/pubspec.yaml');
  const pubspecContent = readFileSync(pubspecPath, 'utf8');
  const updatedPubspec = pubspecContent.replace(
    /^version: .*/m,
    `version: ${version}`
  );
  writeFileSync(pubspecPath, updatedPubspec);

  console.log(`Updated version to ${version} in both package.json and pubspec.yaml`);
}

// If script is run directly
if (require.main === module) {
  const version = process.argv[2];
  if (!version) {
    console.error('Please provide a version number');
    process.exit(1);
  }
  updateVersion(version);
}

export { updateVersion }; 