const adminPhone = "01700000000";
const adminPassword = "admin123";
// REGISTER
function registerUser(){

  let phone = document.getElementById("regPhone").value;
  let password = document.getElementById("regPassword").value;

  if(phone === "" || password === ""){
    alert("সব ফিল্ড পূরণ করো");
    return;
  }
   // ✅ 11 digit strict check
  if(!/^[0-9]{11}$/.test(phone)){
    alert("Mobile number must be exactly 11 digits (numbers only)");
    return;
  }

  // save user
  localStorage.setItem("phone", phone);
  localStorage.setItem("password", password);

  // flag: registered user exists
  localStorage.setItem("isRegistered", "true");

  alert("Registration Successful");
}


// LOGIN (ONLY REGISTERED USER CAN LOGIN)
function loginUser(){

  let phone = document.getElementById("phone").value;
  let password = document.getElementById("password").value;

  let isRegistered = localStorage.getItem("isRegistered");

  // ❌ যদি register না করে থাকে
  if(isRegistered !== "true"){
    alert("আগে Register করো");
    return;
  }
  // ❌ 11 digit check
  if(!/^[0-9]{11}$/.test(phone)){
  alert("Mobile number must be exactly 11 digits (numbers only)");
  return;
}


  let savedPhone = localStorage.getItem("phone");
  let savedPassword = localStorage.getItem("password");

  // ✅ match check
  if(phone === savedPhone && password === savedPassword){
    localStorage.setItem("isLoggedIn", "true");
    alert("Login Successful");
    window.location.href = "user.html";
  }
  else{
    alert("Wrong number or password");
  }
}


// ADMIN (unchanged)
function loginAdmin(){

  let phone = document.getElementById("phone").value;
  let password = document.getElementById("password").value;

  if(phone === "01700000000" && password === "admin123"){
    alert("Admin Login Successful");
    window.location.href = "admin.html";
  }
  else{
    alert("Invalid Admin");
  }
}


// FORGOT PASSWORD
function resetPassword(){

  let phone = document.getElementById("forgotPhone").value;
  let newPassword = document.getElementById("newPassword").value;

  let savedPhone = localStorage.getItem("phone");

  if(phone === savedPhone){

    localStorage.setItem("password", newPassword);

    alert("Password Updated Successfully");
  }
  else{
    alert("Number Not Found");
  }
}