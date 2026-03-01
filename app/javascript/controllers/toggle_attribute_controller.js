import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    attribute: String
  }

  toggle(event) {
    const currentValue = this.element.getAttribute(this.attributeValue)
    const isTrue = currentValue === "true"
    this.element.setAttribute(this.attributeValue, (!isTrue).toString())
  }
}
