import ApplicationController from './application_controller';

export default class extends ApplicationController {
  static targets = ['toggleable'];
  static values = { attribute: String };
  static classes = ['attribute'];

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

  open() {
    if (this.hasAttributeClass) {
      this.toggleableTarget.classList.remove(this.attributeClass);
    }
  }

  hide() {
    if (this.hasAttributeValue) {
      this.toggleableTarget.setAttribute(this.attributeValue, '');
    }

    if (this.hasAttributeClass) {
      this.toggleableTarget.classList.add(this.attributeClass);
    }
  }

  hideOutsideClick(e) {
    if (!this.element.contains(e.target)) {
      this.hide();
    }
  }
}
