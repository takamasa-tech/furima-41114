window.addEventListener('turbo:load', () => {
  const price = document.getElementById('item-price');
  const tax = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');
  if (price && tax && profit) {
    price.addEventListener('input', () => {
    const value = price.value;
    tax.innerHTML = Math.floor(value * 0.1);
    profit.innerHTML = Math.floor(value * 0.9);
  });
  }
});
