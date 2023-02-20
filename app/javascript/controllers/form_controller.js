import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static get targets() { return ["submit"] }

  connect() {
    this.submitTarget.hidden = true
  }

  submit() {
    this.submitTarget.click()
  }

  hideValidationMessage(event) {
    event.stopPropagation()
    event.preventDefault()
  }
}