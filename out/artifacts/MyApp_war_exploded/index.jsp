<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <title>To Do List</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
    }
    .container {
      max-width: 800px;
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
    input[type="text"] {
      padding: 8px;
      margin-right: 5px;
      width: 60%;
      border-radius: 5px;
      border: 1px solid #ccc;
    }
    input[type="submit"] {
      padding: 8px 20px;
      border-radius: 5px;
      border: none;
      cursor: pointer;
    }
    table {
      width: 100%;
      border-collapse: collapse;
    }
    th, td {
      padding: 8px;
      border-bottom: 1px solid #ddd;
      text-align: left;
    }
    th {
      background-color: #f2f2f2;
    }
    .view-button, .add-button, .remove-button {
      background-color: #4CAF50; /* Green */
      color: white;
      border: none;
      border-radius: 5px;
      padding: 8px 20px;
      text-align: center;
      text-decoration: none;
      display: inline-block;
      font-size: 16px;
      margin-bottom: 10px;
      cursor: pointer;
    }
    .add-button {
      background-color: #008CBA; /* Blue */
    }
    .remove-button {
      background-color: #f44336; /* Red */
    }
  </style>
</head>
<body>

<div class="container">
  <h1>To Do List Web Application</h1>

  <%
    // Database connection parameters
    String url = "jdbc:mysql://localhost:3306/todolist";
    String username = "root";
    String password = "Database123";
    Connection connection = null;

    try {
    // Establish database connection
    Class.forName("com.mysql.jdbc.Driver");
    connection = DriverManager.getConnection(url, username, password);

    // Check if 'todo_items' table exists
    DatabaseMetaData dbm = connection.getMetaData();
    ResultSet tables = dbm.getTables(null, null, "todo_items", null);
    if (!tables.next()) {
      // 'todo_items' table does not exist, create it
      Statement statement = connection.createStatement();
      String createTableQuery = "CREATE TABLE todo_items (id INT AUTO_INCREMENT PRIMARY KEY, description VARCHAR(255) NOT NULL)";
      statement.executeUpdate(createTableQuery);
    }

  } catch (ClassNotFoundException | SQLException e) {
    e.printStackTrace();
  } finally {
    // Close database connection
    if (connection != null) {
      try {
        connection.close();
      } catch (SQLException e) {
        e.printStackTrace();
      }
    }
  }
  %>

  <form action="view.jsp" method="get">
    <input type="submit" class="view-button" value="View List" />
  </form>

  <form action="add.jsp" method="post">
    <input type="text" name="newItem" placeholder="Enter todo item" />
    <input type="submit" class="add-button" value="Add to List" />
  </form>

  <form action="remove.jsp" method="post">
    <input type="text" name="itemId" placeholder="Enter todo item ID to remove" />
    <input type="submit" class="remove-button" value="Remove from List" />
  </form>

</div>

</body>
</html>
