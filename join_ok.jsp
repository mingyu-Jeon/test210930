<%@page import="magicwepapp.customDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%> 
    

<%@ page import="magicwepapp.customBean" %>    

 
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
        customBean custom = customBean.getInstance();
    
      
        custom.insertCustom(customBean);
    %>
    
    <div id="wrap">
        <br><br>
        <b><font size="5" color="gray">ȸ������ ������ Ȯ���ϼ���.</font></b>
        <br><br>
        <font color="blue"><%=customBean.getName() %></font>�� ������ ���ϵ帳�ϴ�.
        <br><br>
        
        
        <table>
            <tr>
                <td id="title">���̵�</td>
                <td><%=customBean.getId() %></td>
            </tr>
                        
            <tr>
                <td id="title">��й�ȣ</td>
                <td><%=customBean.getPw() %></td>
            </tr>
                    
            <tr>
                <td id="title">�̸�</td>
                <td><%=customBean.getName() %></td>
            </tr>
                    
            <tr>
                <td id="title">�г���</td>
                <td><%=customBean.getNickname()%></td>
            </tr>
                    
            <tr>
                <td id="title">�������</td>
                <td>
                    <%=customBean.getBirthyy() %>�� 
                    <%=customBean.getBirthmm() %>�� 
                    <%=customBean.getBirthdd() %>��
                </td>
            </tr>
                    
            <tr>
                <td id="title">�̸���</td>
                <td>
                    <%=customBean.getMail1() %>@<%=customBean.getMail2() %>
                </td>
            </tr>
                    
            <tr>
                <td id="title">�޴���ȭ</td>
                <td><%=customBean.getPhone() %></td>
            </tr>
            <tr>
                <td id="title">�ּ�</td>
                <td>
                    <%=customBean.getAddress() %>
                </td>
            </tr>
        </table>
        
        <br>
        <input type="button" value="Ȯ��">
    </div>
</body>
</html>
