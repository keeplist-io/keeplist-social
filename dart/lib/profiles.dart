import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'types.dart';

Future<Map<String, List<Link>>> loadJsonAssets() async {
  final Map<String, List<Link>> models = {};
  final List<String> jsonFiles = [
    ...json
        .decode(await rootBundle.loadString('AssetManifest.json'))
        .keys
        .where((String key) => key.startsWith('../patterns/'))
        .map((String path) => path.split('/').last)
        .toList(),
  ];

  for (final file in jsonFiles) {
    final content = await rootBundle.loadString('../patterns/$file');
    final Map<String, dynamic> jsonData = json.decode(content);
    models[Profile.fromJson(jsonData).name] =
        Profile.fromJson(jsonData).matches;
  }
  return models;
}
