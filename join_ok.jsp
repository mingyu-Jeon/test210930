<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%> 
    

<%@ page import="magicwepapp.customBean" %>
<%@ page import="magicwepapp.customDBBean" %>    

 
<html>
<head>
    <title>ȸ������ ó�� JSP</title>
    
   
</head>
<body>
    
    <% 
        
        request.setCharacterEncoding("euc-kr"); 
    %>
    
    
    <jsp:useBean id="customBean" class="magicwepapp.customBean" />
    <jsp:setProperty property="*" name="customBean"/>    
       
   <%
   request.setCharacterEncoding("utf-8");// request �ѱ�ó��
   // request ����� �Ķ���� �� �����ͼ� => ������ ����
   String id=request.getParameter("id");
   String pwd=request.getParameter("pwd");
   String nickname=request.getParameter("nickname");
   String mail1=request.getParameter("mail1");
   String mail2=request.getParameter("mail2");
   Timestamp reg=new Timestamp(System.currentTimeMillis());
   // ��Ű�� magicwepapp �����̸� custocbean
   // �Ķ���Ͱ��� �����ϴ� ���� ����� set,get�޼��� �����
   // custocbean cb ��ü���� => ������ �����
   customBean cb = new customBean();
   // cb�� <= �Ķ���Ͱ� ����
   cb.setId(id);
   cb.setPwd(pwd);
   cb.setEmail(mail1+"@"+mail2);
   cb.setNickname(nickname);
   cb.setReg(reg);
   
   customDBBean custom = customDBBean.getInstance();
   custom.insertCustom(cb);
   
   
    %>
   
 <script type="text/javascript">
 // "ȸ�����Լ���" login.jsp �̵�
   alert("ȸ�����Լ���")
   location.href="login.jsp"; // <<<< ȸ������ �Ϸ� �� �̵� �� ������
</script>
</body>
</html>