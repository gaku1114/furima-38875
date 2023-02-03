function calc () {
  
  const priceForm = document.getElementById('item-price');
  priceForm.addEventListener('keyup', () => {
    const taxArea = document.getElementById('add-tax-price');
    const profitArea = document.getElementById('profit');
    const price = priceForm.value;
    let tax = Math.floor(price * 0.1).toLocaleString();
    let profit = Math.floor(price * 0.9).toLocaleString();
    taxArea.innerHTML = tax;
    profitArea.innerHTML = profit;
  })
}

window.addEventListener('load', calc);