import 'package:flutter_test/flutter_test.dart';
import 'package:keeplist_social/social.dart';

void main() {
  group('IconDefinition Tests', () {
    test('should create IconDefinition from constructor', () {
      final icon = IconDefinition(
        iconType: 'fa',
        value: 'github',
        faStyle: FaIconStyle.brands,
      );

      expect(icon.iconType, 'fa');
      expect(icon.value, 'github');
      expect(icon.faStyle, FaIconStyle.brands);
    });

    test('should create IconDefinition from JSON with all fields', () {
      final json = {
        'iconType': 'fa',
        'value': 'github',
        'FaStyle': 'brands',
      };

      final icon = IconDefinition.fromJson(json);

      expect(icon.iconType, 'fa');
      expect(icon.value, 'github');
      expect(icon.faStyle, FaIconStyle.brands);
    });

    test('should create IconDefinition from JSON without FaStyle', () {
      final json = {
        'iconType': 'custom',
        'value': 'custom-icon',
      };

      final icon = IconDefinition.fromJson(json);

      expect(icon.iconType, 'custom');
      expect(icon.value, 'custom-icon');
      expect(icon.faStyle, null);
    });
  });

  group('Link with Icon Tests', () {
    test('should create Link with icon', () {
      final icon = IconDefinition(
        iconType: 'fa',
        value: 'github',
        faStyle: FaIconStyle.brands,
      );

      final link = Link(
        match: 'github.com',
        group: 1,
        icon: icon,
      );

      expect(link.icon, isNotNull);
      expect(link.icon?.iconType, 'fa');
      expect(link.icon?.value, 'github');
      expect(link.icon?.faStyle, FaIconStyle.brands);
    });

    test('should create Link from JSON with icon', () {
      final json = {
        'match': 'github.com',
        'group': 1,
        'icon': {
          'iconType': 'fa',
          'value': 'github',
          'FaStyle': 'brands',
        },
      };

      final link = Link.fromJson(json);

      expect(link.icon, isNotNull);
      expect(link.icon?.iconType, 'fa');
      expect(link.icon?.value, 'github');
      expect(link.icon?.faStyle, FaIconStyle.brands);
    });
  });

  group('Profile with Icon Tests', () {
    test('should create Profile with icon', () {
      final icon = IconDefinition(
        iconType: 'fa',
        value: 'github',
        faStyle: FaIconStyle.brands,
      );

      final profile = Profile(
        name: 'github',
        title: 'GitHub',
        hint: 'username',
        matches: [],
        icon: icon,
      );

      expect(profile.icon, isNotNull);
      expect(profile.icon?.iconType, 'fa');
      expect(profile.icon?.value, 'github');
      expect(profile.icon?.faStyle, FaIconStyle.brands);
    });

    test('should create Profile from JSON with icon', () {
      final json = {
        'name': 'github',
        'title': 'GitHub',
        'hint': 'username',
        'matches': [],
        'icon': {
          'iconType': 'fa',
          'value': 'github',
          'FaStyle': 'brands',
        },
      };

      final profile = Profile.fromJson(json);

      expect(profile.icon, isNotNull);
      expect(profile.icon?.iconType, 'fa');
      expect(profile.title, 'GitHub');
      expect(profile.hint, 'username');
      expect(profile.icon?.value, 'github');
      expect(profile.icon?.faStyle, FaIconStyle.brands);
    });

    test('should create Profile from JSON with icon and matches', () {
      final json = {
        'name': 'github',
        'title': 'GitHub',
        'hint': 'username',
        'matches': [
          {
            'match': 'github.com',
            'group': 1,
            'icon': {
              'iconType': 'fa',
              'value': 'github',
              'FaStyle': 'brands',
            },
          }
        ],
        'icon': {
          'iconType': 'fa',
          'value': 'github',
          'FaStyle': 'brands',
        },
      };

      final profile = Profile.fromJson(json);

      expect(profile.icon, isNotNull);
      expect(profile.icon?.iconType, 'fa');
      expect(profile.icon?.value, 'github');
      expect(profile.icon?.faStyle, FaIconStyle.brands);

      expect(profile.title, 'GitHub');
      expect(profile.hint, 'username');
      expect(profile.matches, hasLength(1));
      expect(profile.matches[0].icon, isNotNull);
      expect(profile.matches[0].icon?.iconType, 'fa');
      expect(profile.matches[0].icon?.value, 'github');
      expect(profile.matches[0].icon?.faStyle, FaIconStyle.brands);
    });
  });
}
