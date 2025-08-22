import 'package:flutter/widgets.dart';

class Link {
  late String match;
  late int group;
  late String? pattern;
  late String? idPattern;
  late bool? forceStripQuery;
  late IconData? icon;

  Link({
    required this.match,
    required this.group,
    this.pattern,
    this.idPattern,
    this.forceStripQuery,
    this.icon,
  });

  factory Link.fromJson(Map<String, dynamic> json,
      {String? parentPattern, bool? forceStripQuery}) {
    return Link(
        match: json['match'] as String,
        group: (json['group'] as num).toInt(),
        pattern: json['pattern'] as String?,
        forceStripQuery: forceStripQuery ?? json['forceStripQuery'] as bool?,
        idPattern: parentPattern ?? json['idPattern'] as String?,
        icon: null);
  }
}

class Profile {
  String name;
  String title;
  String hint;
  String? pattern;
  List<Link> matches;
  bool? forceStripQuery;
  IconData? icon;

  Profile({
    required this.name,
    required this.title,
    required this.hint,
    required this.matches,
    this.pattern,
    this.forceStripQuery,
    this.icon,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    List<dynamic> match = (json['matches'] as List<dynamic>?) ?? [];
    return Profile(
        name: json['name'] as String,
        title: json['title'] as String,
        hint: json['hint'] as String,
        pattern: json['pattern'] as String?,
        matches: match
            .map((i) => Link.fromJson(i,
                parentPattern: json['pattern'] as String?,
                forceStripQuery: json['forceStripQuery'] as bool?))
            .toList(),
        forceStripQuery: json['forceStripQuery'] as bool?,
        icon: null);
  }
}
