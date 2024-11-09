<html>
<head>
    <title>Order Confirmation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            color: #333;
            margin: 0;
            padding: 0;
        }
        h1, h2, h3 {
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
        p {
            font-size: 16px;
        }
        .order {
            padding: 15px;
            border: 1px solid #ddd;
            margin-bottom: 15px;
            background-color: #f5f5f5;
            border-radius: 4px;
        }
        .order span {
            display: block;
            margin-bottom: 5px;
        }
        a {
            display: inline-block;
            padding: 10px 15px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 4px;
        }
        a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Thank You for Your Coffee Order!</h1>

        <h2>Cashier: <%= Session("cashierName") %></h2>
        <h2>Transaction Date: <%= Response.Write(Date) %></h2>

        <%
            Dim customerName, notes
            customerName = Request.Form("name")
            notes = Request.Form("notes")
        %>

        <h3>Customer Information</h3>
        <p><strong>Name: </strong> <%= customerName %></p>

        <p><strong>Notes: </strong> <%= notes %></p>

        <h3>Order Details</h3>

        <%
            display()
            SUB display()
                coffee = Split(Replace(Request.Form("coffee[]"), ", ", ","), ",")
                quantity = Split(Replace(Request.Form("quantity[]"), ", ", ","), ",")
                size = Split(Replace(Request.Form("size[]"), ", ", ","), ",")
                totalCost = 0

                For i = 0 To UBound(coffee)
                    Dim coffeeCost
                    coffeeCost = 0

                    If size(i) = "Tall" Then
                        coffeeCost = 85.0
                    ElseIf size(i) = "Grande" Then
                        coffeeCost = 100.0
                    ElseIf size(i) = "Venti" Then
                        coffeeCost = 125.0
                    End If

                    coffeeCost = coffeeCost * CInt(quantity(i))

                    Response.Write("<div class='order'>")
                    Response.Write("<h3>Order " & i + 1 & "</h3>")
                    Response.Write("<span>" & quantity(i) & " Qty. " & coffee(i) & " (" & size(i) & ")</span>")
                    Response.Write("<span> $" & coffeeCost & "</span>")
                    Response.Write("</div>")

                    totalCost = totalCost + coffeeCost
                Next

                Dim delivery, pwdDiscount, discountedTotal
                delivery = Request.Form("deliver")
                If delivery = "dine-in" Then
                    mode = "Dine-in"
                Else
                    mode = "Take-Out"
                End If
                Response.Write("<p><strong>Delivery:</strong> " & mode & "</p>")

                Response.Write("<p><strong>Total Cost:</strong> $" & totalCost & "</p>")

                pwdDiscount = Request.Form("pwd")
                If pwdDiscount = "on" Then
                    discountedTotal = totalCost * 0.8
                    Response.Write("<p><strong>PWD Discounted Total:</strong> $" & discountedTotal & "</p>")
                Else
                    discountedTotal = totalCost
                End If
            End Sub
        %>

        <a href="order.asp">Place Another Order</a>
    </div>
</body>
</html>
