export function capitalize(string) {
  if (typeof string !== 'string')
    throw new Error(`${string} must be of type string`);

  return string.charAt(0).toUpperCase() + string.slice(1);
}
