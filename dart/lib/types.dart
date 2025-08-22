class Link {
  late String match;
  late int group;
  late String? pattern;
  late String? idPattern;
  late bool? forceStripQuery;
  late IconDefinition? icon;

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
        icon: json['icon'] != null
            ? IconDefinition.fromJson(json['icon'])
            : null);
  }
}

class Profile {
  String name;
  String title;
  String hint;
  String? pattern;
  List<Link> matches;
  bool? forceStripQuery;
  IconDefinition? icon;

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
        icon: json['icon'] != null
            ? IconDefinition.fromJson(json['icon'])
            : null);
  }
}

enum FaIconStyle {
  brands,
  solid,
  regular,
}

class IconDefinition {
  String iconType;
  String value;
  FaIconStyle? faStyle;

  IconDefinition({
    required this.iconType,
    required this.value,
    this.faStyle,
  });

  factory IconDefinition.fromJson(Map<String, dynamic> json) {
    return IconDefinition(
      iconType: json['iconType'] as String,
      value: json['value'] as String,
      faStyle: json['FaStyle'] != null
          ? FaIconStyle.values.firstWhere(
              (e) => e.toString().split('.').last == json['FaStyle'],
            )
          : null,
    );
  }
}
