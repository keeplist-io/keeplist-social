// Generated file. Do not edit.
import '../types.dart';

final Map<String, List<Link>> defaultProfiles = {
  'amazon': Profile(
    name: 'amazon',
    icon: IconDefinition(iconType: 'fa', value: 'amazon', faStyle: FaIconStyle.brands),
    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?amazon.com/shop/({PROFILE_ID})/?', group: 3, pattern: 'https://amazon.com/shop/{PROFILE_ID}'),
      Link(match: '({PROFILE_ID})', group: 1),
    ],
  ).matches,
  'applemusic': Profile(
    name: 'applemusic',
    icon: IconDefinition(iconType: 'fa', value: 'apple', faStyle: FaIconStyle.brands),
    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?music.apple.com/[\\w]+/artist/({PROFILE_ID})/?', group: 3, pattern: 'https://music.apple.com/artist/{PROFILE_ID}'),
      Link(match: '({PROFILE_ID})', group: 1),
    ],
  ).matches,
  'applepodcasts': Profile(
    name: 'applepodcasts',
    icon: IconDefinition(iconType: 'fa', value: 'podcast', faStyle: FaIconStyle.solid),
    matches: [
      Link(match: '(https?://)?podcasts\\.apple\\.com/(?:[\\w]+/)?podcast/(?:[\\w-]+/)?id(\\d+)/?', group: 2, pattern: 'https://podcasts.apple.com/podcast/id{PROFILE_ID}'),
      Link(match: '({PROFILE_ID})', group: 1),
    ],
  ).matches,
  'appstore': Profile(
    name: 'appstore',
    icon: IconDefinition(iconType: 'fa', value: 'app-store', faStyle: FaIconStyle.brands),
    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?apps.apple.com/[\\w]+/app/[\\w-]+/id({PROFILE_ID})/?', group: 3, pattern: 'https://apps.apple.com/app/id{PROFILE_ID}'),
      Link(match: '({PROFILE_ID})', group: 1),
    ],
  ).matches,
  'bandcamp': Profile(
    name: 'bandcamp',
    icon: IconDefinition(iconType: 'fa', value: 'bandcamp', faStyle: FaIconStyle.brands),
    matches: [
      Link(match: '(https?://)?({PROFILE_ID})\\.bandcamp\\.com/?', group: 2, pattern: 'https://{PROFILE_ID}.bandcamp.com'),
      Link(match: '({PROFILE_ID})', group: 1),
    ],
  ).matches,
  'behance': Profile(
    name: 'behance',
    icon: IconDefinition(iconType: 'fa', value: 'behance', faStyle: FaIconStyle.brands),
    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?behance.net/({PROFILE_ID})/?', group: 3, pattern: 'https://behance.net/{PROFILE_ID}'),
      Link(match: '({PROFILE_ID})', group: 1),
    ],
  ).matches,
  'bluesky': Profile(
    name: 'bluesky',
    icon: IconDefinition(iconType: 'fa', value: 'bluesky', faStyle: FaIconStyle.brands),
    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?bsky.app/profile/({PROFILE_ID}(\\.\\w+)+)/?', group: 3, pattern: 'https://bsky.app/profile/{PROFILE_ID}'),
      Link(match: '@?({PROFILE_ID}(\\.\\w+)+)', group: 1),
    ],
  ).matches,
  'discord': Profile(
    name: 'discord',
    icon: IconDefinition(iconType: 'fa', value: 'discord', faStyle: FaIconStyle.brands),
    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?discord.gg/({PROFILE_ID})/?', group: 3, pattern: 'https://discord.gg/{PROFILE_ID}'),
      Link(match: '(https?://)?([\\w.]*\\.)?discord.com/invite/({PROFILE_ID})/?', group: 3, pattern: 'https://discord.gg/{PROFILE_ID}'),
      Link(match: '({PROFILE_ID})', group: 1),
    ],
  ).matches,
  'dribbble': Profile(
    name: 'dribbble',
    icon: IconDefinition(iconType: 'fa', value: 'dribbble', faStyle: FaIconStyle.brands),
    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?dribbble.com/({PROFILE_ID})/?', group: 3, pattern: 'https://dribbble.com/{PROFILE_ID}'),
      Link(match: '({PROFILE_ID})', group: 1),
    ],
  ).matches,
  'email': Profile(
    name: 'email',
    pattern: '.+@[a-zA-Z]+\\.{1}[a-zA-Z]+(\\.{0,1}[a-zA-Z]+)',
    icon: IconDefinition(iconType: 'fa', value: 'envelope', faStyle: FaIconStyle.solid),
    matches: [
      Link(match: 'mailto:({PROFILE_ID})/?', group: 1, pattern: 'mailto:{PROFILE_ID}'),
      Link(match: '({PROFILE_ID})', group: 1),
    ],
  ).matches,
  'etsy': Profile(
    name: 'etsy',
    icon: IconDefinition(iconType: 'fa', value: 'etsy', faStyle: FaIconStyle.brands),
    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?etsy.com/shop/({PROFILE_ID})/?', group: 3, pattern: 'https://etsy.com/shop/{PROFILE_ID}'),
      Link(match: '({PROFILE_ID})', group: 1),
    ],
  ).matches,
  'facebook': Profile(
    name: 'facebook',
    icon: IconDefinition(iconType: 'fa', value: 'facebook-f', faStyle: FaIconStyle.brands),
    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?facebook.com/({PROFILE_ID})/?', group: 3, pattern: 'https://facebook.com/{PROFILE_ID}'),
      Link(match: '({PROFILE_ID})', group: 1),
    ],
  ).matches,
  'github': Profile(
    name: 'github',
    icon: IconDefinition(iconType: 'fa', value: 'github', faStyle: FaIconStyle.brands),
    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?github.com/({PROFILE_ID})/?', group: 3, pattern: 'https://github.com/{PROFILE_ID}'),
      Link(match: '({PROFILE_ID})', group: 1),
    ],
  ).matches,
  'goodreads': Profile(
    name: 'goodreads',
    icon: IconDefinition(iconType: 'fa', value: 'goodreads', faStyle: FaIconStyle.brands),
    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?goodreads.com/user/show/([\\d]+(?:-[\\w-]+)?)/?/?', group: 3, pattern: 'https://goodreads.com/user/show/{PROFILE_ID}'),
      Link(match: '([\\d]+(?:-[\\w-]+)?)', group: 1),
    ],
  ).matches,
  'instagram': Profile(
    name: 'instagram',
    icon: IconDefinition(iconType: 'fa', value: 'instagram', faStyle: FaIconStyle.brands),
    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?instagram.com/({PROFILE_ID})/?', group: 3, pattern: 'https://instagram.com/{PROFILE_ID}'),
      Link(match: '@?({PROFILE_ID})', group: 1),
    ],
  ).matches,
  'keybase': Profile(
    name: 'keybase',
    icon: IconDefinition(iconType: 'fa', value: 'keybase', faStyle: FaIconStyle.brands),
    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?keybase.io/({PROFILE_ID})/?', group: 3, pattern: 'https://keybase.io/{PROFILE_ID}'),
      Link(match: '({PROFILE_ID})', group: 1),
    ],
  ).matches,
  'letterboxd': Profile(
    name: 'letterboxd',
    icon: IconDefinition(iconType: 'fa', value: 'letterboxd', faStyle: FaIconStyle.brands),
    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?letterboxd.com/([\\w]{2,15})/?', group: 3, pattern: 'https://letterboxd.com/{PROFILE_ID}'),
      Link(match: '^[\\w]{2,15}$', group: 0),
    ],
  ).matches,
  'linkedin': Profile(
    name: 'linkedin',
    icon: IconDefinition(iconType: 'fa', value: 'linkedin-in', faStyle: FaIconStyle.brands),
    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?linkedin.com/in/({PROFILE_ID})/?', group: 3, pattern: 'https://linkedin.com/in/{PROFILE_ID}'),
      Link(match: '(https?://)?([\\w.]*\\.)?linkedin.com/mwlite/in/({PROFILE_ID})/?', group: 3, pattern: 'https://linkedin.com/in/{PROFILE_ID}'),
      Link(match: '({PROFILE_ID})', group: 1),
    ],
  ).matches,
  'linktree': Profile(
    name: 'linktree',
    icon: IconDefinition(iconType: 'svg', value: '<svg version=\'1.1\' id=\'Layer_1\' xmlns=\'http://www.w3.org/2000/svg\' xmlns:xlink=\'http://www.w3.org/1999/xlink\' x=\'0px\' y=\'0px\' viewBox=\'0 0 122 152\' style=\'enable-background:new 0 0 122 152;\' xml:space=\'preserve\'><style type=\'text/css\'> .st0{fill:#010101;} </style> <path class=\'st0\' d=\'M71.78,0H50.22v37.12L25.2,11.13L10.78,25.98L36.89,51.6H0v20.79h37.08l-26.3,26.17l14.43,14.66L61,76.65 l35.98,36.56l14.24-14.66l-26.3-26.17H122V51.6H85.11l26.12-25.61L96.98,11.13l-25.2,25.98V0z M50.22,102.45V152h21.55v-49.55H50.22z\'/> </svg>'),
    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?linktr.ee/({PROFILE_ID})/?', group: 3, pattern: 'https://linktr.ee/{PROFILE_ID}'),
      Link(match: '({PROFILE_ID})', group: 1),
    ],
  ).matches,
  'mastodon': Profile(
    name: 'mastodon',
    icon: IconDefinition(iconType: 'fa', value: 'mastodon', faStyle: FaIconStyle.brands),
    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?mastodon.social/@({PROFILE_ID})/?', group: 3, pattern: 'https://mastodon.social/@{PROFILE_ID}'),
      Link(match: '(https?://)?([\\w.]*\\.)?mstdn.social/@({PROFILE_ID})/?', group: 3, pattern: 'https://mstdn.social/@{PROFILE_ID}'),
      Link(match: '(https?://)?([\\w.]*\\.)?mastodon.world/@({PROFILE_ID})/?', group: 3, pattern: 'https://mastodon.world/@{PROFILE_ID}'),
      Link(match: '@?({PROFILE_ID})(@mastodon.social)?', group: 1),
      Link(match: '@?({PROFILE_ID})(@mstdn.social)?', group: 1),
      Link(match: '@?({PROFILE_ID})(@mastodon.world)?', group: 1),
    ],
  ).matches,
  'medium': Profile(
    name: 'medium',
    icon: IconDefinition(iconType: 'fa', value: 'medium', faStyle: FaIconStyle.brands),
    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?medium.com/@({PROFILE_ID})/?', group: 3, pattern: 'https://medium.com/@{PROFILE_ID}'),
      Link(match: '@?({PROFILE_ID})', group: 1),
    ],
  ).matches,
  'patreon': Profile(
    name: 'patreon',
    icon: IconDefinition(iconType: 'fa', value: 'patreon', faStyle: FaIconStyle.brands),
    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?patreon.com/({PROFILE_ID})/?', group: 3, pattern: 'https://patreon.com/{PROFILE_ID}'),
      Link(match: '({PROFILE_ID})', group: 1),
    ],
  ).matches,
  'pinterest': Profile(
    name: 'pinterest',
    icon: IconDefinition(iconType: 'fa', value: 'pinterest-p', faStyle: FaIconStyle.brands),
    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?pinterest.com/({PROFILE_ID})/?', group: 3, pattern: 'https://pinterest.com/{PROFILE_ID}'),
      Link(match: '({PROFILE_ID})', group: 1),
    ],
  ).matches,
  'playstore': Profile(
    name: 'playstore',
    icon: IconDefinition(iconType: 'fa', value: 'google-play', faStyle: FaIconStyle.brands),
    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?play.google.com/store/apps/details\\?id=({PROFILE_ID})/?', group: 3, pattern: 'https://play.google.com/store/apps/details?id={PROFILE_ID}'),
      Link(match: '({PROFILE_ID})', group: 1),
    ],
  ).matches,
  'reddit': Profile(
    name: 'reddit',
    icon: IconDefinition(iconType: 'fa', value: 'reddit-alien', faStyle: FaIconStyle.brands),
    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?reddit.com/user|u/({PROFILE_ID})/?', group: 3, pattern: 'https://reddit.com/user/{PROFILE_ID}'),
      Link(match: 'u/({PROFILE_ID})', group: 1),
      Link(match: '({PROFILE_ID})', group: 1),
    ],
  ).matches,
  'signal': Profile(
    name: 'signal',
    icon: IconDefinition(iconType: 'fa', value: 'signal-messenger', faStyle: FaIconStyle.brands),
    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?signal.me/#p/({PROFILE_ID})/?', group: 3, pattern: 'https://signal.me/#p/{PROFILE_ID}'),
      Link(match: '({PROFILE_ID})', group: 1),
    ],
  ).matches,
  'snapchat': Profile(
    name: 'snapchat',
    icon: IconDefinition(iconType: 'fa', value: 'snapchat', faStyle: FaIconStyle.brands),
    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?snapchat.com/add/({PROFILE_ID})/?', group: 3, pattern: 'https://snapchat.com/add/{PROFILE_ID}'),
      Link(match: '@?({PROFILE_ID})', group: 1),
    ],
  ).matches,
  'soundcloud': Profile(
    name: 'soundcloud',
    icon: IconDefinition(iconType: 'fa', value: 'soundcloud', faStyle: FaIconStyle.brands),
    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?soundcloud.com/({PROFILE_ID})/?', group: 3, pattern: 'https://soundcloud.com/{PROFILE_ID}'),
      Link(match: '({PROFILE_ID})', group: 1),
    ],
  ).matches,
  'spotify': Profile(
    name: 'spotify',
    icon: IconDefinition(iconType: 'fa', value: 'spotify', faStyle: FaIconStyle.brands),
    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?open.spotify.com/user/({PROFILE_ID})/?', group: 3, pattern: 'https://open.spotify.com/user/{PROFILE_ID}'),
      Link(match: '({PROFILE_ID})', group: 1),
    ],
  ).matches,
  'stackoverflow': Profile(
    name: 'stackoverflow',
    icon: IconDefinition(iconType: 'fa', value: 'stack-overflow', faStyle: FaIconStyle.brands),
    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?stackoverflow.com/users/({PROFILE_ID})(/[A-Za-z0-9_\\-\\.]+)?/?', group: 3, pattern: 'https://stackoverflow.com/users/{PROFILE_ID}'),
      Link(match: '({PROFILE_ID})', group: 1),
    ],
  ).matches,
  'substack': Profile(
    name: 'substack',
    icon: IconDefinition(iconType: 'bootstrap', value: 'substack', faStyle: FaIconStyle.brands),
    matches: [
      Link(match: '(https?://)?({PROFILE_ID}).substack.com/?', group: 2, pattern: 'https://{PROFILE_ID}.substack.com'),
      Link(match: '({PROFILE_ID})', group: 1),
    ],
  ).matches,
  'telegram': Profile(
    name: 'telegram',
    icon: IconDefinition(iconType: 'fa', value: 'telegram', faStyle: FaIconStyle.brands),
    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?(t.me|telegram.me)/({PROFILE_ID})/?', group: 4, pattern: 'https://t.me/{PROFILE_ID}'),
      Link(match: '@?({PROFILE_ID})', group: 1),
    ],
  ).matches,
  'threads': Profile(
    name: 'threads',
    icon: IconDefinition(iconType: 'fa', value: 'threads', faStyle: FaIconStyle.brands),
    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?threads.net/@({PROFILE_ID})/?', group: 3, pattern: 'https://threads.net/@{PROFILE_ID}'),
      Link(match: '@?({PROFILE_ID})', group: 1),
    ],
  ).matches,
  'tiktok': Profile(
    name: 'tiktok',
    icon: IconDefinition(iconType: 'fa', value: 'tiktok', faStyle: FaIconStyle.brands),
    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?tiktok.com/@({PROFILE_ID})/?', group: 3, pattern: 'https://tiktok.com/@{PROFILE_ID}'),
      Link(match: '@?({PROFILE_ID})', group: 1),
    ],
  ).matches,
  'twitch': Profile(
    name: 'twitch',
    icon: IconDefinition(iconType: 'fa', value: 'twitch', faStyle: FaIconStyle.brands),
    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?twitch.tv/({PROFILE_ID})/?', group: 3, pattern: 'https://twitch.tv/{PROFILE_ID}'),
      Link(match: '({PROFILE_ID})', group: 1),
    ],
  ).matches,
  'twitter': Profile(
    name: 'twitter',
    icon: IconDefinition(iconType: 'fa', value: 'x-twitter', faStyle: FaIconStyle.brands),
    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?twitter.com/@?({PROFILE_ID})/?', group: 3, pattern: 'https://x.com/{PROFILE_ID}'),
      Link(match: '(https?://)?([\\w.]*\\.)?x.com/@?({PROFILE_ID})/?', group: 3, pattern: 'https://x.com/{PROFILE_ID}'),
      Link(match: '@?({PROFILE_ID})', group: 1),
    ],
  ).matches,
  'vk': Profile(
    name: 'vk',
    icon: IconDefinition(iconType: 'fa', value: 'vk', faStyle: FaIconStyle.brands),
    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?vk.com/({PROFILE_ID})/?', group: 3, pattern: 'https://vk.com/{PROFILE_ID}'),
      Link(match: '({PROFILE_ID})', group: 1),
    ],
  ).matches,
  'website': Profile(
    name: 'website',
    forceStripQuery: true,
    icon: IconDefinition(iconType: 'fa', value: 'globe', faStyle: FaIconStyle.solid),
    matches: [
      Link(match: '^(?:[a-z]+://)?([a-z0-9.-]+\\.[a-z]{2,}(?:/[^?#]*)?)', group: 1, pattern: 'https://{PROFILE_ID}'),
    ],
  ).matches,
  'whatsapp': Profile(
    name: 'whatsapp',
    icon: IconDefinition(iconType: 'fa', value: 'whatsapp', faStyle: FaIconStyle.brands),
    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?wa.me/({PROFILE_ID})/?', group: 3, pattern: 'https://wa.me/{PROFILE_ID}'),
      Link(match: '(https?://)?([\\w.]*\\.)?whatsapp.com/send\\?phone=({PROFILE_ID})/?', group: 3, pattern: 'https://wa.me/{PROFILE_ID}'),
      Link(match: '({PROFILE_ID})', group: 1),
    ],
  ).matches,
  'youtube': Profile(
    name: 'youtube',
    icon: IconDefinition(iconType: 'fa', value: 'youtube-square', faStyle: FaIconStyle.brands),
    matches: [
      Link(match: '(https?://)?([\\w.]*\\.)?youtube.com/({PROFILE_ID})/?', group: 3, pattern: 'https://youtube.com/{PROFILE_ID}', idPattern: '@{PROFILE_ID}'),
      Link(match: '(https?://)?([\\w.]*\\.)?youtube.com/c/({PROFILE_ID})/?', group: 3, pattern: 'https://youtube.com/{PROFILE_ID}', idPattern: '@{PROFILE_ID}'),
      Link(match: '(https?://)?([\\w.]*\\.)?youtube.com/channel/({PROFILE_ID})/?', group: 3, pattern: 'https://youtube.com/channel/{PROFILE_ID}', idPattern: '[^@]{PROFILE_ID}'),
      Link(match: '({PROFILE_ID})', group: 1),
    ],
  ).matches,
};
