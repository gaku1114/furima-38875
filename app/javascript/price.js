function calc () {
  
  const priceForm = document.getElementById('item-price');
  priceForm.addEventListener('keyup', () => {
    const taxArea = document.getElementById('add-tax-price');
    const profitAre = document.getElementById('profit');
    const price = priceForm.value;
    let tax = Math.floor(price * 0.1);
    let profit = Math.floor(price * 0.9);
    taxArea.innerHTML = tax;
    profitAre.innerHTML = profit;
  })
}

window.addEventListener('load', calc);