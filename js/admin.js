if(localStorage.getItem("admin") !== "true"){
  window.location.href = "login.html";
}

const adminProducts = document.getElementById("adminProducts");

function showProducts(){
  adminProducts.innerHTML = "";

  products.forEach((product,index) => {
    adminProducts.innerHTML += `
      <div class="card">
        <img src="${product.image}">
        <h3>${product.name}</h3>
        <p>${product.price} TK</p>

        <button onclick="deleteProduct(${index})">Delete</button>
      </div>
    `;
  });
}

showProducts();

function addProduct(){
  const name = document.getElementById("pname").value;
  const price = document.getElementById("pprice").value;
  const image = document.getElementById("pimage").value;

  products.push({
    id: products.length + 1,
    name,
    price,
    image
  });

  showProducts();
}

function deleteProduct(index){
  products.splice(index,1);
  showProducts();
}