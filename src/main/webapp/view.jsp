<%@ page import="com.jetbrains.myapp.Item" %>
<%@ page import="java.util.List" %>
<%@ page import="com.jetbrains.myapp.entity.ItemEntity" %>
<%@ page import="com.jetbrains.myapp.Main" %>
<%@ page import="java.util.ArrayList" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View List</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        .add-button {
            background-color: #4CAF50; /* Green */
            border: none;
            color: white;
            padding: 10px 24px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            transition-duration: 0.4s;
            cursor: pointer;
        }

        .remove-button {
            background-color: #f44336; /* Red */
            border: none;
            color: white;
            padding: 10px 24px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            transition-duration: 0.4s;
            cursor: pointer;
        }

        .add-button:hover {
            background-color: #45a049;
        }

        .remove-button:hover {
            background-color: #f44336;
        }

        .back-button {
            background-color: #008CBA; /* Blue */
            border: none;
            color: white;
            padding: 10px 24px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            transition-duration: 0.4s;
        }

        .back-button:hover {
            background-color: #006799;
        }

        /* Color coding for status dropdown options */
        select[name="status"] {
            padding: 8px;
            border-radius: 5px;
            border: 1px solid #ccc;
            background-color: white; /* Default background color */
        }

        select[name="status"] option[value="complete"] {
            background-color: #7FFF00; /* Light Green */
        }

        select[name="status"] option[value="in_process"] {
            background-color: #FFD700; /* Gold */
        }

        select[name="status"] option[value="not_started"] {
            background-color: #FF6347; /* Tomato */
        }
    </style>
</head>
<%
    if (request.getParameter("name") != null){
        String itemName = request.getParameter("name");
        Main.addItem(itemName);
    }
    if (request.getParameter("id") != null){
        int itemID = Integer.parseInt(request.getParameter("id"));
        Main.removeItemFromDatabase(itemID);
    }

%>

<body>

<h1>To Do List:</h1>

<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Status</th>
        <th>Timestamp</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <%
        ArrayList<Item> itemList = Main.getToDoList();
        for (Item item : itemList) {
    %>
    <tr>
        <td><%= item.getItemID() %></td>
        <td><%= item.getItemName() %></td>
        <td>
            <select name="status">
                <option value="complete" style="background-color: #7FFF00;">Complete</option>
                <option value="in_process" style="background-color: #FFD700;">In Process</option>
                <option value="not_started" style="background-color: #FF6347;">Not Started</option>
            </select>
        </td>
        <td>
            <select name="day">
                <% for (int i = 1; i <= 31; i++) { %>
                <option value="<%= i %>"><%= i %></option>
                <% } %>
            </select>
            <select name="month">
                <% for (int i = 1; i <= 12; i++) { %>
                <option value="<%= i %>"><%= i %></option>
                <% } %>
            </select>
            <select name="year">
                <% for (int i = 2022; i <= 2030; i++) { %>
                <option value="<%= i %>"><%= i %></option>
                <% } %>
            </select>
        </td>
        <td>
            <form action="remove.jsp" method="post" style="display: inline;">
                <input type="hidden" name="id" value="<%= item.getItemID() %>">
                <button type="submit" class="remove-button">Remove</button>
            </form>
        </td>
    </tr>
    <% } %>
    </tbody>
</table>

<form action="index.jsp">
    <input type="submit" class="back-button" value="Back" />
</form>
</body>
</html>