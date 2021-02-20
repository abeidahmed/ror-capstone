import { Controller } from 'stimulus';
import { formErrorHandler } from '../utils';

export default class extends Controller {
  static targets = ['showError'];

  onError(e) {
    const [, , xhr] = e.detail;
    const { errors } = JSON.parse(xhr.response);

    this.showErrorTargets.forEach((errorTarget) => {
      const errorType = errorTarget.getAttribute('data-form-error');

      const errorMsg = formErrorHandler({
        errors,
        type: errorType,
      });
      errorTarget.innerHTML = errorMsg || '';
    });
  }
}
