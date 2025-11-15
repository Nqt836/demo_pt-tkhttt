<%@ page import="com.demo.dao.SystemUserDAO" %>
<%@ page import="com.demo.dao.ManagerDAO" %>
<%@ page import="com.demo.model.SystemUser" %>
<%@ page import="com.demo.model.Manager" %>

<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<%
    // Lấy username và password từ request
    String user = request.getParameter("username");
    String password = request.getParameter("password");

    // Tạo đối tượng SystemUser và Manager
    SystemUserDAO userDAO = new SystemUserDAO();
    ManagerDAO managerDAO = new ManagerDAO();

    // Gọi SystemUserDAO.checklogin()
    SystemUser systemUser = userDAO.checkLogin(user, password);

    // Kiểm tra đăng nhập
    if(systemUser != null){ // Đăng nhập đúng
        Manager manager = managerDAO.getManagerInfor(systemUser.getUserId());
        if(manager != null){
            session.setAttribute("account", manager);
            response.sendRedirect("ManagerHome.jsp");
        }
        else{
            request.setAttribute("error", "Không phải Manager");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }
    }
    else {
        request.setAttribute("error", "Đăng nhập thất bại");
        request.getRequestDispatcher("Login.jsp").forward(request, response);
    }

%>
