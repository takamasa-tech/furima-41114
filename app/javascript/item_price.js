window.addEventListener('turbo:load', () => {
  })

  const price = () => {
    const priceInput = document.getElementById("item-price");
    const price = priceInput.value;
    
    const fee = Math.floor(price * 0.1); // 10%の販売手数料を計算
    const profit = price - fee; // 利益を計算
    
    const feeDom = document.getElementById("sales-fee");
    const profitDom = document.getElementById("profit");
    
    feeDom.innerHTML = fee;
    profitDom.innerHTML = profit;
    };

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);