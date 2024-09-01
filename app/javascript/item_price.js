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

window.addEventListener('load', price); // ページが読み込まれたらprice関数を実行
window.addEventListener('turbolinks:load', price); // turbolinksを使ってページ遷移したらprice関数を実行
window.addEventListener('DOMContentLoaded', () => {
  document.getElementById("item-price").addEventListener("input", () => {
    const inputValue = document.getElementById("item-price").value;
    const addTaxDom = document.getElementById("add-tax-price");
    const profitNumber = document.getElementById("profit");

    addTaxDom.innerHTML = Math.floor(inputValue * 0.1).toLocaleString();
    profitNumber.innerHTML = Math.floor(inputValue - inputValue * 0.1).toLocaleString();
  });
});