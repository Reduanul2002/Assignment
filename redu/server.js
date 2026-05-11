const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const cors = require('cors');

app.use(bodyParser.json());
app.use(cors()); // যাতে অন্য ডোমেইন থেকেও কল করা যায়

let products = []; // ডেটা ধরে রাখতে একটি সিম্পল অ্যারে

// POST রুট: নতুন প্রোডাক্ট অ্যাড করার জন্য
app.post('/products', (req, res) => {
  const { name, price, image } = req.body;
  const newProduct = {
    id: products.length + 1,
    name,
    price,
    image
  };
  products.push(newProduct);
  res.status(201).json(newProduct);
});

// GET রুট: সমস্ত প্রোডাক্ট লিস্ট দেখানোর জন্য
app.get('/products', (req, res) => {
  res.json(products);
});

// সার্ভার চালু
const PORT = 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});