<%@page import="notice.noticeBean"%>
<%@page import="notice.noticeDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String pageNum = request.getParameter("pageNum");
	int nid = Integer.parseInt(request.getParameter("nid"));
	
	noticeDAO ndao = noticeDAO.getInstance();
	noticeBean nb = ndao.getNotice(nid);
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	 
	int n_id = 0;
	String n_name="", n_title="", n_content="";
	Timestamp n_regDt=null;
	
	n_id = nb.getN_id();
	n_name = nb.getN_name();
	n_title = nb.getN_title();
	n_content = nb.getN_content();
	n_regDt = nb.getN_regDt();
	
%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<center>
		<h1>글 내 용 보 기</h1>
		<table border="1" width="800" cellspacing="0">
			<tr height="30" align="center">
				<td width="100">
					글번호
				</td>
				<td width="200">
					<%= n_id %>
				</td>
			</tr>
			<tr height="30" align="center">
				<td width="100">
					작성자
				</td>
				<td width="200">
					<%= n_name %>
				</td>
				<td width="100">
					작성일
				</td>
				<td width="200">
					<%= sdf.format(n_regDt) %>
				</td>
			</tr>
			<tr height="30">
				<td width="100" align="center">
					글제목
				</td>
				<td colspan="3" width="100">
					<%= n_title %>
				</td>
			</tr>
			<tr height="30">
				<td width="100" align="center">
					글내용
				</td>
				<td colspan="3" width="100">
					<pre>
						<%= n_content %>
					</pre>
				</td>
			</tr>
			<tr height="30">
				<td colspan="4" align="right">
					<input type="button" value="글수정" onclick="location.href='noticeEdit.jsp?n_id=<%= n_id %>&pageNum=<%= pageNum %>'">
					<input type="button" value="글삭제" onclick="location.href='noticeDelete.jsp?n_id=<%= n_id %>&pageNum=<%= pageNum %>'">
					<input type="button" value="답변글" onclick="location.href='noticeWrite.jsp?n_id=<%= n_id %>&pageNum=<%= pageNum %>'">
					<input type="button" value="글목록" onclick="location.href='noticeList.jsp?pageNum=<%= pageNum %>'">
				</td>
			</tr>
		</table>
	</center>
</body>
</html>





