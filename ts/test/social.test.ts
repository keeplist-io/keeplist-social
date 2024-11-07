import { describe, expect, test, beforeEach } from '@jest/globals';
import { SocialLinks } from '../src/index.ts';

describe('SocialLinks', () => {
  let sl: SocialLinks;

  beforeEach(async () => {
    sl = await SocialLinks.create();
  });

  describe('LinkedIn URL formats', () => {
    test('should be valid http', () => {
      expect(sl.isValid('linkedin', 'http://www.linkedin.com/in/gkucmierz')).toBe(true);
    });

    test('should be valid https', () => {
      expect(sl.isValid('linkedin', 'https://www.linkedin.com/in/gkucmierz')).toBe(true);
    });

    test('should be valid http, no-www', () => {
      expect(sl.isValid('linkedin', 'http://linkedin.com/in/gkucmierz')).toBe(true);
    });

    test('should be valid https, no-www', () => {
      expect(sl.isValid('linkedin', 'https://linkedin.com/in/gkucmierz')).toBe(true);
    });

    test('should be valid no-protocol', () => {
      expect(sl.isValid('linkedin', 'www.linkedin.com/in/gkucmierz')).toBe(true);
    });

    test('should be valid no-protocol, no-www', () => {
      expect(sl.isValid('linkedin', 'linkedin.com/in/gkucmierz')).toBe(true);
    });

    test('should be valid only id', () => {
      expect(sl.isValid('linkedin', 'gkucmierz')).toBe(true);
    });

    test('should work with http', () => {
      expect(sl.getProfileId('linkedin', 'http://www.linkedin.com/in/gkucmierz')).toMatch('gkucmierz');
    });

    test('should work with https', () => {
      expect(sl.getProfileId('linkedin', 'https://www.linkedin.com/in/gkucmierz')).toMatch('gkucmierz');
    });

    test('should work with http, no-www', () => {
      expect(sl.getProfileId('linkedin', 'http://linkedin.com/in/gkucmierz')).toMatch('gkucmierz');
    });

    test('should work with https, no-www', () => {
      expect(sl.getProfileId('linkedin', 'https://linkedin.com/in/gkucmierz')).toMatch('gkucmierz');
    });

    test('should work with no-protocol', () => {
      expect(sl.getProfileId('linkedin', 'www.linkedin.com/in/gkucmierz')).toMatch('gkucmierz');
    });

    test('should work with only id', () => {
      expect(sl.getProfileId('linkedin', 'gkucmierz')).toMatch('gkucmierz');
    });

    test('should create default TYPE_DESKTOP link', () => {
      expect(sl.getLink('linkedin', 'gkucmierz')).toMatch('https://linkedin.com/in/gkucmierz');
    });

    test('should create link', () => {
      expect(sl.getLink('linkedin', 'gkucmierz')).toMatch('https://linkedin.com/in/gkucmierz');
    });

    test('should sanitize link https, www', () => {
      expect(sl.sanitize('linkedin', 'https://www.linkedin.com/in/gkucmierz'))
        .toBe('https://linkedin.com/in/gkucmierz');
    });

    test('should sanitize link https', () => {
      expect(sl.sanitize('linkedin', 'https://linkedin.com/in/gkucmierz'))
        .toBe('https://linkedin.com/in/gkucmierz');
    });

    test('should sanitize link http', () => {
      expect(sl.sanitize('linkedin', 'http://linkedin.com/in/gkucmierz'))
        .toBe('https://linkedin.com/in/gkucmierz');
    });

    test('should sanitize link www', () => {
      expect(sl.sanitize('linkedin', 'www.linkedin.com/in/gkucmierz'))
        .toBe('https://linkedin.com/in/gkucmierz');
    });

    test('should sanitize link', () => {
      expect(sl.sanitize('linkedin', 'linkedin.com/in/gkucmierz'))
        .toBe('https://linkedin.com/in/gkucmierz');
    });

    test('should sanitize mobile link as desktop', () => {
      expect(sl.sanitize('linkedin', 'linkedin.com/mwlite/in/gkucmierz'))
        .toBe('https://linkedin.com/in/gkucmierz');
    });

    test('should sanitize link with slash at end', () => {
      expect(sl.sanitize('linkedin', 'linkedin.com/in/gkucmierz/'))
        .toBe('https://linkedin.com/in/gkucmierz');
    });

    test('should sanitize only profile id', () => {
      expect(sl.sanitize('linkedin', 'gkucmierz'))
        .toBe('https://linkedin.com/in/gkucmierz');
    });
  });

  describe('Input handling', () => {
    test('should set trimInput as default', () => {
      const whitespace = [' ', '\t', '\n'].join('');
      expect(sl.isValid('linkedin', `${whitespace}http://www.linkedin.com/in/gkucmierz${whitespace}`))
        .toBe(true);
    });

    test('should trim isValid', async () => {
      const slWithTrim = await SocialLinks.create({ trimInput: true });
      const whitespace = [' ', '\t', '\n'].join('');
      expect(slWithTrim.isValid('linkedin', `${whitespace}http://www.linkedin.com/in/gkucmierz${whitespace}`))
        .toBe(true);
    });

    test('should not trim isValid', async () => {
      const slNoTrim = await SocialLinks.create({ trimInput: false });
      const whitespace = [' ', '\t', '\n'].join('');
      expect(slNoTrim.isValid('linkedin', `${whitespace}http://www.linkedin.com/in/gkucmierz${whitespace}`))
        .toBe(false);
    });
  });

  describe('Query parameters', () => {
    test('should not filterForQueryParams as default', () => {
      const params = '?param=123&param2=abc';
      expect(sl.isValid('linkedin', `http://www.linkedin.com/in/gkucmierz${params}`))
        .toBe(false);
    });

    test('should filterForQueryParams in link', async () => {
      const slWithParams = await SocialLinks.create({ filterForQueryParams: true });
      const params = '?param=123&param2=abc';
      expect(slWithParams.isValid('linkedin', `http://www.linkedin.com/in/gkucmierz${params}`))
        .toBe(true);
    });

    test('should not filterForQueryParams in link', async () => {
      const slNoParams = await SocialLinks.create({ filterForQueryParams: false });
      const params = '?param=123&param2=abc';
      expect(slNoParams.isValid('linkedin', `http://www.linkedin.com/in/gkucmierz${params}`))
        .toBe(false);
    });

    test('should sanitize query params with filterForQueryParams = true', async () => {
      const slWithParams = await SocialLinks.create({ filterForQueryParams: true });
      const params = '?param=123&param2=abc';
      expect(slWithParams.sanitize('linkedin', `http://www.linkedin.com/in/gkucmierz${params}`))
        .toBe('https://linkedin.com/in/gkucmierz');
    });

    test('should not sanitize query params with filterForQueryParams = false', async () => {
      const slNoParams = await SocialLinks.create({ filterForQueryParams: false });
      const params = '?param=123&param2=abc';
      expect(() => slNoParams.sanitize('linkedin', `http://www.linkedin.com/in/gkucmierz${params}`))
        .toThrow();
    });

    test('should not use filterForQueryParams when only profileId is provided', async () => {
      const slWithParams = await SocialLinks.create({ filterForQueryParams: true });
      const params = '?param=123&param2=abc';
      expect(slWithParams.sanitize('linkedin', `gkucmierz${params}`))
        .toBe('https://linkedin.com/in/gkucmierz');
    });
  });
}); 