<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Darle - 로그아웃</title>
</head>
<body onload="logout()">
<%
	session.removeAttribute("LOGINID");
%>
<script type="text/javascript">
function logout(){
	alert("로그아웃 되었습니다.");
	location.href="/team_file/Main/main.jsp";
}
</script>
</body>
</html>