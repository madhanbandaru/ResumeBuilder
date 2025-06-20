<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Resume Builder</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
    <div>
        <h1>Resume Builder - Login</h1>
        
        <c:if test="${not empty error}">
            <div style="color: red; border: 1px solid red; padding: 10px; margin: 10px 0;">
                <strong>Error:</strong> ${error}
            </div>
        </c:if>
        
        <c:if test="${not empty message}">
            <div style="color: green; border: 1px solid green; padding: 10px; margin: 10px 0;">
                <strong>Success:</strong> ${message}
            </div>
        </c:if>
        
        <form action="/login" method="post">
            <table>
                <tr>
                    <td><label for="email">Email:</label></td>
                    <td><input type="email" id="email" name="email" required></td>
                </tr>
                <tr>
                    <td><label for="password">Password:</label></td>
                    <td><input type="password" id="password" name="password" required></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="Login">
                        <input type="reset" value="Clear">
                    </td>
                </tr>
            </table>
        </form>
        
        <p>
            Don't have an account? <a href="/register">Register here</a>
        </p>
    </div>
</body>
</html>