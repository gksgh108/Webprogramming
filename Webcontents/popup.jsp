<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Darle - Welcome</title>
</head>
<body>
<div class="popup">
<img src="/team_file/image/popup.png" width="100%" height="100%">
<input type="button" id="closed" value="닫기" style="float: right; height: 40px; width: 50px; margin-top:10px;" onclick="closed()">
<!-- 
<input type="button" id="closeDay" value="다시 보지 않기" style="float: right; height: 40px; width: 150px; margin-right: 10px;" onclick="closeDay()">
 -->
 </div>
<%--
	session.setAttribute("popup1", "0");
--%>
<script type="text/javascript">
function closed(){
	window.close();
}
function closeDay(){
	window.close();
}
</script>
</body>
</html>