import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

window.addEventListener('DOMContentLoaded', () => {
  const priceInput = document.getElementById("item-price");
  if (priceInput !== null) {
    const addTaxDom = document.getElementById("add-tax-price");
    const profitDom = document.getElementById("profit");

    priceInput.addEventListener('input', () => {
      const inputValue = priceInput.value;

      const addTaxValue = Math.floor(inputValue * 0.1);
      const profitValue = inputValue - addTaxValue;

      addTaxDom.textContent = addTaxValue;
      // Assuming the following line exists in your original code
      profitDom.textContent = profitValue;
    });
  }
});