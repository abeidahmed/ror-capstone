import { humanize } from './humanize';

export function formErrorHandler({ errors, type, showKey = true }) {
  if (errors) {
    for (let errorType of Object.keys(errors)) {
      if (type.toLowerCase() === errorType.toLowerCase()) {
        if (showKey) {
          return `${humanize(errorType)} ${errors[errorType][0]}`;
        } else {
          return errors[errorType][0];
        }
      }
    }
  }
}
