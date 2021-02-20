import { capitalize } from './capitalize';

export function humanize(string) {
  if (typeof string !== 'string')
    throw new Error(`${string} should be of type string`);

  const normalize = string.split('_').join(' ');
  return capitalize(normalize);
}
