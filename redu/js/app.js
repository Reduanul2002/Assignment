const productContainer = document.getElementById("productList") || document.getElementById("productContainer");

// uploaded profile picture show in navbar

const savedPic = localStorage.getItem("profilePic");

if(savedPic){
  document.getElementById("navProfilePic").src = savedPic;
}

if(productContainer){
  products.forEach(product => {
    productContainer.innerHTML += `
      <div class="card">
        <img src="${product.image}">
        <h3>${product.name}</h3>
        <p>${product.price} TK</p>

        <button onclick="buyNow(${product.id})">Buy Now</button>
      </div>
    `;
  });
}
// Login Check
const user = localStorage.getItem("user");

// Logout Button
const logoutBtn = document.getElementById("logoutBtn");

// লগইন থাকলে Logout button দেখাবে
if(user && logoutBtn){
  logoutBtn.style.display = "block";
}

// Logout করলে
if(logoutBtn){
  logoutBtn.addEventListener("click", () => {

    // user remove
    localStorage.removeItem("user");

    alert("আপনি লগআউট হয়েছেন!");

    // login page
    window.location.href = "index.html";
  });
}


// Buy Now Function
function buyNow(id){

  // user check
  const user = localStorage.getItem("user");

  // login না থাকলে
  if(!user){

    alert("কেনাকাটা করতে হলে আগে লগইন করুন!");

   // window.location.href = "index.html";

    return;
  }

  // login থাকলে checkout
  localStorage.setItem("buyProduct", id);

  window.location.href = "checkout.html";
}