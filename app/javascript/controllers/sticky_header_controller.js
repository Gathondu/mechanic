import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="sticky-header"
export default class extends Controller {
  static targets = ["navbar"];
  connect() {
    this.initStickyNav();
  }

  initStickyNav() {
    const nav = this.element;
    const navHeight = nav.offsetHeight;
    window.addEventListener("scroll", () => {
      const scrollPosition = window.scrollY;
      if (scrollPosition > navHeight - 1) {
        nav.classList.add("border-b");
        nav.classList.add("border-b-white");
      } else {
        nav.classList.remove("border-b");
        nav.classList.remove("border-b-white");
      }
    });
  }
}
