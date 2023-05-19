<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.util.*,my.dao.*,my.model.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Darle - 장바구니삭제</title>
</head>
<body>
<%
	String a = request.getParameter("cartdeleteAll");
	if(a != null && a.equals("Y")){
		Integer pCount=(Integer)session.getAttribute("pCount");
		for(int i=1; i<= pCount.intValue(); i++) {
			if(session.getAttribute("p"+i) != null){
				session.removeAttribute("p"+i);
			}
		}
	} else {
		String pid = request.getParameter("pid");
		out.println(pid);
		session.removeAttribute("p"+pid);
		out.println(session.getAttribute(pid));
		
		
	}
%>
<script>
location.href="cart.jsp";
</script>
</body>
</html>