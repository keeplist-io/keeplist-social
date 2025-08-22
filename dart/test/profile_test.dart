import 'package:flutter_test/flutter_test.dart';
import 'package:keeplist_social/social.dart';

void main() {
  // Add this line at the start of main
  TestWidgetsFlutterBinding.ensureInitialized();

  // Change from final to late
  late SocialLinks sl;

  // Move this into a setUp function
  setUp(() {
    sl = SocialLinks.create();
  });
  String profile;
  String profileId;
  String primary;
  List<String>? alternates;
  void testProfile(String profile, String profileId, String primary,
      List<String>? alternates) {
    expect(sl.isValid(profile, primary), isTrue);
    expect(sl.getProfileId(profile, primary), matches(profileId));
    expect(sl.getLink(profile, profileId), matches(primary));
    expect(sl.sanitize(profile, primary), matches(primary));
    if (alternates != null && alternates.isNotEmpty) {
      for (var alternate in alternates) {
        expect(sl.isValid(profile, alternate), isTrue);
        expect(sl.getProfileId(profile, alternate), matches(profileId));
        expect(sl.sanitize(profile, alternate), matches(primary));
      }
    }
  }

  test('Test Facebook', () {
    profile = 'facebook';
    profileId = 'gkucmierz';
    primary = 'https://facebook.com/$profileId';
    alternates = ['https://m.facebook.com/$profileId'];
    testProfile(profile, profileId, primary, alternates);
  });

  test('Test Github', () {
    profile = 'github';
    profileId = 'gkucmierz';
    primary = 'https://github.com/$profileId';
    testProfile(profile, profileId, primary, null);
  });

  test('Test Instagram', () {
    profile = 'instagram';
    profileId = 'javascript.js';
    primary = 'https://instagram.com/$profileId';
    alternates = ['https://m.instagram.com/$profileId'];
    testProfile(profile, profileId, primary, alternates);
  });

  test('Test linkedin', () {
    profile = 'linkedin';
    profileId = 'gkucmierz';
    primary = 'https://linkedin.com/in/$profileId';
    alternates = ['https://linkedin.com/mwlite/in/$profileId'];
    testProfile(profile, profileId, primary, alternates);
  });

  test('Test medium', () {
    profile = 'medium';
    profileId = 'grzegorzkumierz';
    primary = 'https://medium.com/@$profileId';
    testProfile(profile, profileId, primary, null);
  });

  test('Test patreon', () {
    profile = 'patreon';
    profileId = 'gkucmierz';
    primary = 'https://patreon.com/$profileId';
    testProfile(profile, profileId, primary, null);
  });

  test('Test stackoverflow', () {
    profile = 'stackoverflow';
    profileId = '3573210';
    primary = 'https://stackoverflow.com/users/$profileId';
    testProfile(profile, profileId, primary, null);
  });

  test('Test recognize full stackoverflow link', () {
    profile = 'stackoverflow';
    profileId = '3573210';
    primary = 'https://stackoverflow.com/users/$profileId';
    String fullLink = 'https://stackoverflow.com/users/$profileId/gkucmierz';

    expect(sl.isValid(profile, fullLink), isTrue);
    expect(sl.getProfileId(profile, fullLink), matches(profileId));
    expect(sl.sanitize(profile, fullLink), matches(primary));
  });
  test('Test substack', () {
    profile = 'substack';
    profileId = 'gkucmierz';
    primary = 'https://$profileId.substack.com';
    testProfile(profile, profileId, primary, null);
  });
  test('Test telegram', () {
    profile = 'telegram';
    profileId = 'gkucmierz';
    primary = 'https://t.me/$profileId';
    testProfile(profile, profileId, primary, null);
  });
  test('Test tiktok', () {
    profile = 'tiktok';
    profileId = 'gkucmierz';
    primary = 'https://tiktok.com/@$profileId';
    testProfile(profile, profileId, primary, null);
  });
  test('Test twitch', () {
    profile = 'twitch';
    profileId = 'gkucmierz';
    primary = 'https://twitch.tv/$profileId';
    alternates = ['https://m.twitch.tv/$profileId'];
    testProfile(profile, profileId, primary, alternates);
  });
  test('Test linkedin', () {
    profile = 'linkedin';
    profileId = 'gkucmierz';
    primary = 'https://linkedin.com/in/$profileId';
    alternates = [
      'https://linkedin.com/mwlite/in/$profileId',
      'https://m.linkedin.com/mwlite/in/$profileId'
    ];
    testProfile(profile, profileId, primary, alternates);
  });

  test('Test twitter username', () {
    profile = 'twitter';
    profileId = 'mikewolfd';
    primary = 'https://x.com/$profileId';
    alternates = [
      'https://www.twitter.com/@$profileId',
      'https://twitter.com/$profileId',
      'https://x.com/@$profileId',
      'https://m.x.com/$profileId'
    ];
    testProfile(profile, profileId, primary, alternates);
  });

  final testUrls = {
    'https://www.example.com/path': (true, 'www.example.com/path'),
    'http://subdomain.example.co.uk/path?query=false': (
      false,
      'subdomain.example.co.uk/path'
    ),
    'ftp://ftp.example.biz/info': (false, 'ftp.example.biz/info'),
    'www.example.com': (true, 'www.example.com'),
    'example.com/path': (true, 'example.com/path'),
    'https://www.sd': (true, 'www.sd'),
    'www.sd': (true, 'www.sd'),
    'just-text': (false, null),
    'http://localhost': (false, null),
    '192.168.1.1': (false, null),
    'rofl://example.com/path': (false, 'example.com/path')
  };

  test('Test website profile', () {
    profile = 'website';

    for (var key in testUrls.keys) {
      final valid = sl.isValid(profile, key);
      expect(valid, testUrls[key]!.$1);
      if (!valid) continue;
      final val = sl.getProfileId(profile, key);
      if (valid) expect(val, testUrls[key]!.$2);
    }
  });

  test('Test youtube legacy username', () {
    profile = 'youtube';
    profileId = 'UCpHGx5iSfXZ-7AicGd6IZtg';
    primary = 'https://youtube.com/channel/$profileId';
    alternates = [
      'https://m.youtube.com/channel/$profileId',
      'https://www.youtube.com/channel/$profileId'
    ];
    testProfile(profile, profileId, primary, alternates);
  });

  test('Test youtube v2 username', () {
    profile = 'youtube';
    profileId = '@mikewolfd';
    primary = 'https://youtube.com/$profileId';
    alternates = [
      'https://www.youtube.com/$profileId',
      'https://m.youtube.com/$profileId'
    ];
    testProfile(profile, profileId, primary, alternates);
  });

  test('Test Email', () {
    profile = 'email';
    profileId = 'michael.f.deeb@gmail.com';
    primary = 'mailto:$profileId';
    testProfile(profile, profileId, primary, null);
  });
}
