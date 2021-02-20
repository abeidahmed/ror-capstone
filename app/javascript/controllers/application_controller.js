import { Controller } from 'stimulus';

export default class extends Controller {
  get isPreview() {
    return document.documentElement.hasAttribute('data-turbolinks-preview');
  }
}
