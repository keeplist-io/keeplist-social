import fs from 'fs';
import path from 'path';

import { fileURLToPath } from 'url';

// Get __dirname equivalent in ES modules
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const patternsDir = path.join(__dirname, '../../patterns');
const outputFile = path.join(__dirname, '../src/generated/patterns.ts');

function generatePatternsFile() {
  // Create generated directory if it doesn't exist
  const dir = path.dirname(outputFile);
  if (!fs.existsSync(dir)) {
    fs.mkdirSync(dir, { recursive: true });
  }

  const files = fs.readdirSync(patternsDir)
    .filter(file => file.endsWith('.json'));

  const imports = files.map(file => {
    const name = path.basename(file, '.json');
    return `import ${name} from '../../../patterns/${file}' with { type: 'json' };`;
  }).join('\n');

  const patterns = files.map(file => 
    path.basename(file, '.json')
  ).join(',\n  ');

  const content = `// This file is auto-generated. Do not edit directly.
${imports}

export const patterns = {
  ${patterns}
} as const;
`;

  fs.writeFileSync(outputFile, content);
  console.log('Generated patterns file at:', outputFile);
}

generatePatternsFile(); 