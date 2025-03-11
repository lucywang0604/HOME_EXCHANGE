import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form"]

  confirmBooking(event) {
    if (!confirm("Are you sure you want to book this flat?")) {
      event.preventDefault();
    }
  }
}
