<%@ page import="com.demo.dao.SupplierDAO" %>
<%@ page import="com.demo.model.Manager" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<html>
<head>
    <title>Add New Supplier</title>
</head>
<body>
    <h2>Add New Supplier</h2>
    <% String error = (String) request.getAttribute("error");%>
    <%
        if (error != null) {
    %>
        <p style="color: red"><%= error %></p>
    <%
        }
    %>

    <form action="doAddSupplier.jsp" method="post">
        <table>
            <tr>
                <td>ID (*):</td>
                <td><input type="text" name="supplierId" required placeholder="Ví dụ: S001"></td>
            </tr>
            <tr>
                <td>Name (*):</td>
                <td><input type="text" name="supplierName" required></td>
            </tr>
            <tr>
                <td>Address:</td>
                <td><input type="text" name="address"></td>
            </tr>
            <tr>
                <td>Phone:</td>
                <td><input type="text" name="phone"></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><input type="email" name="email"></td>
            </tr>
            <tr>
                <td>Date (*):</td>
                <td><input type="date" name="addedDate" required></td>
            </tr>
            <tr>
                <td>Tax Code:</td>
                <td><input type="text" name="taxCode"></td>
            </tr>
            <tr>
                <td>Description:</td>
                <td><textarea name="description"></textarea></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="submit" value="Save">
                    <a href="SupplierManagement.jsp"><button type="button">Cancel</button></a>
                </td>
            </tr>
        </table>
    </form>

    
</body>
</html>