<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register - Resume Builder</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
    <div>
        <h1>Resume Builder - Register</h1>
        
        <c:if test="${not empty error}">
            <div style="color: red; border: 1px solid red; padding: 10px; margin: 10px 0;">
                <strong>Error:</strong> ${error}
            </div>
        </c:if>
        
        <form action="/register" method="post">
            <table>
                <tr>
                    <td><label for="email">Email:</label></td>
                    <td><input type="email" id="email" name="email" required></td>
                </tr>
                <tr>
                    <td><label for="password">Password:</label></td>
                    <td><input type="password" id="password" name="password" required minlength="6"></td>
                </tr>
                <tr>
                    <td><label for="confirmPassword">Confirm Password:</label></td>
                    <td><input type="password" id="confirmPassword" name="confirmPassword" required minlength="6"></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="Register">
                        <input type="reset" value="Clear">
                    </td>
                </tr>
            </table>
        </form>
        
        <p>
            Already have an account? <a href="/login">Login here</a>
        </p>
    </div>
</body>
</html>
