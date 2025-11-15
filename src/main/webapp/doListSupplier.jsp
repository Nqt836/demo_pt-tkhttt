<%@ page import="com.demo.dao.SupplierDAO" %>
<%@ page import="com.demo.model.Supplier" %>
<%@ page import="java.util.List" %>

<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<%
    String name = request.getParameter("supplierName");
    String date = request.getParameter("addedDate");

    SupplierDAO dao = new SupplierDAO();
    List<Supplier> listSupplier = dao.getListSupplier(name, date);

    session.setAttribute("listSupplier", listSupplier);
    response.sendRedirect("ListSupplier.jsp");
%>