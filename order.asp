<%
    ' Set the session for the cashier's name
    Session("cashierName") = "John"
%>
<html>
<head>
    <title>Cat Cafe</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            color: #333;
            margin: 0;
            padding: 0;
        }
        h1, h2 {
            text-align: center;
            color: #555;
        }
        .container {
            max-width: 600px;
            margin: 30px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }
        input, select, textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input:focus, select:focus, textarea:focus {
            border-color: #66afe9;
            outline: none;
            box-shadow: 0 0 5px rgba(102, 175, 233, 0.5);
        }
        .order {
            padding: 15px;
            border: 1px solid #ddd;
            margin-bottom: 15px;
            background-color: #f5f5f5;
            border-radius: 4px;
        }
        .order p {
            font-size: 16px;
            font-weight: bold;
        }
        a {
            display: inline-block;
            padding: 10px 15px;
            background-color: #28a745;
            color: white;
            text-decoration: none;
            border-radius: 4px;
        }
        a:hover {
            background-color: #218838;
        }
        input[type="submit"] {
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>Welcome to Our Coffee Shop</h1>
        <h2>Cashier: <%= Session("cashierName") %></h2>

        <form action="display.asp" method="POST">
            <label for="name">Name</label>
            <input type="text" id="name" name="name" required />

            <h2>Order List</h2>

            <!-- Orders List --> 
            <div id="orderContainer">

                <!-- First Order -->
                <div class="order">
                    <p><strong>Order</strong></p>
                    <label for="coffee1">Type of Coffee</label>
                    <select id="coffee1" name="coffee[]" required>
                        <option value="Espresso">Espresso</option>
                        <option value="Latte">Latte</option>
                        <option value="Cappuccino">Cappuccino</option>
                        <option value="Americano">Americano</option>
                    </select>
                    
                    <label for="size1">Size</label>
                    <select id="size1" name="size[]" required>
                        <option value="Tall">Tall</option>
                        <option value="Grande">Grande</option>
                        <option value="Venti">Venti</option>
                    </select>

                    <label for="quantity1">Quantity</label>
                    <input type="number" id="quantity1" name="quantity[]" min="1" value="1" required />
                </div>
            </div>

            <!-- Add Order Button -->
            <a href="#" onclick="addOrder(); return false;">Add another coffee</a>
            <br><br>

            <!-- Delivery Notes -->
            <label for="notes">Extra Notes (Optional)</label>
            <textarea id="notes" name="notes"></textarea>

            <!-- PWD Discount Option -->
            <label for="pwd">Is there PWD Discount?</label>
            <input type="checkbox" id="pwd" name="pwd" />
        
            <!-- Submit Button -->
            <input type="submit" value="Submit Order" />
        </form>

        <!-- JavaScript to Add/Remove Orders -->
        <script>
            var orderCount = 1;
            function addOrder() {
                orderCount++;
                var orderContainer = document.getElementById("orderContainer");
                var newOrder = document.createElement("div");
                newOrder.className = "order";
                newOrder.innerHTML = `
                    <p><strong>Order</strong></p>
                    <label for="coffee${orderCount}">Type of Coffee:</label>
                    <select id="coffee${orderCount}" name="coffee[]" required>
                        <option value="Espresso">Espresso</option>
                        <option value="Latte">Latte</option>
                        <option value="Cappuccino">Cappuccino</option>
                        <option value="Americano">Americano</option>
                    </select>
                    
                    <label for="size${orderCount}">Size</label>
                    <select id="size${orderCount}" name="size[]" required>
                        <option value="Tall">Tall</option>
                        <option value="Grande">Grande</option>
                        <option value="Venti">Venti</option>
                    </select>

                    <label for="quantity${orderCount}">Quantity:</label>
                    <input type="number" id="quantity${orderCount}" name="quantity[]" min="1" value="1" required /><br><br>
                    <a href="#" onclick="removeOrder(this); return false;">Remove this order</a>
                    <br><br>
                `;
                orderContainer.appendChild(newOrder);
            }

            function removeOrder(orderLink) {
                var orderDiv = orderLink.parentNode;
                orderDiv.remove();
            }
        </script>
    </div>

</body>
</html>
