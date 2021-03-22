<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.lesson_reservation.model.*"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="lesSvc" scope="page"	class="com.lesson.model.LesService" />

<html>
<head>
<title>報名資料</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js">
</script>
	
	
<style>
table#table-2 {
	background-color: #CCCCFF;
	border: 2px solid black;
	text-align: center;
}

table#table-2 h4 {
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
	width: 800px;
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

#showID {
	color: green;
}
</style>

</head>
<body bgcolor='white'>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>


	<table id="table-2">
		<tr>
			<td>
				<h3>報名資料</h3>
			</td>
		</tr>
	</table>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	

	<table border="1" width="750">
		<tr>
			<th>課程編號<i class="fas fa-air-freshener"></i></th>
			<th>課程名稱<i class="fas fa-running"></i></th>
			<th>課後評價</th>
			<th>課後回覆</th>
			<th>報名狀態</th>
			<th>取消原因</th>
			<th>上課日期</th>
			<th>修改</th>

		</tr>


		<h4 id='showID'></h4>
		<jsp:useBean id="lesrSvc" class="com.lesson_reservation.model.LesrService"></jsp:useBean>
		<c:forEach var="lesrVO" items="${lesrSvc.getLesByMem(sessionScope.memVO.memID)}">
		    
			<tr ${(lesrVO.memID==param.memID) ? 'bgcolor=#CCCCFF':''}>
				<!--將修改的那一筆加入對比色-->
				<td>${lesrVO.lesID}</td>
				<td>${lesSvc.searchOneByID(lesrVO.lesID).lesName}</td>
				<input type='hidden' id='memID' value='${lesrVO.memID}' />
				<td>${lesrVO.lesrComments}</td>
				<td>${lesrVO.lesrAnswer}</td>
				<td>${(lesrVO.lesrStatus=="true"?"正常":"預約取消")}</td>
				<td>${lesrVO.lesrReason}</td>
				<td>${lesSvc.searchOneByID(lesrVO.lesID).lesDate}</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/front_end/lesson.reservation/lesr.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="修改"> <input type="hidden"
							name="les_ID" value="${lesrVO.lesID}"> 
							<input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>">
							<input
							type="hidden" name="mem_ID" value="${lesrVO.memID}"> <input
							type="hidden" name="action" value="getOne">
					</FORM>
				</td>

			</tr>
		</c:forEach>
	</table>

	<script type='text/javascript'>
		$(document).ready(function() {

			var memID = $("#memID").val();
			if (typeof (memID) == "undefined") {
				var str = "您尚無報名課程";
			} else {
				var str = "以下為您的報名資料";
			}
			$("#showID").text(str);

		});
		var servletPathName = "${pageContext.request.requestURI}";
	</script>

</body>
</html>
</html>