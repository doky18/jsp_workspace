<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%! 
    //멤버영역
    Connection con;
    PreparedStatement pstmt;
    ResultSet rs;
    
    String url = "jdbc:oracle:thin:@localhost:1521:XE";
    String user = "java";
    String pass = "1234";

%>
<%
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con=DriverManager.getConnection(url,user,pass);
    String sql="select * from board order by board_idx desc";

    pstmt=con.prepareStatement(sql);
    rs = pstmt.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
table {
  border-collapse: collapse;
  border-spacing: 0;
  width: 100%;
  border: 1px solid #ddd;
}

th, td {
  text-align: left;
  padding: 16px;
}

tr:nth-child(even) {
  background-color: #f2f2f2;
}
</style>
</head>
<body>

<table>
  <tr>
    <th>NO</th>
    <th>제목</th>
    <th>작성자</th>
    <th>등록일</th>
    <th>조회수</th>
  </tr>
  <% while(rs.next()){ %>
    <tr>
        <td><%=rs.getString("board_idx")%></td>
        <td><%=rs.getString("title")%></td>
        <td><%=rs.getString("writer")%></td> 
        <td><%=rs.getString("regdate")%></td>
        <td><%=rs.getInt("hit")%></td>
        </tr>
    <%}%>
    <tr>
        <td colspan="5">
            <button onclick="location.href='regist.html';">글등록</button>
        </td>
    </tr>
</table>

</body>
</html>

<%
rs.close();
pstmt.close();
con.close();
%>
