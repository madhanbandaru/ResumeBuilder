<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create Resume - Resume Builder</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
    <div>
        <header>
            <h1>Create New Resume</h1>
            <nav>
                <a href="/dashboard">Back to Dashboard</a> | 
                <a href="/logout">Logout</a>
            </nav>
        </header>
        
        <main>
            <form action="/create-resume" method="post">
                <fieldset>
                    <legend>Personal Information</legend>
                    <table>
                        <tr>
                            <td><label for="fullName">Full Name:</label></td>
                            <td><input type="text" id="fullName" name="fullName" required maxlength="100"></td>
                        </tr>
                        <tr>
                            <td><label for="email">Email:</label></td>
                            <td><input type="email" id="email" name="email" required maxlength="100"></td>
                        </tr>
                        <tr>
                            <td><label for="phone">Phone:</label></td>
                            <td><input type="tel" id="phone" name="phone" required maxlength="20"></td>
                        </tr>
                        <tr>
                            <td><label for="address">Address:</label></td>
                            <td><textarea id="address" name="address" rows="3" cols="50" required></textarea></td>
                        </tr>
                    </table>
                </fieldset>
                
                <fieldset>
                    <legend>Career Objective</legend>
                    <table>
                        <tr>
                            <td><label for="careerObjective">Career Objective:</label></td>
                            <td><textarea id="careerObjective" name="careerObjective" rows="4" cols="50" 
                                         placeholder="Brief description of your career goals and aspirations"></textarea></td>
                        </tr>
                    </table>
                </fieldset>
                
                <fieldset>
                    <legend>Education</legend>
                    <table>
                        <tr>
                            <td><label for="education">Education Details:</label></td>
                            <td><textarea id="education" name="education" rows="5" cols="50" required
                                         placeholder="Include degree, institution, year of graduation, GPA (if applicable)"></textarea></td>
                        </tr>
                    </table>
                </fieldset>
                
                <fieldset>
                    <legend>Work Experience</legend>
                    <table>
                        <tr>
                            <td><label for="experience">Work Experience:</label></td>
                            <td><textarea id="experience" name="experience" rows="6" cols="50"
                                         placeholder="Include job title, company, duration, and key responsibilities"></textarea></td>
                        </tr>
                    </table>
                </fieldset>
                
                <fieldset>
                    <legend>Skills</legend>
                    <table>
                        <tr>
                            <td><label for="skills">Skills:</label></td>
                            <td><textarea id="skills" name="skills" rows="4" cols="50" required
                                         placeholder="List your technical and soft skills"></textarea></td>
                        </tr>
                    </table>
                </fieldset>
                
                <fieldset>
                    <legend>Achievements</legend>
                    <table>
                        <tr>
                            <td><label for="achievements">Achievements:</label></td>
                            <td><textarea id="achievements" name="achievements" rows="4" cols="50"
                                         placeholder="Include awards, certifications, notable accomplishments"></textarea></td>
                        </tr>
                    </table>
                </fieldset>
                
                <fieldset>
                    <legend>Template Selection</legend>
                    <table>
                        <tr>
                            <td><label>Choose Template:</label></td>
                            <td>
                                <input type="radio" id="modern" name="template" value="modern" checked>
                                <label for="modern">Modern</label><br>
                                
                                <input type="radio" id="classic" name="template" value="classic">
                                <label for="classic">Classic</label><br>
                                
                                <input type="radio" id="creative" name="template" value="creative">
                                <label for="creative">Creative</label><br>
                                
                                <input type="radio" id="standard" name="template" value="standard">
                                <label for="standard">Standard</label>
                            </td>
                        </tr>
                    </table>
                </fieldset>
                
                <div>
                    <input type="submit" value="Create Resume">
                    <input type="reset" value="Clear All">
                    <a href="/dashboard">Cancel</a>
                </div>
            </form>
        </main>
    </div>
</body>
</html>