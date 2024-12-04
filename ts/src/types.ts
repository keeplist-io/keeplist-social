/**
 * Configuration options for SocialLinks
 */
export interface Config {
  /** Whether to trim whitespace from input strings */
  trimInput?: boolean;

  /** Whether to strip query parameters from URLs */
  filterForQueryParams?: boolean;

  /** Whether to use predefined platform patterns */
  usePredefinedProfiles?: boolean;
}

/**
 * Represents a URL pattern for matching social media profiles
 */
export interface Link {
  /** Regular expression pattern for matching URLs */
  match: string;

  /** Capturing group number for the profile ID */
  group: number;

  /** Template for generating canonical URLs */
  pattern?: string;

  /** Pattern for validating profile IDs */
  idPattern?: string;

  /** Whether to force stripping query parameters */
  forceStripQuery?: boolean;

  /** Icon definition for the platform */
  icon?: IconDefinition;
}

/**
 * Main interface for working with social media URLs
 */
export interface SocialLinksInterface {
  /**
   * Check if a URL is valid for a given platform
   */
  isValid(platform: string, url: string): boolean;

  /**
   * Extract the profile ID from a URL
   */
  getProfileId(platform: string, url: string): string;

  /**
   * Generate a canonical URL from a profile ID
   */
  getLink(platform: string, profileId: string): string;

  /**
   * Convert a URL to its canonical form
   */
  sanitize(platform: string, url: string): string;
}
/**
 * Configuration for a social media platform
 */
export interface Profile {
  /** Unique identifier for the platform */
  name: string;

  /** Default template for generating canonical URLs */
  pattern?: string;

  /** Collection of URL patterns for matching profile links */
  matches: Link[];

  /** Whether to always strip query parameters for this platform */
  forceStripQuery?: boolean;

  /** Icon definition for the platform */
  icon?: IconDefinition;
}

// types/icons.ts
export type FaIconStyle = 'brands' | 'solid' | 'regular';

export interface IconDefinition {
  iconType: 'fa' | 'custom' | 'url' | 'svg' | 'bootstrap';
  value: string;
  FaStyle?: FaIconStyle;
}