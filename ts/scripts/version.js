import fs from 'fs';
import path from 'path';


import { fileURLToPath } from 'url';
// Get __dirname equivalent in ES modules
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const packagePath = path.join(__dirname, '../package.json');

function updateVersion(version) {
  // Update package.json
  const packageJson = JSON.parse(fs.readFileSync(packagePath, 'utf8'));

  packageJson.version = version;
  fs.writeFileSync(packagePath, JSON.stringify(packageJson, null, 2) + '\n');

  // Update pubspec.yaml
  const pubspecPath = path.join(__dirname, '../../dart/pubspec.yaml');
  const pubspecContent = fs.readFileSync(pubspecPath, 'utf8');
  const updatedPubspec = pubspecContent.replace(
    /^version: .*/m,
    `version: ${version}`
  );
  fs.writeFileSync(pubspecPath, updatedPubspec);

  console.log(`Updated version to ${version} in both package.json and pubspec.yaml`);
}
  const version = process.argv[2];
  if (!version) {
    console.error('Please provide a version number');
    process.exit(1);
  }
  updateVersion(version);
