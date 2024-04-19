<%@page import="java.sql.ResultSet"%>
<!doctype html>
<html lang="en">
    <jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
        <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
            <title> Login</title>

            <link rel="shortcut icon" href="assets/images/fav.jpg">
            <link rel="stylesheet" href="Assets/Template/Login/assets/css/bootstrap.min.css">
            <link rel="stylesheet" href="Assets/Template/Login/assets/css/fontawsom-all.min.css">
            <link rel="stylesheet" type="text/css" href="Assets/Template/Login/assets/css/style.css" />
        <%

            if (request.getParameter("btn_login") != null) {

                String email = request.getParameter("txt_email");
                String password = request.getParameter("txt_password");
                String admin = "select * from tbl_admin where admin_email ='" + email + "' and admin_password='" + password + "' ";
                ResultSet rsA = con.selectCommand(admin);

                String user = "select * from tbl_user where user_email ='" + email + "' and user_password='" + password + "'";
                ResultSet rsC = con.selectCommand(user);

                if (rsA.next()) {
                    session.setAttribute("aid", rsA.getString("admin_id"));
                    session.setAttribute("aname", rsA.getString("admin_name"));
                    response.sendRedirect("Admin/HomePage.jsp");
                } else if (rsC.next()) {

                    session.setAttribute("uid", rsC.getString("user_id"));
                    session.setAttribute("uname", rsC.getString("user_name"));
                    session.setAttribute("uphoto", rsC.getString("user_photo"));
                    session.setAttribute("uemail", rsC.getString("user_email"));
                    response.sendRedirect("User/HomePage.jsp");

                } else {

        %> 
        <script type="text/javascript">
            alert("Invalid Login Credentials");
            setTimeout(function() {
                window.location.href = 'index.jsp'
            }, 100);
        </script>
        <%            }
            }
        %>
    </head>

    <body class="h-100">
        
            <div class="container-fluid full-bg h-100">
                <div class="container h-100">
                    <div class="row no-margin h-100">
                        <div class="bg-layer d-flex col-md-4"><form method="post">
                            <div class="login-box row">
                                <h3>User login</h3>
                                <input placeholder="Enter Email Address" type="text" name="txt_email" class="form-control">
                                <input type="text" placeholder="Enter Password" name="txt_password" class="form-control">
                                <button class="btn btn-success" type="submit" name="btn_login">Click to Login</button> </form>
                            </div>
                        </div>
                        </div>    
                    </div>

                </div>

            </div>
       
    </body>

    <script src="assets/js/jquery-3.2.1.min.js"></script>
    <script src="Assets/Template/Login/assets/js/popper.min.js"></script>
    <script src="Assets/Template/Login/assets/js/bootstrap.min.js"></script>        
    <script src="Assets/Template/Login/assets/js/script.js"></script>

    <script>
            $(document).ready(function() {
                var arr = ['bg_1.jpg', 'bg_2.jpg'];

                var i = 0;
                setInterval(function() {
                    if (i == arr.length - 1) {
                        i = 0;
                    } else {
                        i++;
                    }
                    var img = 'url(' + arr[i] + ')';
                    $(".full-bg").css('background-image', img);

                }, 4000)

            });
    </script>

</html>