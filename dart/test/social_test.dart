import 'package:flutter_test/flutter_test.dart';

import 'package:keeplist_social/social.dart';

void main() async {
  // Add this line at the start of main
  TestWidgetsFlutterBinding.ensureInitialized();

  // Change from final to late
  late SocialLinks sl;

  // Move this into a setUp function
  setUp(() async {
    sl = await SocialLinks.create();
  });

  test('should be valid http', () {
    expect(
        sl.isValid('linkedin', 'http://www.linkedin.com/in/gkucmierz'), isTrue);
  });

  test('should be valid https', () {
    expect(sl.isValid('linkedin', 'https://www.linkedin.com/in/gkucmierz'),
        isTrue);
  });

  test('should be valid http, no-www', () {
    expect(sl.isValid('linkedin', 'http://linkedin.com/in/gkucmierz'), isTrue);
  });

  test('should be valid https, no-www', () {
    expect(sl.isValid('linkedin', 'https://linkedin.com/in/gkucmierz'), isTrue);
  });

  test('should be valid no-protocol', () {
    expect(sl.isValid('linkedin', 'www.linkedin.com/in/gkucmierz'), isTrue);
  });

  test('should be valid no-protocol, no-www', () {
    expect(sl.isValid('linkedin', 'linkedin.com/in/gkucmierz'), isTrue);
  });

  test('should be valid only id', () {
    expect(sl.isValid('linkedin', 'gkucmierz'), isTrue);
  });

  test('should work with http', () {
    expect(sl.getProfileId('linkedin', 'http://www.linkedin.com/in/gkucmierz'),
        matches('gkucmierz'));
  });

  test('should work with https', () {
    expect(sl.getProfileId('linkedin', 'https://www.linkedin.com/in/gkucmierz'),
        matches('gkucmierz'));
  });

  test('should work with http, no-www', () {
    expect(sl.getProfileId('linkedin', 'http://linkedin.com/in/gkucmierz'),
        matches('gkucmierz'));
  });

  test('should work with https, no-www', () {
    expect(sl.getProfileId('linkedin', 'https://linkedin.com/in/gkucmierz'),
        matches('gkucmierz'));
  });

  test('should work with no-protocol', () {
    expect(sl.getProfileId('linkedin', 'www.linkedin.com/in/gkucmierz'),
        matches('gkucmierz'));
  });

  test('should work with only id', () {
    expect(sl.getProfileId('linkedin', 'gkucmierz'), matches('gkucmierz'));
  });

  test('should create default TYPE_DESKTOP link', () {
    expect(sl.getLink('linkedin', 'gkucmierz'),
        matches('https://linkedin.com/in/gkucmierz'));
  });

  test('should create link', () {
    expect(sl.getLink('linkedin', 'gkucmierz'),
        matches('https://linkedin.com/in/gkucmierz'));
  });

  test('should sanitize link https, www', () {
    var sanitized =
        sl.sanitize('linkedin', 'https://www.linkedin.com/in/gkucmierz');
    expect(sanitized, matches('https://linkedin.com/in/gkucmierz'));
  });

  test('should sanitize link https', () {
    var sanitized =
        sl.sanitize('linkedin', 'https://linkedin.com/in/gkucmierz');
    expect(sanitized, matches('https://linkedin.com/in/gkucmierz'));
  });

  test('should sanitize link http', () {
    var sanitized = sl.sanitize('linkedin', 'http://linkedin.com/in/gkucmierz');
    expect(sanitized, matches('https://linkedin.com/in/gkucmierz'));
  });

  test('should sanitize link www', () {
    var sanitized = sl.sanitize('linkedin', 'www.linkedin.com/in/gkucmierz');
    expect(sanitized, matches('https://linkedin.com/in/gkucmierz'));
  });

  test('should sanitize link', () {
    var sanitized = sl.sanitize('linkedin', 'linkedin.com/in/gkucmierz');
    expect(sanitized, matches('https://linkedin.com/in/gkucmierz'));
  });

  test('should sanitize mobile link as desktop', () {
    var sanitized = sl.sanitize('linkedin', 'linkedin.com/mwlite/in/gkucmierz');
    expect(sanitized, matches('https://linkedin.com/in/gkucmierz'));
  });

  test('should sanitize link with slash at end', () {
    var sanitized = sl.sanitize('linkedin', 'linkedin.com/in/gkucmierz/');
    expect(sanitized, matches('https://linkedin.com/in/gkucmierz'));
  });

  test('should sanitize only profile id', () {
    var sanitized = sl.sanitize('linkedin', 'gkucmierz');
    expect(sanitized, matches('https://linkedin.com/in/gkucmierz'));
  });

  test('should set trimInput as default', () {
    var whitespace = [' ', '\t', '\n'].join('');
    expect(
        sl.isValid('linkedin',
            '${whitespace}http://www.linkedin.com/in/gkucmierz$whitespace'),
        isTrue);
  });

  test('should trim isValid', () async {
    sl = await SocialLinks.create(config: Config(trimInput: true));
    var whitespace = [' ', '\t', '\n'].join('');
    expect(
        sl.isValid('linkedin',
            '${whitespace}http://www.linkedin.com/in/gkucmierz$whitespace'),
        isTrue);
  });

  test('should not trim isValid', () async {
    sl = await SocialLinks.create(config: Config(trimInput: false));
    var whitespace = [' ', '\t', '\n'].join('');
    expect(
        sl.isValid('linkedin',
            '${whitespace}http://www.linkedin.com/in/gkucmierz$whitespace'),
        isFalse);
  });

  test('should not filterForQueryParams as default', () {
    var params = '?param=123&param2=abc';
    expect(
        sl.isValid('linkedin', 'http://www.linkedin.com/in/gkucmierz$params'),
        isFalse);
  });

  test('should filterForQueryParams in link', () async {
    sl = await SocialLinks.create(config: Config(filterForQueryParams: true));
    var params = '?param=123&param2=abc';
    expect(
        sl.isValid('linkedin', 'http://www.linkedin.com/in/gkucmierz$params'),
        isTrue);
  });

  test('should not filterForQueryParams in link', () async {
    sl = await SocialLinks.create(config: Config(filterForQueryParams: false));
    var params = '?param=123&param2=abc';
    expect(
        sl.isValid('linkedin', 'http://www.linkedin.com/in/gkucmierz$params'),
        isFalse);
  });

  test('should sanitize query params with filterForQueryParams = true',
      () async {
    sl = await SocialLinks.create(config: Config(filterForQueryParams: true));
    var params = '?param=123&param2=abc';
    var sanitized =
        sl.sanitize('linkedin', 'http://www.linkedin.com/in/gkucmierz$params');
    expect(sanitized, matches('https://linkedin.com/in/gkucmierz'));
  });

  test('should not sanitize query params with filterForQueryParams = false',
      () async {
    sl = await SocialLinks.create(config: Config(filterForQueryParams: false));
    var params = '?param=123&param2=abc';
    expect(
        () => sl.sanitize(
            'linkedin', 'http://www.linkedin.com/in/gkucmierz$params'),
        throwsException);
  });

  test('should not use filterForQueryParams when only profileId is provided',
      () async {
    sl = await SocialLinks.create(config: Config(filterForQueryParams: true));
    var params = '?param=123&param2=abc';
    expect(sl.sanitize('linkedin', 'gkucmierz$params'),
        'https://linkedin.com/in/gkucmierz');
  });
}
