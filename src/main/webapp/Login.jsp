<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
    <h2>Login</h2>

    <%
        String error = (String) request.getAttribute("error");
        if(error != null){ // Nếu có lỗi
    %>
        <p style="color:red; "><%= error%></p>
    <%
        }
    %>

    <form action="doLogin.jsp" method="post">
        <table>
            <tr>
                <td>Username:</td>
                <td><label>
                    <input type="text" name="username" required>
                </label></td>
            </tr>
            <tr>
                <td>Password:</td>
                <td><label>
                    <input type="password" name="password" required >
                </label></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Login"></td>
            </tr>
        </table>

    </form>
</body>
</html>