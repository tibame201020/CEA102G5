<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ page import="com.member.model.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
	MemService memSvc = new MemService();
	List<MemVO> list = memSvc.getAll();
	pageContext.setAttribute("list", list);
%>


<head>
<title>會員資料</title>



</head>
<body>
<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
  table {
	width: 1000px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>


<table>
	<tr>
		<th>會員編號</th>
		<th>會員名稱</th>
		<th>會員圖片</th>
		<th>會員帳號</th>
		<th>會員密碼</th>
		<th>會員電話</th>
		<th>會員EMAIL</th>
		<th>會員積分</th>
		<th>會員狀態</th>
		<th>會員創建日期</th>
	</tr>
	<%@ include file="page1.file" %>
	<c:forEach var="memVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1 %>">
	<tr>
			<td>${memVO.memID}</td>
			<td>${memVO.memName}</td>
			<td><img src="<%=request.getContextPath() %>/ComPicReader${memVO.memPicSrc}&pic=1" height="100" width="100"></td>
			<td>${memVO.memAccount}</td>
			<td>${memVO.memPassword}</td>
			<td>${memVO.memPhone}</td>
			<td>${memVO.memEmail}</td>
			<td>${memVO.memBonus}</td>
			<td>${memVO.memStatus}</td>
			<td>${memVO.memTime}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/member/mem.do" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="memID"  value="${memVO.memID}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/member/mem.do" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="memID"  value="${memVO.memID}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
	</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>
<script type="text/javascript">
var servletPathName ="${pageContext.request.requestURI}";
</script>
</body>
</html>