import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="qr"
export default class extends Controller {
  static targets = ["button", "image"]

  connect() {
  }

  hide(event) {
    event.preventDefault();
    if (this.buttonTarget.value == "Hide QR") {
      this.imageTarget.classList.add("d-none")
      this.buttonTarget.value = "Show QR"
    } else {
      this.imageTarget.classList.remove("d-none")
      this.buttonTarget.value = "Hide QR"
    }
  }
}
