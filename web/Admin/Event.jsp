<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Place</title>
        <%@include file="SessionValidator.jsp" %>
        <%@include file="Header.jsp" %>
    </head>

    <%        if (request.getParameter("del") != null) {
            String delQry = "delete from tbl_event where event_id='" + request.getParameter("del") + "'";
            con.executeCommand(delQry);
            response.sendRedirect("Event.jsp");
        }


    %>
    <body>


        <section class="main_content dashboard_part">

            <!--/ menu  -->
            <div class="main_content_iner ">
                <div class="container-fluid p-0">
                    <div class="row justify-content-center">
                        <div class="col-12">
                            <div class="QA_section">
                                <!--Form-->
                                <div class="white_box_tittle list_header">
                                    <div class="col-lg-12">
                                        <div class="white_box mb_30">
                                            <div class="box_header ">
                                                <div class="main-title">
                                                    <h3 class="mb-0" >Table Event</h3>
                                                </div>
                                            </div>
                                            <form enctype="multipart/form-data" action="../Assets/ActionPages/EventUploadAction.jsp" method="post">
                                                <div class="form-group">
                                                    <label for="txt_place">Name</label>
                                                    <input required="" type="text" class="form-control"  id="txt_name" name="txt_namde">
                                                </div>
                                                <div class="form-group">
                                                    <label for="txt_place">Details</label>
                                                    <input required="" type="text" class="form-control"  id="txt_details" name="txt_details">
                                                </div>
                                                <div class="form-group">
                                                    <label for="txt_place">Fee</label>
                                                    <input required="" type="text" class="form-control"  id="txt_fee" name="txt_fee">
                                                </div>
                                                <div class="form-group">
                                                    <label for="txt_place">Date</label>
                                                    <input required="" type="date" class="form-control"  id="txt_date" name="txt_date">
                                                </div>
                                                <div class="form-group">
                                                    <label for="txt_place">Time</label>
                                                    <input required="" type="time" class="form-control"  id="txt_time" name="txt_time">
                                                </div>
                                                <div class="form-group">
                                                    <label for="txt_place">Photo</label>
                                                    <input required="" type="file" class="form-control"  id="file_photo" name="file_photo">
                                                </div>
                                                <div class="form-group" align="center">
                                                    <input type="submit" class="btn-dark" name="btn_save" style="width:100px; border-radius: 10px 5px " value="Save">
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>

                                <div class="QA_table mb_30">
                                    <!-- table-responsive -->
                                    <table class="table lms_table_active">
                                        <thead>
                                            <tr style="background-color: #74CBF9">
                                                <td align="center" scope="col">Sl.No</td>
                                                <td align="center" scope="col">Photo</td>
                                                <td align="center" scope="col">Event</td>
                                                <td align="center" scope="col">Action</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%                                                int i = 0;
                                                String selQry = "select * from tbl_event";
                                                ResultSet rs = con.selectCommand(selQry);
                                                while (rs.next()) {

                                                    i++;

                                            %>
                                            <tr>    
                                                <td align="center"><%=i%></td>
                                                <td align="center"><img src="../Assets/Files/<%=rs.getString("event_photo")%>" height="120" width="120" style="border-radius: 50%"/></td>
                                                <td align="center"><%=rs.getString("event_name")%></td>
                                                <td align="center"> 
                                                    <a href="Event.jsp?del=<%=rs.getString("event_id")%>" class="status_btn">Delete</a> |
                                                    <a href="EventBooking.jsp?id=<%=rs.getString("event_id")%>" class="status_btn">Bookings</a> 
                                                </td> 
                                            </tr>
                                            <%                      }


                                            %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </section>
    </body>
    <%@include file="Footer.jsp" %>
</html>

