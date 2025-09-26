import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input"]

  search() {
    const searchTerm = this.inputTarget.value.trim()
    console.log(searchTerm)
  }
}
