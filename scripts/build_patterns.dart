import 'dart:convert';
import 'dart:io';

String _escape(String input) {
  return input.replaceAll('\\', r'\\').replaceAll("'", r"\'"); //.replaceAll('\$', r'\$');
}

void main() {
  final patternsDir = Directory('patterns');
  final outputFile = File('dart/lib/generated/patterns.dart');

  if (!patternsDir.existsSync()) {
    stderr.writeln('patterns directory not found');
    exit(1);
  }
  outputFile.parent.createSync(recursive: true);

  final buffer = StringBuffer()
    ..writeln('// Generated file. Do not edit.')
    ..writeln("import '../types.dart';")
    ..writeln('')
    ..writeln('final Map<String, List<Link>> defaultProfiles = {');

  final files = patternsDir
      .listSync()
      .whereType<File>()
      .where((f) => f.path.endsWith('.json'))
      .toList()
    ..sort((a, b) => a.path.compareTo(b.path));

  for (final file in files) {
    final data = jsonDecode(file.readAsStringSync()) as Map<String, dynamic>;
    final name = data['name'] as String;
    buffer.writeln("  '$name': Profile(");
    buffer.writeln("    name: '$name',");
    if (data.containsKey('pattern')) {
      buffer.writeln("    pattern: '${_escape(data['pattern'])}',");
    }
    if (data.containsKey('forceStripQuery')) {
      buffer.writeln('    forceStripQuery: ${data['forceStripQuery']},');
    }
    if (data.containsKey('icon')) {
      final icon = data['icon'] as Map<String, dynamic>;
      buffer.write('    icon: IconDefinition(');
      buffer.write("iconType: '${_escape(icon['iconType'])}', value: '${_escape(icon['value'])}'");
      if (icon.containsKey('FaStyle')) {
        buffer.write(', faStyle: FaIconStyle.${icon['FaStyle']}');
      }
      buffer.writeln('),');
    }
    buffer.writeln('    matches: [');
    final matches = (data['matches'] as List).cast<Map<String, dynamic>>();
    for (final m in matches) {
      buffer.write('      Link(');
      buffer.write("match: '${_escape(m['match'])}', group: ${m['group']}");
      if (m.containsKey('pattern')) {
        buffer.write(", pattern: '${_escape(m['pattern'])}'");
      }
      if (m.containsKey('idPattern') || data.containsKey('pattern')) {
        buffer.write(", idPattern: '${_escape(m['idPattern'] ?? data['pattern'])}'");
      }
      if (m.containsKey('forceStripQuery')) {
        buffer.write(', forceStripQuery: ${m['forceStripQuery']}');
      }
      if (m.containsKey('icon')) {
        final icon = m['icon'] as Map<String, dynamic>;
        buffer.write(', icon: IconDefinition(');
        buffer.write("iconType: '${_escape(icon['iconType'])}', value: '${_escape(icon['value'])}'");
        if (icon.containsKey('FaStyle')) {
          buffer.write(', faStyle: FaIconStyle.${icon['FaStyle']}');
        }
        buffer.write(')');
      }
      buffer.writeln('),');
    }
    buffer.writeln('    ],');
    buffer.writeln('  ).matches,');
  }

  buffer.writeln('};');

  outputFile.writeAsStringSync(buffer.toString());
  stdout.writeln('Generated ${outputFile.path}');
}
