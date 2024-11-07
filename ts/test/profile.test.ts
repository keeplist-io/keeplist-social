import { describe, expect, test, beforeEach } from '@jest/globals';
import { SocialLinks } from '../src/index.ts';

describe('Profile Tests', () => {
  let sl: SocialLinks;

  beforeEach(async () => {
    sl = await SocialLinks.create();
  });

  function testProfile(profile: string, profileId: string, primary: string, alternates?: string[]) {
    expect(sl.isValid(profile, primary)).toBe(true);
    expect(sl.getProfileId(profile, primary)).toMatch(profileId);
    expect(sl.getLink(profile, profileId)).toMatch(primary);
    expect(sl.sanitize(profile, primary)).toMatch(primary);

    if (alternates?.length) {
      for (const alternate of alternates) {
        expect(sl.isValid(profile, alternate)).toBe(true);
        expect(sl.getProfileId(profile, alternate)).toMatch(profileId);
        expect(sl.sanitize(profile, alternate)).toMatch(primary);
      }
    }
  }

  test('Test Facebook', () => {
    const profile = 'facebook';
    const profileId = 'gkucmierz';
    const primary = `https://facebook.com/${profileId}`;
    const alternates = [`https://m.facebook.com/${profileId}`];
    testProfile(profile, profileId, primary, alternates);
  });

  test('Test Github', () => {
    const profile = 'github';
    const profileId = 'gkucmierz';
    const primary = `https://github.com/${profileId}`;
    testProfile(profile, profileId, primary);
  });

  test('Test Instagram', () => {
    const profile = 'instagram';
    const profileId = 'javascript.js';
    const primary = `https://instagram.com/${profileId}`;
    const alternates = [`https://m.instagram.com/${profileId}`];
    testProfile(profile, profileId, primary, alternates);
  });

  test('Test LinkedIn', () => {
    const profile = 'linkedin';
    const profileId = 'gkucmierz';
    const primary = `https://linkedin.com/in/${profileId}`;
    const alternates = [`https://linkedin.com/mwlite/in/${profileId}`];
    testProfile(profile, profileId, primary, alternates);
  });

  test('Test Medium', () => {
    const profile = 'medium';
    const profileId = 'grzegorzkumierz';
    const primary = `https://medium.com/@${profileId}`;
    testProfile(profile, profileId, primary);
  });

  test('Test Patreon', () => {
    const profile = 'patreon';
    const profileId = 'gkucmierz';
    const primary = `https://patreon.com/${profileId}`;
    testProfile(profile, profileId, primary);
  });

  test('Test StackOverflow', () => {
    const profile = 'stackoverflow';
    const profileId = '3573210';
    const primary = `https://stackoverflow.com/users/${profileId}`;
    testProfile(profile, profileId, primary);
  });

  test('Test recognize full StackOverflow link', () => {
    const profile = 'stackoverflow';
    const profileId = '3573210';
    const primary = `https://stackoverflow.com/users/${profileId}`;
    const fullLink = `https://stackoverflow.com/users/${profileId}/gkucmierz`;

    expect(sl.isValid(profile, fullLink)).toBe(true);
    expect(sl.getProfileId(profile, fullLink)).toMatch(profileId);
    expect(sl.sanitize(profile, fullLink)).toMatch(primary);
  });

  test('Test Substack', () => {
    const profile = 'substack';
    const profileId = 'gkucmierz';
    const primary = `https://${profileId}.substack.com`;
    testProfile(profile, profileId, primary);
  });

  test('Test Telegram', () => {
    const profile = 'telegram';
    const profileId = 'gkucmierz';
    const primary = `https://t.me/${profileId}`;
    testProfile(profile, profileId, primary);
  });

  test('Test TikTok', () => {
    const profile = 'tiktok';
    const profileId = 'gkucmierz';
    const primary = `https://tiktok.com/@${profileId}`;
    testProfile(profile, profileId, primary);
  });

  test('Test Twitch', () => {
    const profile = 'twitch';
    const profileId = 'gkucmierz';
    const primary = `https://twitch.tv/${profileId}`;
    const alternates = [`https://m.twitch.tv/${profileId}`];
    testProfile(profile, profileId, primary, alternates);
  });

  test('Test Twitter', () => {
    const profile = 'twitter';
    const profileId = 'mikewolfd';
    const primary = `https://x.com/${profileId}`;
    const alternates = [
      `https://www.twitter.com/@${profileId}`,
      `https://twitter.com/${profileId}`,
      `https://x.com/@${profileId}`,
      `https://m.x.com/${profileId}`
    ];
    testProfile(profile, profileId, primary, alternates);
  });

  test('Test Website', () => {
    const profile = 'website';
    const testUrls: Record<string, [boolean, string | null]> = {
      'https://www.example.com/path': [true, 'www.example.com/path'],
      'http://subdomain.example.co.uk/path?query=false': [true, 'subdomain.example.co.uk/path'],
      'ftp://ftp.example.biz/info': [true, 'ftp.example.biz/info'],
      'www.example.com': [true, 'www.example.com'],
      'example.com/path': [true, 'example.com/path'],
      'https://www.sd': [true, 'www.sd'],
      'www.sd': [true, 'www.sd'],
      'just-text': [false, null],
      'http://localhost': [false, null],
      '192.168.1.1': [false, null],
      'rofl://example.com/path': [true, 'example.com/path']
    };

    for (const [key, [isValidExpected, expectedValue]] of Object.entries(testUrls)) {
      const valid = sl.isValid(profile, key);
      expect(valid).toBe(isValidExpected);
      if (!valid) continue;
      expect(sl.getProfileId(profile, key)).toBe(expectedValue);
    }
  });

  test('Test YouTube Legacy Username', () => {
    const profile = 'youtube';
    const profileId = 'UCpHGx5iSfXZ-7AicGd6IZtg';
    const primary = `https://youtube.com/channel/${profileId}`;
    const alternates = [
      `https://m.youtube.com/channel/${profileId}`,
      `https://www.youtube.com/channel/${profileId}`
    ];
    testProfile(profile, profileId, primary, alternates);
  });

  test('Test YouTube v2 Username', () => {
    const profile = 'youtube';
    const profileId = '@mikewolfd';
    const primary = `https://youtube.com/${profileId}`;
    const alternates = [
      `https://www.youtube.com/${profileId}`,
      `https://m.youtube.com/${profileId}`
    ];
    testProfile(profile, profileId, primary, alternates);
  });

  test('Test Email', () => {
    const profile = 'email';
    const profileId = 'michael.f.deeb@gmail.com';
    const primary = `mailto:${profileId}`;
    testProfile(profile, profileId, primary);
  });

  test('Test Behance', () => {
    const profile = 'behance';
    const profileId = 'grzegorzkumierz';
    const primary = `https://behance.net/${profileId}`;
    testProfile(profile, profileId, primary);
  });

  test('Test Dev.to', () => {
    const profile = 'dev_to';
    const profileId = 'gkucmierz';
    const primary = `https://dev.to/${profileId}`;
    testProfile(profile, profileId, primary);
  });

  test('Test Dribbble', () => {
    const profile = 'dribbble';
    const profileId = 'gkucmierz';
    const primary = `https://dribbble.com/${profileId}`;
    testProfile(profile, profileId, primary);
  });

  test('Test Exercism', () => {
    const profile = 'exercism';
    const profileId = 'gkucmierz';
    const primary = `https://exercism.io/profiles/${profileId}`;
    testProfile(profile, profileId, primary);
  });

  test('Test Keybase', () => {
    const profile = 'keybase';
    const profileId = 'gkucmierz';
    const primary = `https://keybase.io/${profileId}`;
    testProfile(profile, profileId, primary);
  });

  test('Test Lemmy', () => {
    const profile = 'lemmy';
    const profileId = 'gkucmierz';
    const primary = `https://lemmy.world/u/${profileId}`;
    testProfile(profile, profileId, primary);

    // Additional invalid variations
    expect(sl.isValid(profile, `www.lemmy.world/u/${profileId}`)).toBe(false);
    expect(sl.isValid(profile, `http://www.lemmy.world/u/${profileId}`)).toBe(false);
  });

  test('Test Linktree', () => {
    const profile = 'linktree';
    const profileId = 'gkucmierz';
    const primary = `https://linktr.ee/${profileId}`;
    testProfile(profile, profileId, primary);
  });

  test('Test Mastodon', () => {
    const profile = 'mastodon';
    const profileId = 'gkucmierz';
    const primary = `https://mastodon.social/@${profileId}`;
    const alternates = [
      `https://mstdn.social/@${profileId}`,
      `https://mastodon.world/@${profileId}`
    ];
    testProfile(profile, profileId, primary, alternates);
  });

  test('Test Pinterest', () => {
    const profile = 'pinterest';
    const profileId = 'gkucmierz';
    const primary = `https://pinterest.com/${profileId}`;
    testProfile(profile, profileId, primary);
  });

  test('Test Soundcloud', () => {
    const profile = 'soundcloud';
    const profileId = 'gkucmierz';
    const primary = `https://soundcloud.com/${profileId}`;
    testProfile(profile, profileId, primary);
  });

  test('Test Spotify', () => {
    const profile = 'spotify';
    const profileId = 'gkucmierz';
    const primary = `https://open.spotify.com/user/${profileId}`;
    testProfile(profile, profileId, primary);
  });

  test('Test VK', () => {
    const profile = 'vk';
    const profileId = 'gkucmierz';
    const primary = `https://vk.com/${profileId}`;
    testProfile(profile, profileId, primary);
  });

  test('Test LinkedIn with localized URLs', () => {
    const profile = 'linkedin';
    const profileId = 'anton-begehr';
    expect(sl.isValid(profile, 'https://de.linkedin.com/in/anton-begehr/')).toBe(true);
    expect(sl.isValid(profile, 'https://de.linkedin.com/mwlite/in/anton-begehr/')).toBe(true);
    expect(sl.sanitize(profile, 'https://de.linkedin.com/in/anton-begehr/')).toBe('https://linkedin.com/in/anton-begehr');
    expect(sl.sanitize(profile, 'https://de.linkedin.com/mwlite/in/anton-begehr/')).toBe('https://linkedin.com/in/anton-begehr');
  });

  test('Test Mastodon URL variations', () => {
    const profile = 'mastodon';
    const profileId = 'gkucmierz';
    const domains = ['mastodon.social', 'mstdn.social', 'mastodon.world'];
    
    domains.forEach(domain => {
      expect(sl.isValid(profile, `https://${domain}/@${profileId}`)).toBe(true);
      expect(sl.isValid(profile, `http://${domain}/@${profileId}`)).toBe(true);
      expect(sl.isValid(profile, `${domain}/@${profileId}/`)).toBe(true);
      expect(sl.isValid(profile, `http://${domain}/@${profileId}/`)).toBe(true);
      expect(sl.isValid(profile, `www.${domain}/@${profileId}`)).toBe(true);
      expect(sl.isValid(profile, `http://www.${domain}/@${profileId}`)).toBe(true);
    });
  });

  test('Test Soundcloud URL variations', () => {
    const profile = 'soundcloud';
    const profileId = 'gkucmierz';
    const primary = `https://soundcloud.com/${profileId}`;
    
    // Test various URL formats
    expect(sl.isValid(profile, `http://soundcloud.com/${profileId}`)).toBe(true);
    expect(sl.isValid(profile, `www.soundcloud.com/${profileId}`)).toBe(true);
    expect(sl.isValid(profile, `soundcloud.com/${profileId}/`)).toBe(true);
    expect(sl.isValid(profile, `https://www.soundcloud.com/${profileId}/`)).toBe(true);
  });

  test('Test Spotify URL variations', () => {
    const profile = 'spotify';
    const profileId = 'gkucmierz';
    const primary = `https://open.spotify.com/user/${profileId}`;
    
    // Test various URL formats
    expect(sl.isValid(profile, `http://open.spotify.com/user/${profileId}`)).toBe(true);
    expect(sl.isValid(profile, `www.open.spotify.com/user/${profileId}`)).toBe(true);
    expect(sl.isValid(profile, `open.spotify.com/user/${profileId}/`)).toBe(true);
    expect(sl.isValid(profile, `https://open.spotify.com/user/${profileId}/`)).toBe(true);
  });

  test('Test Behance URL variations', () => {
    const profile = 'behance';
    const profileId = 'grzegorzkumierz';
    const primary = `https://behance.net/${profileId}`;
    
    // Test various URL formats
    expect(sl.isValid(profile, `http://behance.net/${profileId}`)).toBe(true);
    expect(sl.isValid(profile, `www.behance.net/${profileId}`)).toBe(true);
    expect(sl.isValid(profile, `behance.net/${profileId}/`)).toBe(true);
    expect(sl.isValid(profile, `https://www.behance.net/${profileId}/`)).toBe(true);
  });

  test('Test Dev.to URL variations', () => {
    const profile = 'dev_to';
    const profileId = 'gkucmierz';
    const primary = `https://dev.to/${profileId}`;
    
    // Test various URL formats
    expect(sl.isValid(profile, `http://dev.to/${profileId}`)).toBe(true);
    expect(sl.isValid(profile, `www.dev.to/${profileId}`)).toBe(true);
    expect(sl.isValid(profile, `dev.to/${profileId}/`)).toBe(true);
    expect(sl.isValid(profile, `https://www.dev.to/${profileId}/`)).toBe(true);
  });

  test('Test Dribbble URL variations', () => {
    const profile = 'dribbble';
    const profileId = 'gkucmierz';
    const primary = `https://dribbble.com/${profileId}`;
    
    // Test various URL formats
    expect(sl.isValid(profile, `http://dribbble.com/${profileId}`)).toBe(true);
    expect(sl.isValid(profile, `www.dribbble.com/${profileId}`)).toBe(true);
    expect(sl.isValid(profile, `dribbble.com/${profileId}/`)).toBe(true);
    expect(sl.isValid(profile, `https://www.dribbble.com/${profileId}/`)).toBe(true);
  });

  test('Test Exercism URL variations', () => {
    const profile = 'exercism';
    const profileId = 'gkucmierz';
    const primary = `https://exercism.io/profiles/${profileId}`;
    
    // Test various URL formats
    expect(sl.isValid(profile, `http://exercism.io/profiles/${profileId}`)).toBe(true);
    expect(sl.isValid(profile, `www.exercism.io/profiles/${profileId}`)).toBe(true);
    expect(sl.isValid(profile, `exercism.io/profiles/${profileId}/`)).toBe(true);
    expect(sl.isValid(profile, `https://www.exercism.io/profiles/${profileId}/`)).toBe(true);
  });

  test('Test Keybase URL variations', () => {
    const profile = 'keybase';
    const profileId = 'gkucmierz';
    const primary = `https://keybase.io/${profileId}`;
    
    // Test various URL formats
    expect(sl.isValid(profile, `http://keybase.io/${profileId}`)).toBe(true);
    expect(sl.isValid(profile, `www.keybase.io/${profileId}`)).toBe(true);
    expect(sl.isValid(profile, `keybase.io/${profileId}/`)).toBe(true);
    expect(sl.isValid(profile, `https://www.keybase.io/${profileId}/`)).toBe(true);
  });

  test('Test Linktree URL variations', () => {
    const profile = 'linktree';
    const profileId = 'gkucmierz';
    const primary = `https://linktr.ee/${profileId}`;
    
    // Test various URL formats
    expect(sl.isValid(profile, `http://linktr.ee/${profileId}`)).toBe(true);
    expect(sl.isValid(profile, `www.linktr.ee/${profileId}`)).toBe(true);
    expect(sl.isValid(profile, `linktr.ee/${profileId}/`)).toBe(true);
    expect(sl.isValid(profile, `https://www.linktr.ee/${profileId}/`)).toBe(true);
  });

  test('Test Pinterest URL variations', () => {
    const profile = 'pinterest';
    const profileId = 'gkucmierz';
    const primary = `https://pinterest.com/${profileId}`;
    
    // Test various URL formats
    expect(sl.isValid(profile, `http://pinterest.com/${profileId}`)).toBe(true);
    expect(sl.isValid(profile, `www.pinterest.com/${profileId}`)).toBe(true);
    expect(sl.isValid(profile, `pinterest.com/${profileId}/`)).toBe(true);
    expect(sl.isValid(profile, `https://www.pinterest.com/${profileId}/`)).toBe(true);
  });

  test('Test VK URL variations', () => {
    const profile = 'vk';
    const profileId = 'gkucmierz';
    const primary = `https://vk.com/${profileId}`;
    
    // Test various URL formats
    expect(sl.isValid(profile, `http://vk.com/${profileId}`)).toBe(true);
    expect(sl.isValid(profile, `www.vk.com/${profileId}`)).toBe(true);
    expect(sl.isValid(profile, `vk.com/${profileId}/`)).toBe(true);
    expect(sl.isValid(profile, `https://www.vk.com/${profileId}/`)).toBe(true);
  });

  test('Test Amazon', () => {
    const profile = 'amazon';
    const profileId = 'storename';
    const primary = `https://amazon.com/shop/${profileId}`;
    testProfile(profile, profileId, primary);

    // Test various URL formats
    expect(sl.isValid(profile, `http://amazon.com/shop/${profileId}`)).toBe(true);
    expect(sl.isValid(profile, `www.amazon.com/shop/${profileId}`)).toBe(true);
    expect(sl.isValid(profile, `amazon.com/shop/${profileId}/`)).toBe(true);
    expect(sl.isValid(profile, `https://www.amazon.com/shop/${profileId}/`)).toBe(true);
  });

  test('Test Apple Podcasts', () => {
    const profile = 'applepodcasts';
    const podcastName = 'test-podcast';
    const profileId = '12345678';
    const primary = `https://podcasts.apple.com/podcast/id${profileId}`;
    const alternates = [
      `https://podcasts.apple.com/podcast/${podcastName}/id${profileId}/`,
    ];
    testProfile(profile, profileId, primary, alternates);

    // Test various URL formats
    const region = 'us';
    expect(sl.isValid(profile, `https://podcasts.apple.com/${region}/podcast/${podcastName}/id${profileId}`)).toBe(true);
    expect(sl.isValid(profile, `podcasts.apple.com/${region}/podcast/${podcastName}/id${profileId}`)).toBe(true);
    expect(sl.isValid(profile, `www.podcasts.apple.com/${region}/podcast/${podcastName}/id${profileId}`)).toBe(false);
    expect(sl.sanitize(profile, `https://podcasts.apple.com/${region}/podcast/${podcastName}/id${profileId}`))
      .toBe(primary);
  });

  test('Test Cameo', () => {
    const profile = 'cameo';
    const profileId = 'username';
    const primary = `https://cameo.com/${profileId}`;
    testProfile(profile, profileId, primary);

    // Test various URL formats
    expect(sl.isValid(profile, `http://cameo.com/${profileId}`)).toBe(true);
    expect(sl.isValid(profile, `www.cameo.com/${profileId}`)).toBe(true);
    expect(sl.isValid(profile, `cameo.com/${profileId}/`)).toBe(true);
    expect(sl.isValid(profile, `https://www.cameo.com/${profileId}/`)).toBe(true);
  });

  test('Test Clubhouse', () => {
    const profile = 'clubhouse';
    const profileId = 'username';
    const primary = `https://clubhouse.com/@${profileId}`;
    testProfile(profile, profileId, primary);

    // Test various URL formats
    expect(sl.isValid(profile, `http://clubhouse.com/@${profileId}`)).toBe(true);
    expect(sl.isValid(profile, `www.clubhouse.com/@${profileId}`)).toBe(true);
    expect(sl.isValid(profile, `clubhouse.com/@${profileId}/`)).toBe(true);
    expect(sl.isValid(profile, `https://www.clubhouse.com/@${profileId}/`)).toBe(true);
    expect(sl.isValid(profile, `@${profileId}`)).toBe(true);
    expect(sl.sanitize(profile, `@${profileId}`)).toBe(primary);
  });

  test('Test Etsy', () => {
    const profile = 'etsy';
    const profileId = 'shopname';
    const primary = `https://etsy.com/shop/${profileId}`;
    testProfile(profile, profileId, primary);

    // Test various URL formats
    expect(sl.isValid(profile, `http://etsy.com/shop/${profileId}`)).toBe(true);
    expect(sl.isValid(profile, `www.etsy.com/shop/${profileId}`)).toBe(true);
    expect(sl.isValid(profile, `etsy.com/shop/${profileId}/`)).toBe(true);
    expect(sl.isValid(profile, `https://www.etsy.com/shop/${profileId}/`)).toBe(true);
  });

  test('Test Kick', () => {
    const profile = 'kick';
    const profileId = 'username';
    const primary = `https://kick.com/${profileId}`;
    testProfile(profile, profileId, primary);

    // Test various URL formats
    expect(sl.isValid(profile, `http://kick.com/${profileId}`)).toBe(true);
    expect(sl.isValid(profile, `www.kick.com/${profileId}`)).toBe(true);
    expect(sl.isValid(profile, `kick.com/${profileId}/`)).toBe(true);
    expect(sl.isValid(profile, `https://www.kick.com/${profileId}/`)).toBe(true);
  });

  test('Test Postmark', () => {
    const profile = 'postmark';
    const profileId = 'username';
    const primary = `https://postmark.com/@${profileId}`;
    testProfile(profile, profileId, primary);

    // Test various URL formats
    expect(sl.isValid(profile, `http://postmark.com/@${profileId}`)).toBe(true);
    expect(sl.isValid(profile, `www.postmark.com/@${profileId}`)).toBe(true);
    expect(sl.isValid(profile, `postmark.com/@${profileId}/`)).toBe(true);
    expect(sl.isValid(profile, `https://www.postmark.com/@${profileId}/`)).toBe(true);
    expect(sl.isValid(profile, `@${profileId}`)).toBe(true);
    expect(sl.sanitize(profile, `@${profileId}`)).toBe(primary);
  });

  test('Test Signal', () => {
    const profile = 'signal';
    const profileId = '123456789';
    const primary = `https://signal.me/#p/${profileId}`;
    testProfile(profile, profileId, primary);

    // Test various URL formats
    expect(sl.isValid(profile, `http://signal.me/#p/${profileId}`)).toBe(true);
    expect(sl.isValid(profile, `www.signal.me/#p/${profileId}`)).toBe(true);
    expect(sl.isValid(profile, `signal.me/#p/${profileId}/`)).toBe(true);
    expect(sl.isValid(profile, `https://www.signal.me/#p/${profileId}/`)).toBe(true);
  });

  test('Test Reddit', () => {
    const profile = 'reddit';
    const profileId = 'spez';
    const primary = `https://reddit.com/user/${profileId}`;
    
    // Test various URL formats
    expect(sl.isValid(profile, `https://reddit.com/user/${profileId}`)).toBe(true);
    expect(sl.isValid(profile, `https://reddit.com/u/${profileId}`)).toBe(true);
    expect(sl.isValid(profile, `reddit.com/u/${profileId}`)).toBe(true);
    expect(sl.isValid(profile, `www.reddit.com/u/${profileId}`)).toBe(true);
    expect(sl.isValid(profile, `/u/${profileId}`)).toBe(true);
    expect(sl.isValid(profile, `u/${profileId}`)).toBe(true);
    expect(sl.isValid(profile, profileId)).toBe(true);
    
    // Test sanitization
    expect(sl.sanitize(profile, `https://reddit.com/u/${profileId}`)).toBe(primary);
    expect(sl.sanitize(profile, `/u/${profileId}`)).toBe(primary);
    expect(sl.sanitize(profile, `u/${profileId}`)).toBe(primary);
    expect(sl.sanitize(profile, profileId)).toBe(primary);
  });

  test('Test Threads', () => {
    const profile = 'threads';
    const profileId = 'zuck';
    const primary = `https://threads.net/@${profileId}`;
    
    // Test various URL formats
    expect(sl.isValid(profile, `https://threads.net/@${profileId}`)).toBe(true);
    expect(sl.isValid(profile, `http://threads.net/@${profileId}`)).toBe(true);
    expect(sl.isValid(profile, `threads.net/@${profileId}`)).toBe(true);
    expect(sl.isValid(profile, `www.threads.net/@${profileId}`)).toBe(true);
    expect(sl.isValid(profile, `https://www.threads.net/@${profileId}/`)).toBe(true);
    expect(sl.isValid(profile, `@${profileId}`)).toBe(true);
    expect(sl.isValid(profile, profileId)).toBe(true);
    
    // Test sanitization
    expect(sl.sanitize(profile, `https://www.threads.net/@${profileId}`)).toBe(primary);
    expect(sl.sanitize(profile, `@${profileId}`)).toBe(primary);
    expect(sl.sanitize(profile, profileId)).toBe(primary);

    // Test with different username formats
    const testUsernames = ['user_123', 'user.name.123', 'user-name', 'username123'];
    testUsernames.forEach(username => {
      expect(sl.isValid(profile, `https://threads.net/@${username}`)).toBe(true);
      expect(sl.isValid(profile, `@${username}`)).toBe(true);
      expect(sl.sanitize(profile, `@${username}`))
        .toBe(`https://threads.net/@${username}`);
    });
  });
}); 