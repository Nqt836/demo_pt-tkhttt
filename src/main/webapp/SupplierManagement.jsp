<%@ page import="com.demo.model.Manager" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<html>
<head>
    <title>Supplier Management</title>
</head>
<body>
    <h2>Supplier Management</h2>

    <form action="doListSupplier.jsp" method="get">
        <label>Supplier Name:</label>
        <label>
            <input type="text" name="supplierName">
        </label>

        <label>Date: </label>
        <label>
            <input type="text" name="addedDate">
        </label>

        <input type="submit" value="View">
    </form>

    <hr>

    <a href="AddSupplier.jsp">
        <button>Add Supplier</button>
    </a>
    <a href="ManagerHome.jsp">
        <button>Back</button>
    </a>

</body>
</html>