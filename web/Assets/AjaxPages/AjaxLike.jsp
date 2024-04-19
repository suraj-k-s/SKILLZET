<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%
    String Id = request.getParameter("id");
    String selQry = "select * from tbl_like where post_id ='"+Id+"' and user_id ='"+session.getAttribute("uid")+"'";
    ResultSet rs = con.selectCommand(selQry);
    if(!rs.next())
    {
        String insQry = "insert into tbl_like(post_id,user_id,user_name,user_photo)"
            + "values('" + Id + "','" + session.getAttribute("uid") + "','" + session.getAttribute("uname") + "','" + session.getAttribute("uphoto") + "')";

    if (con.executeCommand(insQry)) {
        String likesel = "select count(like_id) as count from tbl_like where post_id='" + Id + "'";
        ResultSet cv = con.selectCommand(likesel);
        if (cv.next()) {
            out.println(cv.getString("count"));
        }

    } else {
        out.println("0");
        System.out.println(insQry);
    }
    }
    

%>