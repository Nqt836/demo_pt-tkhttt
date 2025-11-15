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
    <h2>List Supplier</h2>
    <% if (listSupplier != null && !listSupplier.isEmpty()) {
    %>
        <table border="1" style="border-collapse: collapse; width: 80%">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Address</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Added Date</th>
                    <th></th>
                </tr>
            </thead>

            <% for (Supplier s : listSupplier) {
                // Lặp để lấy từng Supplier
            %>
                <tbody>
                    <tr>
                        <td style="text-align: center"><%= s.getSupplierId()%></td>
                        <td style="text-align: center"><%= s.getSupplierName()%></td>
                        <td style="text-align: center"><%= s.getAddress() %></td>
                        <td style="text-align: center"><%= s.getEmail()%></td>
                        <td style="text-align: center"><%= s.getPhone()%></td>
                        <td style="text-align: center"><%= s.getAddedDate()%></td>
                        <td style="text-align: center">
                            <a href="SupplierHome.jsp">View</a>
                        </td>
                    </tr>
                </tbody>
            <%
                }
            %>

        </table>
    <%
        } else {
    %>
    <p style="color: red;">Không tìm thấy nhà cung cấp nào</p>
    <%
        }
    %>

    
    <br>
    <a href="SupplierManagement.jsp">
        <button >Back</button>
    </a>
</body>
</html>