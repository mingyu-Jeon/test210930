<%@page import="notice.noticeDAO"%>
<%@page import="notice.noticeBean"%>
<%@page import="java.io.PrintWriter"%>
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
	String userID = null;
	if(session.getAttribute("userID") != null){
		
	}
	if(userID == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('�α����� �ϼ���')");
		script.println("location.href ");
		script.println("/<script>");
	}
	int id = 0;
	if(request.getParameter("id") != null){
		id = Integer.parseInt(request.getParameter("id"));
	}
	if(id == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('��ȿ���� ���� ���Դϴ�')");
		script.println("location.href='noticeList.jsp'");
		script.println("/<script>");
	}
	noticeBean nb = new noticeDAO().getNoticeBean(id);
	
%>
</body>
</html>