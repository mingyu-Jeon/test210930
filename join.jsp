<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
    <title>ȸ������ ȭ��</title>
 
    <script type="text/javascript">
    
        
        function checkValue()
        {
            if(!document.userInfo.id.value){
                alert("���̵� �Է��ϼ���.");
                return false;
            }
            
            if(!document.userInfo.password.value){
                alert("��й�ȣ�� �Է��ϼ���.");
                return false;
            }
            
           
            if(document.userInfo.password.value != document.userInfo.passwordcheck.value ){
                alert("��й�ȣ�� �����ϰ� �Է��ϼ���.");
                return false;
            }
        }
    </script>
    
</head>
<body>

    <div id="wrap">
        <br><br>
        <b><font size="6" color="gray">ȸ������</font></b>
        <br><br><br>
        
        <form method="post" action="join_ok.jsp" name="userInfo" onsubmit="return checkValue()">
            <table>
                <tr>
                    <td id="title">���̵�</td>
                    <td>
                        <input type="text" name="id" maxlength="50">
                        <input type="button" value="�ߺ�Ȯ��" >    
                    </td>
                </tr>
                        
                <tr>
                    <td id="title">��й�ȣ</td>
                    <td>
                        <input type="password" name="pwd" maxlength="50">
                    </td>
                </tr>
                
                <tr>
                    <td id="title">��й�ȣ Ȯ��</td>
                    <td>
                        <input type="password" name="passwordcheck" maxlength="50">
                    </td>
                </tr>
                    
                    
                <tr>
                    <td id="title">�г���</td>
                    <td>
                        <input type="text" name="nickname">                        
                    </td>
                </tr>
                    
            
                    
                <tr>
                    <td id="title">�̸���</td>
                    <td>
                        <input type="text" name="mail1" maxlength="50">@
                        <select name="mail2">
                            <option>naver.com</option>
                            <option>daum.net</option>
                            <option>gmail.com</option>
                            <option>nate.com</option>                        
                        </select>
                    </td>
                </tr>
                    
           
            </table>
            <br>
            <input type="submit" value="����"/>  <input type="button" value="���">
        </form>
    </div>
</body>
</html>


