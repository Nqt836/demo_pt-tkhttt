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
                <td><input type="text" name="supplierId" required placeholder="Ví dụ: S001"
                           value="<%= request.getAttribute("oldId")==null?"":request.getAttribute("oldId") %>"></td>
            </tr>
            <tr>
                <td>Name (*):</td>
                <td><input type="text" name="supplierName" required
                           value="<%= request.getAttribute("oldName")==null?"":request.getAttribute("oldName") %>"></td>
            </tr>
            <tr>
                <td>Address:</td>
                <td><input type="text" name="address"
                           value="<%= request.getAttribute("oldAddress")==null?"":request.getAttribute("oldAddress") %>"></td>
            </tr>
            <tr>
                <td>Phone:</td>
                <td><input type="text" name="phone" required placeholder="0xxxxxxxxx"
                           value="<%= request.getAttribute("oldPhone")==null?"":request.getAttribute("oldPhone") %>"></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><input type="email" name="email" required
                           value="<%= request.getAttribute("oldEmail")==null?"":request.getAttribute("oldEmail") %>"></td>
            </tr>
            <tr>
                <td>Date (*):</td>
                <td><input type="date" name="addedDate" required></td>
            </tr>
            <tr>
                <td>Tax Code:</td>
                <td><input type="text" name="taxCode"
                           value="<%= request.getAttribute("oldTax")==null?"":request.getAttribute("oldTax") %>"></td>
            </tr>
            <tr>
                <td>Description:</td>
                <td><textarea name="description"><%= request.getAttribute("oldDesc")==null?"":request.getAttribute("oldDesc") %></textarea></td>
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