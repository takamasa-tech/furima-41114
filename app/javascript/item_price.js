const price = () => {
    const priceInput = document.getElementById("item-price");
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

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);