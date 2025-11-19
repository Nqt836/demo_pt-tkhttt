<%@ page import="com.demo.dao.SupplierDAO" %>
<%@ page import="com.demo.model.Manager" %>
<%@ page import="com.demo.model.Supplier" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<%
    request.setCharacterEncoding("UTF-8"); // để xử lý tiếng việt

    // lấy dữ liệu từ form
    String id = request.getParameter("supplierId");
    String name = request.getParameter("supplierName");
    String address = request.getParameter("address");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String date = request.getParameter("addedDate"); // Trả về YYYY-MM-DD
    String tax = request.getParameter("taxCode");
    String desc = request.getParameter("description");

    // Tạo đối tượng Supplier
    Supplier newSupplier =  new Supplier(id, name, address, email, phone, date, tax, desc);

    // Gọi DAO để thêm
    SupplierDAO dao = new SupplierDAO();
    boolean isSuccess =  dao.addSupplier(newSupplier);

    if(isSuccess){// thành công
        response.sendRedirect("SupplierManagement.jsp"); // Chuyển hướng về trang danh sách và gọi doList để load danh sach mới

    }
    else {
        request.setAttribute("error", "Thêm thất bại");
        request.getRequestDispatcher("AddSupplier.jsp").forward(request, response);
    }
%>