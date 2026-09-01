import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { open: Boolean }

  open() {
    this.openValue = true
    this.element.classList.add("is-open")
  }

  close() {
    this.openValue = false
    this.element.classList.remove("is-open")
  }
}
