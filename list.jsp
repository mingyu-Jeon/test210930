<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	int id =0;
	
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String userid ="c##stock";
	String password="1234";
	Connection conn =DriverManager.getConnection(url, userid, password);

	int num = 0;
	String sql ="select max(num) from board";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
	if(rs.next()){
		num = rs.getInt("max(num)")+1;
	}
	sql = "insert into board(num,name,title,content) values (?,?,?,?)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setInt(1,num);
	pstmt.setString(2,name);
	pstmt.setString(3,title);
	pstmt.setString(4,content);
	pstmt.executeUpdate();
	
	response.sendRedirect("list.jsp");
%>	
</body>
</html>