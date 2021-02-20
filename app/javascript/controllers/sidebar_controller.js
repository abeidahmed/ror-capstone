import ApplicationController from './application_controller';

export default class extends ApplicationController {
  static targets = ['aside', 'overlay', 'closeButton'];

  connect() {
    if (this.isPreview) {
      this.close();
    }
  }

  open() {
    this.overlayTarget.removeAttribute('hidden');
    this.asideTarget.classList.replace('-translate-x-full', 'translate-x-0');
    this.closeButtonTarget.removeAttribute('hidden');
  }

  close() {
    this.overlayTarget.setAttribute('hidden', '');
    this.asideTarget.classList.replace('translate-x-0', '-translate-x-full');
    this.closeButtonTarget.setAttribute('hidden', '');
  }
}
