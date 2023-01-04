<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%! 
    //멤버영역
    Connection con;
    PreparedStatement pstmt;
    
    String url = "jdbc:oracle:thin:@localhost:1521:XE";
    String user = "java";
    String pass = "1234";

%>
    <% 
    
    /*
    클라이언트에서 전송된 파라미터를 이용하여 오라클에 넣기*/ /* request는 내장객체이기 때문에 그 명칭이 이미 시스템에 의해 정해져있다 웹상으로 전달된 모든~ 데이터는 문자열 취급 
    */

        request.setCharacterEncoding("utf-8"); 
        
        String title=request.getParameter("title"); //html 
        String writer=request.getParameter("writer"); 
        String content=request.getParameter("content"); 
        
        out.print(title+"<br>");
        out.print(writer+"<br>");
        out.print(content+"<br>");

        out.print("insert.jsp 동작 함");

        Class.forName("oracle.jdbc.driver.OracleDriver");
        
        con = DriverManager.getConnection(url, user, pass);
        out.print(con); //not null

        String sql="insert into board(board_idx, title, writer, content)";
        sql+=" values(seq_board.nextval, ?,?,?)";

        pstmt=con.prepareStatement(sql);
        pstmt.setString(1, title);
        pstmt.setString(2, writer);
        pstmt.setString(3, content);

        int result =pstmt.executeUpdate();  //레코드 수 반영 

        //out.print()는 서버가 클라이언트에 응답할 데이터를 모아놓는 출력 스트림이다.
        //print() 메서드에 명시한 문자열은 차곡 차곡 응답 객체에 쌓여 있다가 
        //서버가 응답을 할 시점에 다 모아진 문자열을 클라이언트에게 전송한다!

        //바구니 하나 놓고 얘들을 그냥 모아두는 것임.
        //다 모은 다음에 제일 마지막 >을 만나면 브라우저에 뿌려주는것.
        //그 전에는 그냥 문자열에 불과함

        if(result > 0){
            out.print("123<script>");
            out.print("alert('입력성공');");
            //클라이언트의 브라우저로 하여금, 이 응답정보를 받은 시점에 지정한 url로 다시 들어오게 한다 
            out.print("location.href='/board/boardlist.jsp';");
            out.print("</script>");
        }else{
            out.print("123<script>");
            out.print("alert('입력실패');");
            //클라이언트의 브라우저로 하여금, 이 응답정보를 받은 시점에 지정한 url로 다시 들어오게 한다 
            out.print("</script>");
        }

        pstmt.close();
        con.close();
        %>