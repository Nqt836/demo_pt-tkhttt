<%@ page import="com.demo.model.Manager" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<%
    // Get from session: Manager
    Manager manager = (Manager) session.getAttribute("account");

%>

<html>
<head>
    <title>Manager Home</title>
</head>
<body>
    <p>Manager Name: <%= manager.getFullname() %></p>
    <p>ID: <%= manager.getUserId() %></p>
    <p>Position: <%= manager.getJobPosition() %></p>

    <hr>

    <a href="SupplierManagement.jsp">
        <button>Supplier Manager</button>
    </a>
    <a href="ImportItem.jsp">
        <button>Import Item</button>
    </a>
    <a href="StatisticalReport.jsp">
        <button>Statistical Report</button>
    </a>
    <a href="Login.jsp">
        <button>Back</button>
    </a>
</body>
</html>