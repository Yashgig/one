
	<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Simple E-Commerce Website</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        header {
            background-color: #333;
            color: white;
            padding: 15px;
            text-align: center;
        }
        nav {
            display: flex;
            justify-content: center;
            background-color: #444;
            padding: 10px 0;
        }
        nav a {
            color: white;
            margin: 0 15px;
            text-decoration: none;
            font-size: 18px;
        }
        nav a:hover {
            text-decoration: underline;
        }
        .container {
            padding: 20px;
        }
        .product {
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 15px;
            margin: 10px;
            text-align: center;
            width: calc(33.33% - 40px);
            box-sizing: border-box;
            float: left;
        }
        .product img {
            max-width: 100%;
            height: auto;
            margin-bottom: 10px;
        }
        .product h3 {
            margin: 10px 0;
        }
        .product p {
            color: #888;
            margin: 5px 0;
        }
        .product button {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
        }
        .product button:hover {
            background-color: #218838;
        }
        footer {
            clear: both;
            background-color: #333;
            color: white;
            text-align: center;
            padding: 10px;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <header>
        <h1>Welcome to Simple E-Commerce</h1>
    </header>
    <nav>
        <a href="#">Home</a>
        <a href="#">Products</a>
        <a href="#">Contact</a>
        <a href="#">About</a>
    </nav>
    <div class="container">
        <div class="product">
            <img src="https://via.placeholder.com/150" alt="Product 1">
            <h3>Product 1</h3>
            <p>$10.00</p>
            <button>Add to Cart</button>
        </div>
        <div class="product">
            <img src="https://via.placeholder.com/150" alt="Product 2">
            <h3>Product 2</h3>
            <p>$20.00</p>
            <button>Add to Cart</button>
        </div>
        <div class="product">
            <img src="https://via.placeholder.com/150" alt="Product 3">
            <h3>Product 3</h3>
            <p>$30.00</p>
            <button>Add to Cart</button>
        </div>
    </div>
    <footer>
        <p>&copy; 2024 Simple E-Commerce. All rights reserved.</p>
    </footer>

	
</body>
</html>
