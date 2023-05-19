<%@page import="javax.swing.text.Document"%>
<%@page import="javax.xml.crypto.dsig.spec.ExcC14NParameterSpec"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*, my.model.*, my.dao.*, my.util.*, java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Darle - 상품선택</title>
<style type="text/css">
.wrap{
	width: 600px;
	height: auto;
	padding-top: 30px;
}
.search{
	border: 1px solid #ccc;
}
.top{
	width: 600px;
	height: 80px;
}


</style>
</head>
<body>
<!-- width 450 height 430 -->
<div class="wrap">
<table class="search" style="width: 600px; height: 80px;">
	<tr><td><select name="category" style="margin-left: 50px; width: 150px; height: 40px; float: left;">
   		<option value="where pname like ">상품명</option>
	</select></td>
	<td>	<input type="text" name ="keyword" style="width: 255px; height: 40px; float: left;">
	<input type="image" src="search.PNG" width="45px" height="45px" style="float: left;"></td></tr>
</table>
    <%
//	int pid = Integer.parseInt(request.getParameter("pid"));
  	int pid = 1;
  	Connection conn = ConnectionProvider.getConnection();
	Product prod = null;
	List<Product> prodlist = null;
	String target = request.getParameter("target");
	String keyword = request.getParameter("keyword");
	int Cnt = 0;
	try{
  		ProductDao prodDao = new ProductDao();
  		prodlist = prodDao.selectLike(conn, target, keyword);
  		Cnt = prodlist.size();
  	}catch(SQLException e){}
  	finally{
  		JdbcUtil.close(conn);
	}
%>
<div class="top">
총 <%=Cnt %> 개의 상품이 검색되었습니다

</div>

<script type="text/javascript">
function select1(pid){
	window.open("reviewCreate.jsp?pid="+pid);
	window.close();
	alert("?????");
}
</script>
<div class="mid">
<div class="info" style="width:600px; height:70px; border-top: 3px solid #999; border-bottom: 1px solid #999;">
	<span style="width: 140px; float: left; text-align: center; margin-top:25px;">상품이미지</span>
	<span style="width: 350px; float: left; text-align: center; margin-top:25px;">상품정보</span>
	<span style="width: 100px; float: left; text-align: center; margin-top:25px;">선택</span>
</div>

<c:forEach var="p" items="<%=prodlist %>">
	<span style="width: 140px; float: left; text-align: center; margin-top:25px; vertical-align: middle;"><img src="${p.pimage}" width="120px" height="120px"></span>
	<span style="width: 350px; height: 120px; float: left; text-align: left; margin-top:25px; vertical-align: middle;">${p.pname}<br>${p.price }</span>
	<span style="width: 100px; height: 120px; float: left; text-align: center; margin-top:25px; vertical-align: middle;">
		<input type="button" value="선택" onclick="select1(${p.pid})"></span>
</c:forEach>

</div>

</div>
</body>
</html>