const price = () => {
    const priceInput = document.getElementById("item-price");
    if (priceInput) {
        priceInput.addEventListener("input", () => {
            const priceValue = priceInput.value;

            const fee = Math.floor(priceValue * 0.1); // 10%の販売手数料を計算
            const profit = Math.floor(priceValue - fee); // 販売利益を計算

            const feeDom = document.getElementById("sales-fee");
            const profitDom = document.getElementById("profit");

            feeDom.innerHTML = fee;
            profitDom.innerHTML = profit;
        });
    }
};
window.addEventListener('load', price); 
window.addEventListener('turbolinks:load', price); 
window.addEventListener('DOMContentLoaded', () => {
  const itemPrice = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profitNumber = document.getElementById("profit");

  if (itemPrice && addTaxDom && profitNumber) {
    itemPrice.addEventListener("input", () => {
      const inputValue = itemPrice.value;
      addTaxDom.innerHTML = Math.floor(inputValue * 0.1).toLocaleString();
      profitNumber.innerHTML = Math.floor(inputValue - inputValue * 0.1).toLocaleString();
    });
  }
});
