const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

const patternsDir = path.join(__dirname, '..', 'patterns');
const outputDir = path.join(__dirname, '..', 'dart', 'lib', 'generated');
const outputFile = path.join(outputDir, 'patterns.dart');

function wrapJson(json) {
  return `jsonDecode(r'''${json}''')`;
}

function build() {
  const files = fs.readdirSync(patternsDir).filter(f => f.endsWith('.json'));
  if (!fs.existsSync(outputDir)) {
    fs.mkdirSync(outputDir, { recursive: true });
  }
  const lines = [];
  lines.push('// Generated file. Do not edit.');
  lines.push("import 'dart:convert';");
  lines.push("import '../types.dart';");
  lines.push('');
  lines.push('final Map<String, List<Link>> defaultProfiles = {');

  for (const file of files) {
    const content = fs.readFileSync(path.join(patternsDir, file), 'utf8');
    const data = JSON.parse(content);
    lines.push(
      `  '${data.name}': Profile.fromJson(${wrapJson(JSON.stringify(data))}).matches,`
    );
  }

  lines.push('};');
  lines.push('');

  fs.writeFileSync(outputFile, lines.join('\n'));
  console.log('Generated Dart patterns at', outputFile);
  try {
    execSync(`dart format ${outputFile}`, { stdio: 'inherit' });
  } catch (err) {
    console.warn('dart format failed:', err.message);
  }
}

build();
