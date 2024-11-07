import { Link, Config } from './types.ts';
import { loadProfiles } from './profiles.ts';

const PROFILE_ID = '[A-Za-z0-9_\\-\\.]+';
const QUERY_PARAM = '(\\?.*)?';

class AppException extends Error {
  constructor(message: string) {
    super(message);
    this.name = 'AppException';
  }
}

function createRegexp(profileMatch: Link, config: Config): RegExp {
  let match = profileMatch.match;
  if (profileMatch.idPattern) {
    match = match.replace('{PROFILE_ID}', profileMatch.idPattern);
  }
  match = match.replace('{PROFILE_ID}', PROFILE_ID);
  
  return new RegExp([
    '^',
    match,
    config.filterForQueryParams || profileMatch.forceStripQuery ? QUERY_PARAM : '',
    '$'
  ].join(''));
}

function findIndexFromLink(
  matches: Link[] | undefined,
  link: string,
  config: Config
): number {
  return (matches || []).findIndex(match => 
    createRegexp(match, config).test(link)
  );
}

function findIndexFromProfileId(
  matches: Link[] | undefined,
  id: string,
  config: Config
): number {
  return (matches || []).findIndex(match => {
    if (!match.idPattern) return true;
    return new RegExp(`^(${match.idPattern.replace('{PROFILE_ID}', PROFILE_ID)})`).test(id);
  });
}

export class SocialLinks {
  private profiles: Record<string, Link[]>;
  private config: Config;

  constructor(profiles: Record<string, Link[]>, config?: Config) {
    this.profiles = profiles;
    this.config = {
      usePredefinedProfiles: true,
      trimInput: true,
      filterForQueryParams: false,
      ...config
    };
  }

  static async create(config?: Config): Promise<SocialLinks> {
    const profiles = await loadProfiles();
    return new SocialLinks(profiles, config);
  }

  private trim(input: string): string {
    return this.config.trimInput ? input.trim() : input;
  }

  isValid(profileName: string, link: string): boolean {
    const matches = this.profiles[profileName];
    return findIndexFromLink(matches, this.trim(link), this.config) !== -1;
  }

  getProfileId(profileName: string, link: string): string {
    const matches = this.profiles[profileName] || [];
    const trimmed = this.trim(link);
    const idx = findIndexFromLink(matches, trimmed, this.config);
    
    if (idx === -1) {
      throw new AppException(`Link has not matched with profile ${profileName}`);
    }

    const match = createRegexp(matches[idx], this.config).exec(trimmed);
    const response = match?.[matches[idx].group];

    if (!response) {
      throw new AppException(`There was no successful matching for ${profileName}`);
    }

    return response;
  }

  getLink(profileName: string, id: string): string {
    const matches = this.profiles[profileName] || [];
    const idx = findIndexFromProfileId(matches, id, this.config);
    
    if (idx === -1) {
      throw new AppException(`There is no pattern for profile ${profileName}`);
    }

    return (matches[idx].pattern || '').replace('{PROFILE_ID}', this.trim(id));
  }

  sanitize(profileName: string, link: string): string {
    const trimmed = this.trim(link);
    const profileId = this.getProfileId(profileName, trimmed);
    return this.getLink(profileName, profileId);
  }
} 