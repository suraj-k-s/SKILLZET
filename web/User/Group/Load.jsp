<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%
    String selQry = "select * from tbl_chat c inner join tbl_user u on (c.user_to_id=u.user_id) or (c.user_from_id=u.user_id) order by chat_id";
    ResultSet rs = con.selectCommand(selQry);
   
    while (rs.next()) {

        if (rs.getString("user_from_id").equals(session.getAttribute("uid"))) {
            
            String sel = "select * from tbl_user where user_id='" + rs.getString("user_id") + "'";
            ResultSet z = con.selectCommand(sel);
            if (z.next()) {
             
            %>

            <div class="chat-message is-sent">
                <img src="<%=z.getString("user_photo")%>" alt="">
                <div class="message-block">
                    <span><%=z.getString("user_name")%></span>
                    <div class="message-text"><%=rs.getString("chat_content")%></div>
                </div>
            </div>
            <div class="chat-message" style="margin: 0px; padding: 0px" >

            </div>
            <%

                }
            } else if (rs.getString("user_to_id").equals("0")) {
            %>
            <div class="chat-message is-received">
                <img src="<%=rs.getString("user_photo")%>" alt="">
                <div class="message-block">
                    <span><%=rs.getString("user_name")%></span>
                    <div class="message-text"><%=rs.getString("chat_content")%></div>
                </div>
            </div>
            <div class="chat-message" style="margin: 0px; padding: 0px" >

            </div>
            <%

        }
    }


%>