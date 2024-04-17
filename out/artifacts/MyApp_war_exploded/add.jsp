<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add to List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 5px;
        }
        h1 {
            text-align: center;
        }
        form {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 8px;
        }
        input[type="text"] {
            padding: 8px;
            margin-bottom: 10px;
            width: 100%;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        input[type="submit"] {
            padding: 10px 20px;
            border-radius: 5px;
            border: none;
            cursor: pointer;
            background-color: #4CAF50; /* Green */
            color: white;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        .back-button {
            padding: 10px 20px;
            border-radius: 5px;
            border: none;
            cursor: pointer;
            background-color: #f44336; /* Red */
            color: white;
        }
        .back-button:hover {
            background-color: #d32f2f;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Add to List:</h1>

    <form action="view.jsp" method="post">
        <label for="name">Task Description:</label>
        <input type="text" id="name" name="name" required><br>

        <input type="submit" value="Submit">
    </form>

    <form action="index.jsp">
        <input type="submit" class="back-button" value="Back" />
    </form>
</div>

</body>
</html>
