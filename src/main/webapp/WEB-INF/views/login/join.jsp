<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
    <title>Join</title>
    <script src="/resource/js/authentication.js"></script>
    <style>
        #wrap{
            width:530px;
            margin-left:auto; 
            margin-right:auto;
            text-align:center;
        }
        
        table{
            border:3px solid black
        }
        
        td{
            border:1px solid black
        }
        
        #title{
            background-color:white
        }
    </style>
</head>
<body>

    <div id="wrap">
        <br><br>
        <b><font size="6" color="gray">SingHere</font></b>
        <br><br><br>
        
        <form action = "/join" method = "post">
            <table>
                <tr>
                    <td id="title">회사코드</td>
                    <td>
                        <input type="text" name="cmCode">
                        <input type="button" value="중복확인" >    
                    </td>
                </tr>
                        
                <tr>
                    <td id="title"> 회사이름 </td>
                    <td>
                        <input type="text" name="cmname">
                    </td>
                </tr>
                
                <tr>
                    <td id="title"> 아이디 </td>
                    <td>
                        <input type="text" name="userId" >
                      <input type="button" value="중복확인" > 
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">이름</td>
                    <td>
                        <input type="text" name="userName" >
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">비밀번호</td>
                    <td>
                        <input type="password" name="userPwd" >
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">비밀번호 확인</td>
                    <td>
                        <input type="password" name="confrim" >
 
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">이메일</td>
                    <td>
                        <input type="text" name="userEmail" >@
                        <select name="email_2">
                            <option>naver.com</option>
                            <option>daum.net</option>
                            <option>gmail.com</option>
                            <option>nate.com</option>                        
                        </select>
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">직급</td>
                    <td>
                        <input type="text" name="grCode" />
                    </td>
                </tr>
                <tr>
                    <td id="title">직책</td>
                    <td>
                        <input type="text"  name="grDetail"/>
                    </td>
                </tr>
            </table>
            <br>
            <input type="submit" value="확인"  onClick="/join"/>  <input type="button" value="취소">
        </form>
       
    </div>
</body>
</html>