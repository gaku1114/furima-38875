const pay = ()=> {
  const payjp = Payjp(process.env.PAYJP_PUBLIC_KEY);
  const elements = payjp.elements();
  const cardElement = elements.create("card");
  cardElement.mount(".credit-card-form");
  
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    payjp.createToken(cardElement).then(function (response) {
      if (response.error) {
      } else {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name="token" type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      cardElement.clear();
      document.getElementById("charge-form").submit();
    });
  })
};

window.addEventListener("load", pay);