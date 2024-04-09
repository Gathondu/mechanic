import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="transition"
export default class extends Controller {
  static targets = ["slider"];

  connect() {}

  initiateHomeSlider() {
    const slides = document.getElementsByClassName("slide");
    let currentSlideIndex = 0;
    const lastSlideIndex = slides.length - 1;
    setInterval(() => {
      let activeSlide = slides[currentSlideIndex];
      activeSlide.classList.remove("opacity-100");
      activeSlide.classList.add("opacity-0");
      if (currentSlideIndex === lastSlideIndex) {
        currentSlideIndex = 0;
      } else {
        currentSlideIndex += 1;
      }
      let nextSlide = slides[currentSlideIndex];
      nextSlide.classList.remove("opacity-0");
      nextSlide.classList.add("opacity-100");
    }, 7000);
  }
}
