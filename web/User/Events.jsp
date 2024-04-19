<%-- 
    Document   : Complaint
    Created on : May 13, 2021, 3:06:52 PM
    Author     : Pro-TECH
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Complaint</title>
        <%@include file="SessionValidator.jsp" %>
        <%@include file="Header.jsp" %>
    </head>
    <%        if (request.getParameter("id") != null) {
            String insQry = "INSERT INTO `tbl_eventbooking` (`event_id`, `user_id`, `eventbooking_date`) "
                    + "values('" + request.getParameter("id") + "','" + session.getAttribute("uid") + "',curdate())";
            if (con.executeCommand(insQry)) {
    %> 

    <script type="text/javascript">
        setTimeout(function() {
            alert("Booked")
            window.location.href = 'EventBookings.jsp'
        }, 40);//40millisecend it go to next page
    </script>
    <%
            }
        }
    %>
    <body>
        <div id="tab" align="center">
            <h1>Events</h1>


            <table>
                <tr>

                    <th>sl.no</th>
                    <th>Event</th>
                    <th>Details</th>
                    <th>Photo</th>
                    <th>Fee</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Action</th>

                </tr>
                <%           String selQry = "select * from tbl_event";
                    int i = 0;
                    ResultSet rs = con.selectCommand(selQry);
                    while (rs.next()) {
                        i++;


                %>
                <tr>

                    <td><%=i%></td>
                    <td><%=rs.getString("event_name")%></td>
                    <td><%=rs.getString("event_details")%></td>
                    <td><img src="../Assets/Files/<%=rs.getString("event_photo")%>" width="120" height="120"></td>
                    <td><%=rs.getString("event_fee")%></td>
                    <td><%=rs.getString("event_date")%></td>
                    <td><%=rs.getString("event_time")%></td>
                    <td><a href="Events.jsp?id=<%=rs.getString("event_id")%>">Book</a></td>


                </tr>

                <%
                    }

                %>

            </table>

        </div>
        <%@include file="Footer.jsp" %>
    </body>
</html>
