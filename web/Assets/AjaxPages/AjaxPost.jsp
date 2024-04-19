<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%

    String Type = request.getParameter("type");
    String Content = request.getParameter("content");
    String File = request.getParameter("file");

    String insQry = "insert into tbl_post(post_date,user_id,user_name,user_photo,post_content,post_file)"
            + "values(DATE_FORMAT(sysdate(), '%M %d %Y, %h:%i %p'),'" + session.getAttribute("uid") + "','" + session.getAttribute("uname") + "','" + session.getAttribute("uphoto") + "','" + Content + "','" + File + "')";
    System.out.println(insQry);

    if (con.executeCommand(insQry)) {
        out.println("1");
    } else {
        out.println("0");
    }

%>