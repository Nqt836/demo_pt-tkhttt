<%@ page import="com.demo.model.Manager" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    String successMsg = (String) session.getAttribute("successMessage");
    if (successMsg != null) {
%>
<div style="color: green; font-weight: bold; border: 1px solid green; padding: 10px; margin: 10px 0;">
    <%= successMsg %>
</div>
<%
        session.removeAttribute("successMessage"); // Xóa ngay sau khi hiện
    }
%>

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