<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.lesson_reservation.model.*"%>
<jsp:useBean id="lesSvc" scope="page"	class="com.lesson.model.LesService" />

<%
	LesrVO lesrVO = (LesrVO) request.getAttribute("lesrVO"); //EmpServlet.java (Concroller) 存入req的empVO物件 (包括幫忙取出的empVO, 也包括輸入資料錯誤時的empVO物件)
	if (lesrVO == null) {                                           
	      response.sendRedirect(request.getContextPath()+"/front_end/reservation/searchReservation.jsp");
	      return;
	    }
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>預約資料修改 </title>

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
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
}

table, th, td {
	border: 0px solid #CCCCFF;
}

th, td {
	padding: 1px;
}
</style>

</head>
<body bgcolor='white'>

	<h3>填寫資料</h3>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post"
		ACTION="<%=request.getContextPath()%>/front_end/lesson.reservation/lesr.do"
		name="form1">
		<table>
			<tr>
				<td>課程編號:</td>
				<td><%=lesrVO.getLesID()%></td>
			</tr>
			<tr>
				<td>課程名稱:</td>
				<td>${lesSvc.searchOneByID(lesrVO.lesID).lesName}</td>
			</tr>		
			<tr>
				<td>課程評論:</td>
				<td><input type="TEXT" name="lesr_comments" size="45"
					value="<%=lesrVO.getLesrComments()%>" /></td>
			</tr>

			<tr>
				<td>課後回覆:</td>
				<td><%=lesrVO.getLesrAnswer()%></td>
			</tr>
			<tr>

				<td>預約狀態:</td>
				<td><select name="lesr_status"
					value="<%=lesrVO.getLesrStatus()%>">
						<option value="true">預約</option>
						<option value="false">取消</option>
				</select></td>

			</tr>
			<tr>
				<td>取消原因:</td>
				<td><input type="TEXT" name="lesr_reason" size="45"
					value="<%=lesrVO.getLesrReason()%>" /></td>
			</tr>

			<tr>
				<td>上課日期:</td>
				<td>${lesSvc.searchOneByID(lesrVO.lesID).lesDate}</td>
			</tr>


		</table>
		<br> <input type="hidden" name="action" value="updateOne"> 
		<input	type="hidden" name="les_ID" value="<%=lesrVO.getLesID()%>">  
		<input	type="hidden" name="mem_ID" value="<%=lesrVO.getMemID()%>"> 
		<input	type="hidden" name="lesr_answer" value="<%=lesrVO.getLesrAnswer()%>">
		<input	type="hidden" name="lesr_time" value="<%=lesrVO.getLesrTime()%>">
		
		<!--接收原送出修改的來源網頁路徑後,再送給Controller準備轉交之用-->
		<input type="submit" value="送出">
	</FORM>
	<script type="text/javascript">
		var servletPathName = "${pageContext.request.requestURI}";
	</script>

</body>

</html>