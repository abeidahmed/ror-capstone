import ApplicationController from './application_controller';

export default class extends ApplicationController {
  static targets = ['toggleable'];
  static values = { attribute: String };

  connect() {
    if (this.isPreview) {
      this.hide();
    }
  }

  toggle() {
    this.toggleableTargets.forEach((target) => {
      if (target.hasAttribute(this.attributeValue)) {
        target.removeAttribute(this.attributeValue);
      } else {
        target.setAttribute(this.attributeValue, '');
      }
    });
  }

  hide() {
    this.toggleableTarget.setAttribute(this.attributeValue, '');
  }

  hideOutsideClick(e) {
    if (!this.element.contains(e.target)) {
      this.hide();
    }
  }
}
