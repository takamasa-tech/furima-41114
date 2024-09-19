const price = () => {

  const priceInput = document.getElementById('item_price');
  if (priceInput) {
  priceInput.addEventListener('keypress', () => {
    const inputValue = priceInput.value;
    
    const addTaxPrice = Math.floor(inputValue * 0.1);
    const addTaxPriceElement = document.getElementById('add-tax-price');
    addTaxPriceElement.innerHTML = addTaxPrice;

    const salesProfit = Math.floor(inputValue * 0.9);
    const salesProfitElement = document.getElementById('profit');
    salesProfitElement.innerHTML = salesProfit;
  });
  }
};

window.addEventListener('turbo:load', price);
window.addEventListener('turbo:render', price);
window.addEventListener('DOMContentLoaded', price);
window.addEventListener('keypress', price);

