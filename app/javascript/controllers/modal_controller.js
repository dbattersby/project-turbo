import { Controller } from "@hotwired/stimulus"
import * as bootstrap from "bootstrap"

export default class extends Controller {
  connect() {
    this.modal = new bootstrap.Modal(this.element);
  }

  open() {
    if (!this.modal.isOpened) {
      this.modal.show();
    }
  }

  close(e) {
    if (e.detail.success) {
      this.modal.hide();
    }
  }
}
