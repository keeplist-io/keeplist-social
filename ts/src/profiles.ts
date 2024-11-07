import { Profile, Link } from './types.ts';
import { patterns } from './generated/patterns.ts';

export async function loadProfiles(): Promise<Record<string, Link[]>> {
  const models: Record<string, Link[]> = {};

  Object.values(patterns).forEach((profile: Profile) => {
    models[profile.name] = profile.matches.map(match => ({
      ...match,
      idPattern: match.idPattern || profile.pattern,
      forceStripQuery: match.forceStripQuery || profile.forceStripQuery
    }));
  });

  return models;
} 