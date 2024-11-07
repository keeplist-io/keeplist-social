library social;

export 'types.dart';
export 'social.dart';

import 'profiles.dart';

import './types.dart';

class AppException implements Exception {
  final String _message;

  AppException(this._message);

  @override
  String toString() {
    return _message;
  }
}

class Config {
  bool usePredefinedProfiles;
  bool trimInput;
  bool filterForQueryParams;

  Config(
      {this.usePredefinedProfiles = true,
      this.trimInput = true,
      this.filterForQueryParams = false});
}

const profileId = '[A-Za-z0-9_\\-\\.]+';
const queryParam = r'(\?.*)?';

RegExp createRegexp(Link profileMatch, Config config) {
  String match = profileMatch.match;
  if (profileMatch.idPattern?.isNotEmpty == true) {
    match = match.replaceAll('{PROFILE_ID}', profileMatch.idPattern!);
  }
  match = match.replaceAll('{PROFILE_ID}', profileId);
  return RegExp([
    '^',
    match,
    config.filterForQueryParams || profileMatch.forceStripQuery == true
        ? queryParam
        : '',
    r'$'
  ].join(''));
}

int findIndexFromLink(
  List<Link>? matches,
  String link,
  Config config,
) =>
    (matches ?? [])
        .indexWhere((match) => createRegexp(match, config).hasMatch(link));

int findIndexFromProfileId(
  List<Link>? matches,
  String id,
  Config config,
) {
  return (matches ?? []).indexWhere((match) => match.idPattern != null
      ? RegExp('^(${match.idPattern!.replaceAll("{PROFILE_ID}", profileId)})')
          .hasMatch(id)
      : true);
}

class SocialLinks {
  Map<String, List<Link>> profiles;
  Config config;

  SocialLinks({required this.profiles, Config? config})
      : config = (config ?? Config());

  static Future<SocialLinks> create(
      {Map<String, List<Link>>? profiles, Config? config}) async {
    profiles = profiles ?? await loadJsonAssets();
    final instance = SocialLinks(profiles: profiles, config: config);
    return instance;
  }

  String trim(String input) {
    return config.trimInput ? input.trim() : input;
  }

  bool isValid(String profileName, String link) {
    var matches = profiles[profileName];
    return findIndexFromLink(matches, trim(link), config) != -1;
  }

  String getProfileId(String profileName, String link) {
    var matches = profiles[profileName] ?? [];
    var trimmed = trim(link);
    var idx = findIndexFromLink(matches, trimmed, config);
    if (idx == -1) {
      throw AppException("Link has not matched with profile $profileName");
    }
    var match = createRegexp(matches[idx], config).firstMatch(trimmed);

    var response = match?.group(matches[idx].group);
    if (response == null) {
      throw AppException("There was no successful matching for $profileName");
    }
    return response;
  }

  String getLink(String profileName, String id) {
    var matches = profiles[profileName] ?? [];
    var idx = findIndexFromProfileId(matches, id, config);
    if (idx == -1) {
      throw AppException("There is no pattern for profile profileName");
    }
    return (matches[idx].pattern ?? '').replaceAll('{PROFILE_ID}', trim(id));
  }

  String sanitize(
    String profileName,
    String link,
  ) {
    var trimmed = trim(link);
    var profileId = getProfileId(profileName, trimmed);
    return getLink(profileName, profileId);
  }
}
