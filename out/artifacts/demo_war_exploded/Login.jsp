<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
    <h2>Login</h2>
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