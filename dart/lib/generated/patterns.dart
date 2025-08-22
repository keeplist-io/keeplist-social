// Generated file. Do not edit.
import '../types.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';

final Map<String, Profile> defaultProfiles = {
  'amazon': Profile(
    name: 'amazon',
    title: 'Amazon',
    hint: 'username',
 icon: FontAwesomeIcons.amazon,    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?amazon.com/shop/({PROFILE_ID})/?', group: 3, pattern: 'https://amazon.com/shop/{PROFILE_ID}'),
      Link(match: '({PROFILE_ID})', group: 1),
    ],
  ),
  'applemusic': Profile(
    name: 'applemusic',
    title: 'Apple Music',
    hint: 'username',
 icon: FontAwesomeIcons.apple,    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?music.apple.com/[\\w]+/artist/({PROFILE_ID})/?', group: 3, pattern: 'https://music.apple.com/artist/{PROFILE_ID}'),
      Link(match: '({PROFILE_ID})', group: 1),
    ],
  ),
  'applepodcasts': Profile(
    name: 'applepodcasts',
    title: 'Apple Podcasts',
    hint: 'username',
 icon: FontAwesomeIcons.podcast,    matches: [
      Link(match: '(https?://)?podcasts\\.apple\\.com/(?:[\\w]+/)?podcast/(?:[\\w-]+/)?id(\\d+)/?', group: 2, pattern: 'https://podcasts.apple.com/podcast/id{PROFILE_ID}'),
      Link(match: '({PROFILE_ID})', group: 1),
    ],
  ),
  'appstore': Profile(
    name: 'appstore',
    title: 'App Store',
    hint: 'username',
 icon: FontAwesomeIcons.appStore,    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?apps.apple.com/[\\w]+/app/[\\w-]+/id({PROFILE_ID})/?', group: 3, pattern: 'https://apps.apple.com/app/id{PROFILE_ID}'),
      Link(match: '({PROFILE_ID})', group: 1),
    ],
  ),
  'bandcamp': Profile(
    name: 'bandcamp',
    title: 'Bandcamp',
    hint: 'username',
 icon: FontAwesomeIcons.bandcamp,    matches: [
      Link(match: '(https?://)?({PROFILE_ID})\\.bandcamp\\.com/?', group: 2, pattern: 'https://{PROFILE_ID}.bandcamp.com'),
      Link(match: '({PROFILE_ID})', group: 1),
    ],
  ),
  'behance': Profile(
    name: 'behance',
    title: 'Behance',
    hint: 'username',
 icon: FontAwesomeIcons.behance,    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?behance.net/({PROFILE_ID})/?', group: 3, pattern: 'https://behance.net/{PROFILE_ID}'),
      Link(match: '({PROFILE_ID})', group: 1),
    ],
  ),
  'bluesky': Profile(
    name: 'bluesky',
    title: 'Bluesky',
    hint: 'username',
 icon: FontAwesomeIcons.bluesky,    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?bsky.app/profile/({PROFILE_ID}(\\.\\w+)+)/?', group: 3, pattern: 'https://bsky.app/profile/{PROFILE_ID}'),
      Link(match: '@?({PROFILE_ID}(\\.\\w+)+)', group: 1),
    ],
  ),
  'discord': Profile(
    name: 'discord',
    title: 'Discord',
    hint: 'username',
 icon: FontAwesomeIcons.discord,    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?discord.gg/({PROFILE_ID})/?', group: 3, pattern: 'https://discord.gg/{PROFILE_ID}'),
      Link(match: '(https?://)?([\\w.]*\\.)?discord.com/invite/({PROFILE_ID})/?', group: 3, pattern: 'https://discord.gg/{PROFILE_ID}'),
      Link(match: '({PROFILE_ID})', group: 1),
    ],
  ),
  'dribbble': Profile(
    name: 'dribbble',
    title: 'Dribbble',
    hint: 'username',
 icon: FontAwesomeIcons.dribbble,    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?dribbble.com/({PROFILE_ID})/?', group: 3, pattern: 'https://dribbble.com/{PROFILE_ID}'),
      Link(match: '({PROFILE_ID})', group: 1),
    ],
  ),
  'email': Profile(
    name: 'email',
    title: 'Email',
    hint: 'username@domain.com',
    pattern: '[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}',
 icon: FontAwesomeIcons.envelope,    matches: [
      Link(match: 'mailto:({PROFILE_ID})/?', group: 1, pattern: 'mailto:{PROFILE_ID}', idPattern: '[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}'),
      Link(match: '({PROFILE_ID})', group: 1, idPattern: '[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}'),
    ],
  ),
  'etsy': Profile(
    name: 'etsy',
    title: 'Etsy',
    hint: 'username',
 icon: FontAwesomeIcons.etsy,    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?etsy.com/shop/({PROFILE_ID})/?', group: 3, pattern: 'https://etsy.com/shop/{PROFILE_ID}'),
      Link(match: '({PROFILE_ID})', group: 1),
    ],
  ),
  'facebook': Profile(
    name: 'facebook',
    title: 'Facebook',
    hint: 'username',
 icon: FontAwesomeIcons.facebookF,    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?facebook.com/({PROFILE_ID})/?', group: 3, pattern: 'https://facebook.com/{PROFILE_ID}'),
      Link(match: '({PROFILE_ID})', group: 1),
    ],
  ),
  'github': Profile(
    name: 'github',
    title: 'Github',
    hint: 'username',
 icon: FontAwesomeIcons.github,    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?github.com/({PROFILE_ID})/?', group: 3, pattern: 'https://github.com/{PROFILE_ID}'),
      Link(match: '({PROFILE_ID})', group: 1),
    ],
  ),
  'goodreads': Profile(
    name: 'goodreads',
    title: 'Goodreads',
    hint: 'username',
 icon: FontAwesomeIcons.goodreads,    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?goodreads.com/user/show/([\\d]+(?:-[\\w-]+)?)/?/?', group: 3, pattern: 'https://goodreads.com/user/show/{PROFILE_ID}'),
      Link(match: '([\\d]+(?:-[\\w-]+)?)', group: 1),
    ],
  ),
  'instagram': Profile(
    name: 'instagram',
    title: 'Instagram',
    hint: 'username',
 icon: FontAwesomeIcons.instagram,    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?instagram.com/({PROFILE_ID})/?', group: 3, pattern: 'https://instagram.com/{PROFILE_ID}'),
      Link(match: '@?({PROFILE_ID})', group: 1),
    ],
  ),
  'keybase': Profile(
    name: 'keybase',
    title: 'Keybase',
    hint: 'username',
 icon: FontAwesomeIcons.keybase,    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?keybase.io/({PROFILE_ID})/?', group: 3, pattern: 'https://keybase.io/{PROFILE_ID}'),
      Link(match: '({PROFILE_ID})', group: 1),
    ],
  ),
  'letterboxd': Profile(
    name: 'letterboxd',
    title: 'Letterboxd',
    hint: 'username',
 icon: FontAwesomeIcons.letterboxd,    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?letterboxd.com/([\\w]{2,15})/?', group: 3, pattern: 'https://letterboxd.com/{PROFILE_ID}'),
      Link(match: '^[\\w]{2,15}', group: 0),
    ],
  ),
  'linkedin': Profile(
    name: 'linkedin',
    title: 'Linkedin',
    hint: 'in/username',
 icon: FontAwesomeIcons.linkedinIn,    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?linkedin.com/in/({PROFILE_ID})/?', group: 3, pattern: 'https://linkedin.com/in/{PROFILE_ID}'),
      Link(match: '(https?://)?([\\w.]*\\.)?linkedin.com/mwlite/in/({PROFILE_ID})/?', group: 3, pattern: 'https://linkedin.com/in/{PROFILE_ID}'),
      Link(match: '({PROFILE_ID})', group: 1),
    ],
  ),
  'linktree': Profile(
    name: 'linktree',
    title: 'Linktree',
    hint: 'username',
    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?linktr.ee/({PROFILE_ID})/?', group: 3, pattern: 'https://linktr.ee/{PROFILE_ID}'),
      Link(match: '({PROFILE_ID})', group: 1),
    ],
  ),
  'mastodon': Profile(
    name: 'mastodon',
    title: 'Mastodon',
    hint: 'username',
 icon: FontAwesomeIcons.mastodon,    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?mastodon.social/@({PROFILE_ID})/?', group: 3, pattern: 'https://mastodon.social/@{PROFILE_ID}'),
      Link(match: '(https?://)?([\\w.]*\\.)?mstdn.social/@({PROFILE_ID})/?', group: 3, pattern: 'https://mstdn.social/@{PROFILE_ID}'),
      Link(match: '(https?://)?([\\w.]*\\.)?mastodon.world/@({PROFILE_ID})/?', group: 3, pattern: 'https://mastodon.world/@{PROFILE_ID}'),
      Link(match: '@?({PROFILE_ID})(@mastodon.social)?', group: 1),
      Link(match: '@?({PROFILE_ID})(@mstdn.social)?', group: 1),
      Link(match: '@?({PROFILE_ID})(@mastodon.world)?', group: 1),
    ],
  ),
  'medium': Profile(
    name: 'medium',
    title: 'Medium',
    hint: '@username',
 icon: FontAwesomeIcons.medium,    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?medium.com/@({PROFILE_ID})/?', group: 3, pattern: 'https://medium.com/@{PROFILE_ID}'),
      Link(match: '@?({PROFILE_ID})', group: 1),
    ],
  ),
  'patreon': Profile(
    name: 'patreon',
    title: 'Patreon',
    hint: 'username',
 icon: FontAwesomeIcons.patreon,    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?patreon.com/({PROFILE_ID})/?', group: 3, pattern: 'https://patreon.com/{PROFILE_ID}'),
      Link(match: '({PROFILE_ID})', group: 1),
    ],
  ),
  'pinterest': Profile(
    name: 'pinterest',
    title: 'Pinterest',
    hint: 'username',
 icon: FontAwesomeIcons.pinterestP,    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?pinterest.com/({PROFILE_ID})/?', group: 3, pattern: 'https://pinterest.com/{PROFILE_ID}'),
      Link(match: '({PROFILE_ID})', group: 1),
    ],
  ),
  'playstore': Profile(
    name: 'playstore',
    title: 'Playstore',
    hint: 'username',
 icon: FontAwesomeIcons.googlePlay,    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?play.google.com/store/apps/details\\?id=({PROFILE_ID})/?', group: 3, pattern: 'https://play.google.com/store/apps/details?id={PROFILE_ID}'),
      Link(match: '({PROFILE_ID})', group: 1),
    ],
  ),
  'reddit': Profile(
    name: 'reddit',
    title: 'Reddit',
    hint: 'username',
 icon: FontAwesomeIcons.redditAlien,    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?reddit.com/user|u/({PROFILE_ID})/?', group: 3, pattern: 'https://reddit.com/user/{PROFILE_ID}'),
      Link(match: 'u/({PROFILE_ID})', group: 1),
      Link(match: '({PROFILE_ID})', group: 1),
    ],
  ),
  'signal': Profile(
    name: 'signal',
    title: 'Signal',
    hint: 'username',
 icon: FontAwesomeIcons.signalMessenger,    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?signal.me/#p/({PROFILE_ID})/?', group: 3, pattern: 'https://signal.me/#p/{PROFILE_ID}'),
      Link(match: '({PROFILE_ID})', group: 1),
    ],
  ),
  'snapchat': Profile(
    name: 'snapchat',
    title: 'Snapchat',
    hint: 'username',
 icon: FontAwesomeIcons.snapchat,    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?snapchat.com/add/({PROFILE_ID})/?', group: 3, pattern: 'https://snapchat.com/add/{PROFILE_ID}'),
      Link(match: '@?({PROFILE_ID})', group: 1),
    ],
  ),
  'soundcloud': Profile(
    name: 'soundcloud',
    title: 'Soundcloud',
    hint: 'username',
 icon: FontAwesomeIcons.soundcloud,    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?soundcloud.com/({PROFILE_ID})/?', group: 3, pattern: 'https://soundcloud.com/{PROFILE_ID}'),
      Link(match: '({PROFILE_ID})', group: 1),
    ],
  ),
  'spotify': Profile(
    name: 'spotify',
    title: 'Spotify',
    hint: 'username',
 icon: FontAwesomeIcons.spotify,    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?open.spotify.com/user/({PROFILE_ID})/?', group: 3, pattern: 'https://open.spotify.com/user/{PROFILE_ID}'),
      Link(match: '({PROFILE_ID})', group: 1),
    ],
  ),
  'stackoverflow': Profile(
    name: 'stackoverflow',
    title: 'Stack Overflow',
    hint: 'user-id',
 icon: FontAwesomeIcons.stackOverflow,    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?stackoverflow.com/users/({PROFILE_ID})(/[A-Za-z0-9_\\-\\.]+)?/?', group: 3, pattern: 'https://stackoverflow.com/users/{PROFILE_ID}'),
      Link(match: '({PROFILE_ID})', group: 1),
    ],
  ),
  'substack': Profile(
    name: 'substack',
    title: 'Substack',
    hint: 'username',
 icon: BootstrapIcons.substack,    matches: [
      Link(match: '(https?://)?({PROFILE_ID}).substack.com/?', group: 2, pattern: 'https://{PROFILE_ID}.substack.com'),
      Link(match: '({PROFILE_ID})', group: 1),
    ],
  ),
  'telegram': Profile(
    name: 'telegram',
    title: 'Telegram',
    hint: 'username',
 icon: FontAwesomeIcons.telegram,    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?(t.me|telegram.me)/({PROFILE_ID})/?', group: 4, pattern: 'https://t.me/{PROFILE_ID}'),
      Link(match: '@?({PROFILE_ID})', group: 1),
    ],
  ),
  'threads': Profile(
    name: 'threads',
    title: 'Threads',
    hint: 'username',
 icon: FontAwesomeIcons.threads,    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?threads.net/@({PROFILE_ID})/?', group: 3, pattern: 'https://threads.net/@{PROFILE_ID}'),
      Link(match: '@?({PROFILE_ID})', group: 1),
    ],
  ),
  'tiktok': Profile(
    name: 'tiktok',
    title: 'Tiktok',
    hint: '@username',
 icon: FontAwesomeIcons.tiktok,    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?tiktok.com/@({PROFILE_ID})/?', group: 3, pattern: 'https://tiktok.com/@{PROFILE_ID}'),
      Link(match: '@?({PROFILE_ID})', group: 1),
    ],
  ),
  'twitch': Profile(
    name: 'twitch',
    title: 'Twitch',
    hint: 'username',
 icon: FontAwesomeIcons.twitch,    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?twitch.tv/({PROFILE_ID})/?', group: 3, pattern: 'https://twitch.tv/{PROFILE_ID}'),
      Link(match: '({PROFILE_ID})', group: 1),
    ],
  ),
  'twitter': Profile(
    name: 'twitter',
    title: 'X (Twitter)',
    hint: 'username',
 icon: FontAwesomeIcons.xTwitter,    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?twitter.com/@?({PROFILE_ID})/?', group: 3, pattern: 'https://x.com/{PROFILE_ID}'),
      Link(match: '(https?://)?([\\w.]*\\.)?x.com/@?({PROFILE_ID})/?', group: 3, pattern: 'https://x.com/{PROFILE_ID}'),
      Link(match: '@?({PROFILE_ID})', group: 1),
    ],
  ),
  'vk': Profile(
    name: 'vk',
    title: 'Vk',
    hint: 'username',
 icon: FontAwesomeIcons.vk,    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?vk.com/({PROFILE_ID})/?', group: 3, pattern: 'https://vk.com/{PROFILE_ID}'),
      Link(match: '({PROFILE_ID})', group: 1),
    ],
  ),
  'website': Profile(
    name: 'website',
    title: 'Website',
    hint: 'https://example.com',
    forceStripQuery: true,
 icon: FontAwesomeIcons.globe,    matches: [
      Link(match: '^(?:https://)?([a-z0-9.-]+\\.[a-z]{2,}(?:/[^?#]*)?)', group: 1, pattern: 'https://{PROFILE_ID}'),
    ],
  ),
  'whatsapp': Profile(
    name: 'whatsapp',
    title: 'Whatsapp',
    hint: 'username',
 icon: FontAwesomeIcons.whatsapp,    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?wa.me/({PROFILE_ID})/?', group: 3, pattern: 'https://wa.me/{PROFILE_ID}'),
      Link(match: '(https?://)?([\\w.]*\\.)?whatsapp.com/send\\?phone=({PROFILE_ID})/?', group: 3, pattern: 'https://wa.me/{PROFILE_ID}'),
      Link(match: '({PROFILE_ID})', group: 1),
    ],
  ),
  'youtube': Profile(
    name: 'youtube',
    title: 'Youtube',
    hint: '@username',
 icon: FontAwesomeIcons.youtubeSquare,    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?youtube.com/({PROFILE_ID})/?', group: 3, pattern: 'https://youtube.com/{PROFILE_ID}', idPattern: '@{PROFILE_ID}'),
      Link(match: '(https?://)?([\\w.]*\\.)?youtube.com/c/({PROFILE_ID})/?', group: 3, pattern: 'https://youtube.com/{PROFILE_ID}', idPattern: '@{PROFILE_ID}'),
      Link(match: '(https?://)?([\\w.]*\\.)?youtube.com/channel/({PROFILE_ID})/?', group: 3, pattern: 'https://youtube.com/channel/{PROFILE_ID}', idPattern: '[^@]{PROFILE_ID}'),
      Link(match: '({PROFILE_ID})', group: 1),
    ],
  ),
};
