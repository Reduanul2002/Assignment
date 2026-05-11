function completePayment(){
  const method = document.getElementById("paymentMethod").value;
  const trx = document.getElementById("trx").value;
  const pic = document.getElementById("paymentPic").files[0];

  if(trx === ""){
    alert("Enter Transaction ID");
    return;
  }

  alert(`Payment Successful via ${method}`);

  // এখানে বিকাশ/নগদ API যুক্ত করতে হবে
  // backend লাগবে

  window.location.href = "index.html";
}