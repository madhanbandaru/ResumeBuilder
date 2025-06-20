<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Preview Resume - Resume Builder</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
    <div>
        <header>
            <h1>Resume Preview</h1>
            <nav>
                <a href="/dashboard">Back to Dashboard</a> | 
                <a href="/edit-resume/${resume.id}">Edit</a> |
                <a href="/download-resume/${resume.id}">Download PDF</a> |
                <a href="/logout">Logout</a>
            </nav>
        </header>
        
        <main>
            <div style="border: 2px solid black; padding: 20px; margin: 20px; background-color: white;">
                <!-- Resume Header -->
                <div style="text-align: center; border-bottom: 2px solid black; padding-bottom: 10px; margin-bottom: 20px;">
                    <h1 style="margin: 0; font-size: 24px;">${resume.fullName}</h1>
                    <p style="margin: 5px 0;">${resume.email} | ${resume.phone}</p>
                    <p style="margin: 5px 0;">${resume.address}</p>
                </div>
                
                <!-- Career Objective -->
                <c:if test="${not empty resume.careerObjective}">
                    <div style="margin-bottom: 20px;">
                        <h2 style="background-color: #f0f0f0; padding: 5px; margin: 0 0 10px 0; border-left: 4px solid black;">CAREER OBJECTIVE</h2>
                        <p style="margin: 0; text-align: justify;">${resume.careerObjective}</p>
                    </div>
                </c:if>
                
                <!-- Education -->
                <c:if test="${not empty resume.education}">
                    <div style="margin-bottom: 20px;">
                        <h2 style="background-color: #f0f0f0; padding: 5px; margin: 0 0 10px 0; border-left: 4px solid black;">EDUCATION</h2>
                        <div style="white-space: pre-line;">${resume.education}</div>
                    </div>
                </c:if>
                
                <!-- Experience -->
                <c:if test="${not empty resume.experience}">
                    <div style="margin-bottom: 20px;">
                        <h2 style="background-color: #f0f0f0; padding: 5px; margin: 0 0 10px 0; border-left: 4px solid black;">WORK EXPERIENCE</h2>
                        <div style="white-space: pre-line;">${resume.experience}</div>
                    </div>
                </c:if>
                
                <!-- Skills -->
                <c:if test="${not empty resume.skills}">
                    <div style="margin-bottom: 20px;">
                        <h2 style="background-color: #f0f0f0; padding: 5px; margin: 0 0 10px 0; border-left: 4px solid black;">SKILLS</h2>
                        <div style="white-space: pre-line;">${resume.skills}</div>
                    </div>
                </c:if>
                
                <!-- Achievements -->
                <c:if test="${not empty resume.achievements}">
                    <div style="margin-bottom: 20px;">
                        <h2 style="background-color: #f0f0f0; padding: 5px; margin: 0 0 10px 0; border-left: 4px solid black;">ACHIEVEMENTS</h2>
                        <div style="white-space: pre-line;">${resume.achievements}</div>
                    </div>
                </c:if>
            </div>
            
            <!-- Resume Info -->
            <div style="margin: 20px; padding: 10px; border: 1px solid #ccc; background-color: #f9f9f9;">
                <h3>Resume Information</h3>
                <table>
                    <tr>
                        <td><strong>Template:</strong></td>
                        <td>
                            <c:choose>
                                <c:when test="${resume.template == 'modern'}">Modern</c:when>
                                <c:when test="${resume.template == 'classic'}">Classic</c:when>
                                <c:when test="${resume.template == 'creative'}">Creative</c:when>
                                <c:otherwise>Standard</c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                    <tr>
                        <td><strong>Created:</strong></td>
                        <td><fmt:formatDate value="${resume.createdAt}" pattern="MMM dd, yyyy 'at' HH:mm"/></td>
                    </tr>
                    <tr>
                        <td><strong>Last Updated:</strong></td>
                        <td><fmt:formatDate value="${resume.updatedAt}" pattern="MMM dd, yyyy 'at' HH:mm"/></td>
                    </tr>
                </table>
            </div>
            
            <!-- Action Buttons -->
            <div style="text-align: center; margin: 20px;">
                <a href="/edit-resume/${resume.id}" style="margin: 5px;">
                    <button type="button">Edit Resume</button>
                </a>
                <a href="/download-resume/${resume.id}" style="margin: 5px;">
                    <button type="button">Download PDF</button>
                </a>
                <a href="/dashboard" style="margin: 5px;">
                    <button type="button">Back to Dashboard</button>
                </a>
            </div>
        </main>
    </div>
</body>
</html>