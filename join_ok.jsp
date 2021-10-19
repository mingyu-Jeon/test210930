<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%> 
    

<%@ page import="magicwepapp.customBean" %>
<%@ page import="magicwepapp.customDBBean" %>    

 
<html>
<head>
    <title>회원가입 처리 JSP</title>
    
   
</head>
<body>
    
    <% 
        
        request.setCharacterEncoding("euc-kr"); 
    %>
    
    
    <jsp:useBean id="customBean" class="magicwepapp.customBean" />
    <jsp:setProperty property="*" name="customBean"/>    
       
   <%
   request.setCharacterEncoding("utf-8");// request 한글처리
   // request 저장된 파라미터 값 가져와서 => 변수에 저장
   String id=request.getParameter("id");
   String pwd=request.getParameter("pwd");
   String nickname=request.getParameter("nickname");
   String mail1=request.getParameter("mail1");
   String mail2=request.getParameter("mail2");
   Timestamp reg=new Timestamp(System.currentTimeMillis());
   // 패키지 magicwepapp 파일이름 custocbean
   // 파라미터값을 저장하는 변수 만들고 set,get메서드 만들기
   // custocbean cb 객체생성 => 기억장소 만들기
   customBean cb = new customBean();
   // cb에 <= 파라미터값 저장
   cb.setId(id);
   cb.setPwd(pwd);
   cb.setEmail(mail1+"@"+mail2);
   cb.setNickname(nickname);
   cb.setReg(reg);
   
   customDBBean custom = customDBBean.getInstance();
   custom.insertCustom(cb);
   
   
    %>
   
 <script type="text/javascript">
 // "회원가입성공" login.jsp 이동
   alert("회원가입성공")
   location.href="login.jsp"; // <<<< 회원가입 완료 후 이동 할 페이지
</script>
</body>
</html>