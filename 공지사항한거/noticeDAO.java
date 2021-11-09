package notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;

public class noticeDAO {
	 private static noticeDAO instance = new noticeDAO();
	   
	   public static noticeDAO getInstance() {
	      return instance;
	   }
	   
	   public static Connection getConnection() throws Exception {
	      Context ctx = new InitialContext();
	      DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
	      return ds.getConnection();
	   }
	   
	   public ArrayList<noticeBean> getBoardList(int startRow,int pageSize) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			ArrayList<noticeBean> noticeList=new ArrayList<noticeBean>();
			try {
				con=getConnection();
				
				String sql="select * from board order by num desc limit ?,?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, startRow-1);//  
				pstmt.setInt(2, pageSize);
				
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					noticeBean nb=new noticeBean();
					nb.setId(rs.getInt("id"));
					nb.setName(rs.getString("name"));
					nb.setTitle(rs.getString("title"));
					nb.setContent(rs.getString("content"));
					nb.setRegDt(rs.getString("regDt"));
					
					noticeList.add(nb);
				}
			} catch (Exception e) {
				
				e.printStackTrace();
			}finally {
				
				if(rs!=null) try {rs.close();}catch(SQLException ex) {}
				if(pstmt!=null) try {pstmt.close();}catch(SQLException ex) {}
				if(con!=null) try{con.close();} catch(SQLException ex) {}
			}
			return noticeList;
		}
	   

	public void deleteBoard(noticeBean nb) {
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	try {
		// 예외가 발생하것 같은 구문
		// 1단계 드라이버로더			 // 2단계 디비연결
		con=getConnection();
		// 3단계 sql 
		String sql="delete from board where num=?";
		pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, nb.getId());
		// 4단계 sql문 실행
		pstmt.executeUpdate();
	} catch (Exception e) {
		// 예외가 발생하면 처리하는 구문
		e.printStackTrace();
	}finally {
		// 예외상관없이 마무리작업 구문=> 기억장소 해제
		if(rs!=null) try {rs.close();}catch(SQLException ex) {}
		if(pstmt!=null) try {pstmt.close();}catch(SQLException ex) {}
		if(con!=null) try{con.close();} catch(SQLException ex) {}
	}
}

//getBoardCount()
public static int getBoardCount() {
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	int count=0;
	try {
		// 예외가 발생하것 같은 구문
		// 1단계 드라이버로더			 // 2단계 디비연결
		con=getConnection();
		// 3단계 sql board테이블 
		String sql="select count(*) from board";
		pstmt=con.prepareStatement(sql);
		// 4단계 rs <= 실행 결과 저장
		rs=pstmt.executeQuery();
		// 5단계     
		if(rs.next()) {
				count=rs.getInt("count(*)");
		}
	} catch (Exception e) {
		// 예외가 발생하면 처리하는 구문
		e.printStackTrace();
	}finally {
		// 예외상관없이 마무리작업 구문=> 기억장소 해제
		if(rs!=null) try {rs.close();}catch(SQLException ex) {}
		if(pstmt!=null) try {pstmt.close();}catch(SQLException ex) {}
		if(con!=null) try{con.close();} catch(SQLException ex) {}
	}
	return count;
}

public int update(int id, String title, String content) {
	String sql = "UPDATE noticeBean SET title = ?, content = ?, WHERE id = ?";
	Connection con = null;
	try {
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1,title);
		pstmt.setString(2, content);
		pstmt.setInt(3, id);
		return pstmt.executeUpdate();
	
}catch(Exception e) {
	e.printStackTrace();
}
	return -1;

}
public int delete(int id) {
	String sql = "UPDATE noticeBean SET Available = 0 WHERE id = ?";
	Connection con = null;
	try {
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, id);
		return pstmt.executeUpdate();
		
	}catch(Exception e) {
		e.printStackTrace();
	}
	return -1;
}
}