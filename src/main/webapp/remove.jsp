<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Remove from List</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
    }
    .container {
      max-width: 400px;
      margin: 20px auto;
      padding: 20px;
      background-color: #f9f9f9;
      border-radius: 5px;
    }
    h1 {
      text-align: center;
    }
    form {
      margin-bottom: 10px;
    }
    label {
      display: block;
      margin-bottom: 5px;
    }
    input[type="number"] {
      padding: 8px;
      width: 100%;
      border-radius: 5px;
      border: 1px solid #ccc;
      margin-bottom: 10px;
    }
    button[type="submit"], input[type="submit"] {
      padding: 8px 20px;
      border-radius: 5px;
      border: none;
      cursor: pointer;
      color: white;
    }
    button[type="submit"] {
      background-color: #4CAF50; /* Green */
    }
    button[type="submit"]:hover {
      background-color: #45a049;
    }
    input[type="submit"] {
      background-color: #008CBA; /* Blue */
    }
    input[type="submit"]:hover {
      background-color: #006799;
    }
    .back-button {
      background-color: #ccc; /* Light Grey */
      margin-right: 10px;
    }
    .back-button:hover {
      background-color: #bbb; /* Darker Grey */
    }
  </style>
</head>
<body>

<div class="container">
  <h1>Remove from List:</h1>

  <form action="view.jsp" method="post">
    <label for="id">ID to remove:</label>
    <input type="number" id="id" name="id" required><br>
    <button type="submit">Submit</button>
  </form>

  <form action="index.jsp">
    <input type="submit" class="back-button" value="Back" />
  </form>
</div>

</body>
</html>