<%@page import="notice.noticeBean"%>
<%@page import="notice.noticeDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<body>
   <%
      // noticeDAO ndao ��ü����    
      noticeDAO ndao = new noticeDAO();
      // �Խ��� �۰����� ��� �ִ� �޼ҵ�   getNoticeCount() ȣ��
      int count = ndao.getNoticeCount();
      // ��ȭ�鿡 ������ ������ �� ���� ���� 
      int pageSize = 10;
      // �������� ��ȣ ��������  pageNum �Ķ���� ��������
      String pageNum = request.getParameter("pageNum");
      // �������� ��ȣ�� ������ "1"�������� ����
      if (pageNum == null) {
         pageNum = "1";
      }
      // pageNum => ���������� ����
      int currentPage = Integer.parseInt(pageNum);
      // 10���� �߶� 1������ �����ϴ� ���ȣ ���ϱ�
      //  pageNum(currentPage)    pageSize       =>   startRow�������ȣ  
      //        1                    10          =>   (1-1)*10+1 => 0*10+1 => 0+1  => 1 
      //        2                    10          =>   (2-1)*10+1 => 1*10+1 => 10+1 => 11 
      //        3                    10          =>   (3-1)*10+1 => 2*10+1 => 20+1 => 21
      int startRow = (currentPage - 1) * pageSize + 1;
      // endRow
      //  pageNum(currentPage)    pageSize       =>   endRow�������ȣ  
      //        1                    10          =>   10 
      //        2                    10          =>   20
      //        3                    10          =>   30
      int endRow = currentPage * pageSize;
      //�������� List  getBoardList(�����ϴ����ȣ,�۰���) �����
      // select * from board order by num desc limit �����ϴ����ȣ-1,�۰���
      // List boardList= getBoardList(startRow,pageSize) ȣ��
      List noticeList = ndao.getNoticeList(startRow, pageSize);
   %>
   <h1>��������</h1> <span style="color:red">[ <%=count%> ���� ������ �ֽ��ϴ�.]</span>
   <table border="1">
      <tr>
         <td>��ȣ</td>
         <td>�ۼ���</td>
         <td>������</td>
         <td>�ۼ���</td>
      </tr>
      <%
         for (int i = 0; i < noticeList.size(); i++) {
            noticeBean nb = (noticeBean) noticeList.get(i);
            
      %>
      <tr>
         <td><%=nb.getN_id()%></td>
         <td>
            <a href="noticeView.jsp?num=<%=nb.getN_id()%>"><%=nb.getN_title()%></a>
         </td>
         <td><%=nb.getN_name()%></td>
         <td><%=nb.getN_regDt()%></td>
         
      </tr>
      <%
         }
      %>
   </table>
   <input type="button" value="�����ۼ�" class="btn" onclick="location.href='noticeWrite.jsp'">
   <%
      // ��ü �������� ���ϱ�    
      //          ��ü �� ����    50     ��ȭ�鿡 ������ �۰��� 10  => ��ü�������� 5 + ������������ 0 => 5
      //                     59                      10  =>           5 +      ������ 1 => 6
      int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
      // ��ȭ�鿡 ������ ������ ����
      int pageBlock = 3;
      // ��ȭ�鿡 ������ ���������� ��ȣ ���ϱ�
      // ������ ��ȣcurrentPage      pageBlock    =>   ���������� ��ȣ startPage
      //      1~10                    10       =>    0~9/10*10+1=> 0*10+1=> 0+1  => 1
      //      11~20                   10       =>    10~19/10*10+1=> 1*10+1=> 10+1 => 11
      //      21~30                   10       =>    20~29/10*10+1=> 2*10+1=> 20+1 => 21
      int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
      // ��ȭ�鿡 ������ �������� ��ȣ ���ϱ�
      //   startPage      pageBlock =>  endPage
      //      1               10    =>   1+10-1  =>10 
      //      11              10    =>   11+10-1 =>20
      //      21              10    =>   21+10-1 =>30
      int endPage = startPage + pageBlock - 1;
      //  endPage 10  <=  ��ü �������� 5������
      if (endPage > pageCount) {
         endPage = pageCount;
      }
      // [����]  10������ ����
      if (startPage > pageBlock) {
   %>
   <a href="noticeList.jsp?pageNum=<%=startPage - pageBlock%>">[����]</a>
   <%
      }
      // 1~ 10  11~20   startPage  ~ endPage
      for (int i = startPage; i <= endPage; i++) {
   %>
   <a href="noticeList.jsp?pageNum=<%=i%>"><%=i%></a>
   <%
      }
      //[����] 10������ ����
      if (endPage < pageCount) {
   %>
   <a href="noticeList.jsp?pageNum=<%=startPage + pageBlock%>">[����]</a>
   <%
      }
      
   %>
   
</body>
</html>