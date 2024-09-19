const price = () => {

  const priceInput = document.getElementById('item_price');
  priceInput.addEventListener('input', () => {
    const inputValue = priceInput.value;
    
    const addTaxPrice = Math.floor(inputValue * 0.1);
    const addTaxPriceElement = document.getElementById('add-tax-price');
    addTaxPriceElement.innerHTML = addTaxPrice;

    const salesProfit = Math.floor(inputValue * 0.9);
    const salesProfitElement = document.getElementById('profit');
    salesProfitElement.innerHTML = salesProfit;
  });
};

window.addEventListener('load', price);
window.addEventListener('render', price);
