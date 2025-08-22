import { Profile, Link } from './types.ts';
import { patterns } from './generated/patterns.ts';

export function loadProfiles(): Record<string, Link[]> {
  const models: Record<string, Link[]> = {};

  Object.values(patterns).forEach((profile) => {
    const _profile = profile as Profile;
    models[_profile.name] = _profile.matches.map(match => ({
      ...match,
      idPattern: match.idPattern || _profile.pattern,
      forceStripQuery: match.forceStripQuery || _profile.forceStripQuery,
      icon: _profile.icon
    }));
  });

  return models;
} 