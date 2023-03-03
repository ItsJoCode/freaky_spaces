import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="bookmark-place"
export default class extends Controller {
  static targets = ["heart", "formheart"];

  connect() {

  }

  bookmarked() {
    this.heartTarget.classList.toggle('fa-regular');
    this.heartTarget.classList.toggle('fa-solid');

    this.formheartTarget.submit();
  }
}
