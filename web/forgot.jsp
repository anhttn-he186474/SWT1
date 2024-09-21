<%-- 
    Document   : forgot
    Created on : Sep 20, 2024, 5:18:15 PM
    Author     : trant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <fieldset>
            <h2>Reset Password</h2>
            <p>Lost your password? Please enter your email address.</p>
            <p>You will receive a link to create a new password via email.</p>

            <c:if test="${requestScope.check != null}">
                <c:if test="${requestScope.check == 'true' && !(requestScope.message == 'Sorry, reset code incorrect')}">
                    <p>${requestScope.message}</p>
                </c:if>
                <c:if test="${requestScope.check == 'false'}">
                    <p>${requestScope.message}</p>
                </c:if>
                <c:if test="${requestScope.check == 'true' && requestScope.message == 'Sorry, reset code incorrect'}">
                    <p>${requestScope.message}</p>
                </c:if>
            </c:if>
            <form action="forgot" method="post">
                <c:if test="${requestScope.check == null || requestScope.check == 'false'}">
                    <div>
                        <div>
                            <input type="email" name="email" placeholder="Email Address" required="required" value="${requestScope.email}">
                        </div>
                    </div>
                </c:if>
                <c:if test="${requestScope.check == null || requestScope.check == 'false'}">
                    <div>
                        <div>
                            <button type="submit">Send Me Email</button>
                        </div>
                    </div>
                </c:if>
            </form>

            <c:if test="${requestScope.check != null && requestScope.check == 'true'}">
                <form action="confirmresetcode" method="post">
                    <input name="email" value="${requestScope.email}" type="hidden">
                    <div>
                        <div>
                            <input type="text" name="resetcode" placeholder="xxxxxx" required="required" value="${requestScope.code}">
                        </div>
                    </div>
                    <c:if test="${requestScope.check != null && requestScope.check == 'true'}">
                        <div>
                            <div>
                                <button type="submit">Confirm Reset Code</button>
                            </div>
                        </div>
                    </c:if>
                </form>
            </c:if>
        </fieldset>
    </body>
</html>
