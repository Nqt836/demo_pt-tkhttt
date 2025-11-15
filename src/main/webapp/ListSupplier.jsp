<%@ page import="com.demo.model.Supplier" %>
<%@ page import="java.util.List" %>

<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<%
    // Lấy danh sách từ session
    List<Supplier> listSupplier = (List<Supplier>) session.getAttribute("listSupplier");
%>

<html>
<head>
    <title>List Supplier</title>

</head>
<body>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Address</th>
                <th>Phone</th>
                <th>Email</th>
                <th>Added Date</th>
            </tr>
        </thead>
        <tbody>
            <%
                // Lặp qua danh sách
                if(listSupplier != null && !listSupplier.isEmpty()){
                    for (Supplier s : listSupplier){
            %>
            <tr>
                <td><%= s.getSupplierId() %></td>
                <td><%= s.getSupplierName()%></td>
                <td><%= s.getAddress()%></td>
                <td><%= s.getPhone()%></td>
                <td><%= s.getEmail()%></td>
                <td><%= s.getAddedDate()%></td>
            </tr>
            <%
                    }
                }else {
            %>
            <tr>
                <td colspan="6">Không tìm thấy nhà cung cấp nào</td>
            </tr>
            <%
                    }
            %>
        </tbody>
    </table>
    <br>
    <a href="SupplierManagement.jsp">
        <button>Back</button>
    </a>
</body>
</html>