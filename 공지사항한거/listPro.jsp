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
Class.forName("com.mysql.jdbc.Driver");
String url ="jdbc:oracle:thin:@localhost:1521:xe";
String userid ="C##stock";
String password="1234";
Connection conn =DriverManager.getConnection(url, userid, password);
String sql ="select * from board";
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();
%>
<table border="1">
<tr><td>����</td></tr>
<tr><td>�ۼ���</td></tr>
<tr><td>����</td></tr>
<tr><td>����</td></tr>
<%
while(rs.next()){
%>
<tr><td><%= rs.getInt("num") %></td>
<td><%= rs.getString("title") %></td>
<td><%= rs.getString("name") %></td>
<td><%= rs.getString("content") %></td></tr><% 
}
%>
</table>
</body>
</html>