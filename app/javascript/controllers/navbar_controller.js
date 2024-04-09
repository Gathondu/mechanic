import { Controller } from "@hotwired/stimulus";
import { useClickOutside } from "stimulus-use";

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ["content"];
  connect() {
    useClickOutside(this);
  }

  clickOutside(event) {
    this.close();
  }

  closeOnEsc(event) {
    if (event.key === "Escape") {
      this.close();
    }
  }

  closeOnBigScreen(event) {
    if (window.innerWidth > 1023) {
      this.close();
    }
  }

  toggle() {
    if (this.contentTarget.classList.contains("hidden")) {
      this.open();
    } else {
      this.close();
    }
  }

  open() {
    this.contentTarget.classList.remove("hidden");
    let main = document.querySelector("main");
    let mainNav = document.getElementById("main-nav");
    mainNav.classList.add("blur");
    main.classList.add("blur");
    document.body.classList.add("overflow-hidden");
  }

  close() {
    this.contentTarget.classList.add("hidden");
    let main = document.querySelector("main");
    let mainNav = document.getElementById("main-nav");
    mainNav.classList.remove("blur");
    main.classList.remove("blur");
    document.body.classList.remove("overflow-hidden");
  }
}
