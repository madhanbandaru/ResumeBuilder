<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard - Resume Builder</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
    <div>
        <header>
            <h1>Resume Builder Dashboard</h1>
            <div>
                <span>Welcome, ${user.email}</span> | 
                <a href="/logout">Logout</a>
            </div>
        </header>
        
        <nav>
            <a href="/create-resume">Create New Resume</a>
        </nav>
        
        <main>
            <h2>Your Resumes</h2>
            
            <c:choose>
                <c:when test="${empty resumes}">
                    <p>You haven't created any resumes yet. <a href="/create-resume">Create your first resume</a></p>
                </c:when>
                <c:otherwise>
                    <table border="1">
                        <thead>
                            <tr>
                                <th>Full Name</th>
                                <th>Template</th>
                                <th>Created Date</th>
                                <th>Last Updated</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="resume" items="${resumes}">
                                <tr>
                                    <td>${resume.fullName}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${resume.template == 'modern'}">Modern</c:when>
                                            <c:when test="${resume.template == 'classic'}">Classic</c:when>
                                            <c:when test="${resume.template == 'creative'}">Creative</c:when>
                                            <c:otherwise>Standard</c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <fmt:formatDate value="${resume.createdAt}" pattern="MMM dd, yyyy"/>
                                    </td>
                                    <td>
                                        <fmt:formatDate value="${resume.updatedAt}" pattern="MMM dd, yyyy"/>
                                    </td>
                                    <td>
                                        <a href="/preview-resume/${resume.id}">Preview</a> |
                                        <a href="/edit-resume/${resume.id}">Edit</a> |
                                        <a href="/download-resume/${resume.id}">Download PDF</a> |
                                        <a href="/delete-resume/${resume.id}" 
                                           onclick="return confirm('Are you sure you want to delete this resume?')">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:otherwise>
            </c:choose>
        </main>
    </div>
</body>
</html>