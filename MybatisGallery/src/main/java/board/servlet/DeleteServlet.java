package board.servlet;

public class DeleteServlet {
  
  if(file.delete()) { //파일이 삭제되었다면...
            int result=boardDAO.delete(Integer.parseInt(board_idx));

            out.print("<script>");
            if(result>0) {
                out.print("alert('삭제완료');");
                out.print("location.href='/board/list.jsp';");
            }else {
                out.print("alert('삭제실패');");
                out.print("history.back();");
            }
            out.print("</script>");
        }

    }

}
