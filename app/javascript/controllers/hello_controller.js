import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  hello(event) {
    console.log('Hello')
  }
}
