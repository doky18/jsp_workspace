package com.edu.noticeapp.repository;

//******이거는 ANSI로 저장을 해야함
//Notice 테이블에 대한 CRUD를 수행하는 객체
//javaSE, javaEE에서 공통적으로 사용가능한 수준까지 정의해본다 
import java.sql.*;
import com.edu.noticeapp.domain.Notice;
import java.util.ArrayList;

public class NoticeDAO{
	String url="jdbc:oracle:thin:@localhost:1521:XE";
	String user="jsp";
	String password="1234";

	public int insert(Notice notice){
		int result=0;
		Connection con = null;
		PreparedStatement pstmt=null;
		
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection(url, user, password);
			String sql="insert into notice(notice_idx, title, writer, content)";
			sql+=" values(seq_notice.nextval, ?,?,?)";

			pstmt=con.prepareStatement(sql);		 //얘도 try catch
			pstmt.setString(1, notice.getTitle());
			pstmt.setString(2, notice.getWriter());
			pstmt.setString(3, notice.getContent());
			
			result=pstmt.executeUpdate(); //DML 실행

		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{
				if(pstmt!=null){
						pstmt.close();   //얘도 try catch
				}
				if(con!=null){
						con.close();
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	
		System.out.println("insert() 호출");
		return result;
	}

	//모든 레코드 가져오기
	public ArrayList selectAll(){
		ArrayList list = new ArrayList();

		Connection con = null;
		PreparedStatement pstmt= null;
		ResultSet rs=null;
		
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");		//try catch
			con=DriverManager.getConnection(url, user, password);

			String sql="select * from notice order by notice_idx desc";

			pstmt=con.prepareStatement(sql);		//try catch
			rs=pstmt.executeQuery();		//select 수행

			while(rs.next()){
				Notice notice = new Notice();
				
				notice.setNotice_idx(rs.getInt("notice_idx"));
				notice.setTitle(rs.getString("title"));
				notice.setWriter(rs.getString("writer"));
				notice.setContent(rs.getString("content"));
				notice.setRegdate(rs.getString("regdate"));
				notice.setHit(rs.getInt("hit"));

				list.add(notice);

			}
			

		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(pstmt!=null){
						pstmt.close();   //얘도 try catch
				}
				if(con!=null){
						con.close();
				}
				if(rs!=null){
						rs.close();
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		return list;
	}

	//상세보기
	public Notice select(int notice_idx){	//notice 한 건이 넘어오니까
		Notice notice=null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con=DriverManager.getConnection(url, user, password);
		String sql="select * from notice where notice_idx=?";
		
		pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, notice_idx);
		rs=pstmt.executeQuery();
		if(rs.next()){
			notice = new Notice();
			
			notice.setNotice_idx(rs.getInt("notice_idx"));
			notice.setTitle(rs.getString("title"));
			notice.setWriter(rs.getString("writer"));
			notice.setContent(rs.getString("content"));
			notice.setRegdate(rs.getString("regdate"));
			notice.setHit(rs.getInt("hit"));

		}

		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{
				if(pstmt!=null){
						pstmt.close();   //얘도 try catch
				}
				if(con!=null){
						con.close();
				}
				if(rs!=null){
						rs.close();
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return notice;
	}

	//한 건 삭제
	public int delete(int notice_idx){
		int result = 0;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection(url, user, password);

			String sql="delete notice where notice_idx=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, notice_idx);
			result=pstmt.executeUpdate();			//쿼리 실행

		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{
				if(pstmt!=null){
						pstmt.close();   //얘도 try catch
				}
				if(con!=null){
						con.close();
				}
				if(rs!=null){
						rs.close();
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return result;
	}

	//한 건 수정
	public int update(Notice notice) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		System.out.println(notice.getNotice_idx());
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, user, password);
			
			String sql = "update notice set title=?, writer=?, content=? where notice_idx=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, notice.getTitle());
			pstmt.setString(2, notice.getWriter());
			pstmt.setString(3, notice.getContent());
			pstmt.setInt(4, notice.getNotice_idx());
			
			result = pstmt.executeUpdate();
			if(result>0){
				System.out.println("성공");
			}else{
				System.out.println("실패");
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return result;
	}

	//글 조회수 증가
	public int updateHit(int notice_idx){
		int result = 0;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection(url, user, password);

			String sql="update notice set hit=hit+1 where notice_idx=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, notice_idx);
			result=pstmt.executeUpdate();			//쿼리 실행

		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{
				if(pstmt!=null){
						pstmt.close();   //얘도 try catch
				}
				if(con!=null){
						con.close();
				}
				if(rs!=null){
						rs.close();
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return result;
	}

}
