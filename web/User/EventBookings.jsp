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

    <body>
        <div id="tab" align="center">
            <h1>Events</h1>


            <table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
            <thead>
                <tr>
                    <th>Sl.no</th>
                    <th>Event</th>
                    <th>Booked Date</th>
                    <th>Date</th>
                </tr>
            </thead>
            <tbody>
                <%                    int i = 0;
                    String selQry = "select * from tbl_eventbooking eb  inner join tbl_event e on e.event_id=eb.event_id where user_id='" + session.getAttribute("uid") + "'";
                    ResultSet rs = con.selectCommand(selQry);

                    while (rs.next()) {
                        i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("event_name")%></td>
                    <td><%=rs.getString("eventbooking_date")%></td>
                    <td><%=rs.getString("event_date")%></td>
                </tr>
                <%
                    }

                %>
            </tbody>
        </table>

        </div>
        <%@include file="Footer.jsp" %>
    </body>
</html>
