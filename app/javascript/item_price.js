window.addEventListener('load', () => {

const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
   const inputValue = priceInput.value;
   console.log(inputValue);
      const addTaxDom = document.getElementById("add-tax-price");
      addTaxDom.innerHTML = inputValue * 0.1
      console.log(addTaxDom);
      const addProfit = document.getElementById("profit");
      addProfit.innerHTML = inputValue - (inputValue * 0.1)
      console.log(addProfit);
})
});