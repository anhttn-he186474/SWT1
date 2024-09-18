<%-- 
    Document   : newjsp
    Created on : Sep 16, 2024, 11:18:21 AM
    Author     : trant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form class="tg-formtheme" action="login" method="post">
            <fieldset>
                <div class="form-group">
                    <label>Username</label>
                    <input style="text-transform: none;" type="text" name="username" value="${user}" class="form-control" placeholder="Username" required>
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <input style="text-transform: none;" type="password" name="password" value="${pass}" class="form-control" placeholder="Password" required>
                </div>
                <div class="form-group">
                    <p> <input type="checkbox" name="remember"> Remember me</p>
                </div>
                <div class="form-group">
                    <p><a href="forgot">Lost your password</a></p>
                </div>
                <div class="form-group">
                    <button type="submit" class="tg-btn tg-active">Login</button>
                </div>
                <div class="form-group">
                    <button type="submit" class="tg-btn tg-active">Google Login</button>
                </div>

                <div class="form-group">
                    <p>Don't have an account? <a href="register">Register here</a></p>
                </div>                  
                <c:if test="${not empty error}">
                    <h2 style="color: red">${error}</h2>
                </c:if>
                
            </fieldset>
        </form>
    </body>
</html>
