<%-- 
    Document   : register
    Created on : Sep 19, 2024, 3:06:55 PM
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
        <form class="tg-formtheme" action="register" method="post">
            <fieldset>
                <div class="form-group">
                    <label>Full Name</label>
                    <input style="text-transform: none;" type="text" name="fullName" class="form-control" placeholder="Full Name" required>
                </div>
                <div class="form-group">
                    <label>Username</label>
                    <input style="text-transform: none;" type="text" name="username" class="form-control" placeholder="Username" required>
                </div>
                <div class="form-group">
                    <label>Email</label>
                    <input style="text-transform: none;" type="email" name="email" class="form-control" placeholder="Email" required>
                </div>
                <div class="form-group">
                    <label>Phone Number</label>
                    <input style="text-transform: none;" type="text" name="phone" class="form-control" placeholder="Phone Number" required>
                </div>
                <div class="form-group">
                    <label>Address</label>
                    <input style="text-transform: none;" type="text" name="address" class="form-control" placeholder="Address" required>
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <input style="text-transform: none;" type="password" name="password" class="form-control" placeholder="Password" required>
                </div>
                <div class="form-group">
                    <label>Confirm Password</label>
                    <input style="text-transform: none;" type="password" name="confirmPassword" class="form-control" placeholder="Confirm Password" required>
                </div>
                <div class="form-group">
                    <button type="submit" class="tg-btn tg-active">Register</button>
                </div>
                <div class="form-group">
                    <p>Already have an account? <a href="login">Login here</a></p>
                </div>
                <div>
                    ${registerError}
                </div>
            </fieldset>
        </form>

    </body>
</html>
