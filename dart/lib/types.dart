class Link {
  late String match;
  late int group;
  late String? pattern;
  late String? idPattern;
  late bool? forceStripQuery;
  Link({
    required this.match,
    required this.group,
    this.pattern,
    this.idPattern,
    this.forceStripQuery,
  });

  factory Link.fromJson(Map<String, dynamic> json,
      {String? parentPattern, bool? forceStripQuery}) {
    return Link(
        match: json['match'] as String,
        group: (json['group'] as num).toInt(),
        pattern: json['pattern'] as String?,
        forceStripQuery: forceStripQuery ?? json['forceStripQuery'] as bool?,
        idPattern: parentPattern ?? json['idPattern'] as String?);
  }
}

class Profile {
  String name;
  String? pattern;
  List<Link> matches;
  bool? forceStripQuery;
  Profile(
      {required this.name,
      required this.matches,
      this.pattern,
      this.forceStripQuery});
  factory Profile.fromJson(Map<String, dynamic> json) {
    List<dynamic> match = (json['matches'] as List<dynamic>?) ?? [];
    return Profile(
        name: json['name'] as String,
        pattern: json['pattern'] as String?,
        matches: match
            .map((i) => Link.fromJson(i,
                parentPattern: json['pattern'] as String?,
                forceStripQuery: json['forceStripQuery'] as bool?))
            .toList(),
        forceStripQuery: json['forceStripQuery'] as bool?);
  }
}
