import ApplicationController from './application_controller';

export default class extends ApplicationController {
  static targets = ['status', 'field'];
  static values = {
    limit: Number,
  };

  connect() {
    this.observe();
  }

  observe() {
    this.statusTarget.innerText = this.setCount();

    if (this.fieldTarget.value.length > 255) {
      this.statusTarget.classList.add('text-gray-600', 'text-red-600');
    } else {
      this.statusTarget.classList.replace('text-red-600', 'text-gray-600');
    }
  }

  setCount() {
    return `${this.fieldTarget.value.length} / ${this.limitValue}`;
  }
}
