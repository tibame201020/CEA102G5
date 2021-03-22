<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lesson Info</title>


</head>
<body>

<style>
.lessonContainer{
	display: flex;
	width: 500px;
	flex-direction: row;
	flex-wrap:wrap;
	justify-content:space-between;
}
.actionContainer{
	display: flex;
	flex-direction: row-reverse;
	flex-wrap:wrap;
	justify-content:space-between;
}


</style>

<div style='display:none;'>

<form id=lessonQueryFront METHOD="post" ACTION="<%=request.getContextPath()%>/front_end/lesson/les.do">

<div style="display:inline-block;">
<label for="coaVO">教練</label><br>
	<select name=COA_ID id=coaVO style=width:130px;>
		<option selected="selected" value=''></option>
		<c:forEach var="coaVO" items="${coaSvc.normal}">
			<option value = "${coaVO.coaID}">${coaVO.coaName}</option>
		</c:forEach>
</select>
</div>
<div style="display:inline-block;">
<label for="talVO">專長</label><br>
	<select name=TAL_ID id=talVO style=width:130px;>
		<option selected="selected" value=''></option>
		<c:forEach var="talVO" items="${talSvc.all}">
			<option value = "${talVO.talID}">${talVO.talName}</option>
		</c:forEach>
</select>
</div>
<div style="display:inline-block;">
	<label for="LES_Name">課程名稱</label><br>
	<input type=text id=LES_Name name=LES_NAME>
</div>
<div style="display:inline-block;">
	<input type="hidden" name="reqUrl" value="/front_end/lesson/listQueryLesson.jsp"> 
	<input type="hidden" name="action" value="search"> 
	<input type=submit value=查詢>
</div>


<hr>
<div style="display:inline-block;">
<fieldset style="width:420px;height:40px;">
<legend>日期</legend>
<div style="display:inline-block;">
	<input placeholder="ex:2020-09-02" autocomplete="off" type=text id=LESDATE1 name=LES_DATE> - <input autocomplete="off" type=text id=LESDATE2 name=LES_DATE>
</div>
<div style="display:inline-block;">
	<input type=submit value=查詢>
</div>
</fieldset><span style="color:red">${errorMsgs.LES_DATE}</span>
</div>
<div style="display:inline-block;">
<fieldset style="width:420px;height:40px;">
<legend>價格</legend>
<div style="display:inline-block;">
	<input placeholder="最低" type=number id=LES_Price1 name=LES_PRICE> - 
	<input placeholder="最高" type=number id=LES_Price2 name=LES_PRICE>
</div>
<div style="display:inline-block;">
	<input type=submit value=查詢>
</div>
</fieldset>
</div>
</form>

</div>



<h1>${lesVO.lesName}</h1>
<div class=lessonContainer>
<div class=videoContainer>
		<video controls autoplay muted loop type="video/mp4" width="500">
			<source src="<%= request.getContextPath()%>${lesVO.video}"/>
		</video>
	</div>
	<div class=infoContainer>
		<table>
			<tr><th>教練</th><td><a href="<%=request.getContextPath()%>/front_end/lesson/listOneCoach.jsp?coaID=${lesVO.coaID}">${lesVO.coaName}</a></td></tr>
			<tr><th>專長</th><td>${lesVO.talName}</td></tr>
			<tr><th>價格</th><td>${lesVO.lesPrice}</td></tr>
			<tr><th>上課時間</th><td>${lesVO.lesDate}-${lesVO.lesTime}</td></tr>
			<tr><th>報名時間</th><td>${lesVO.lesBegin}-${lesVO.lesEnd}</td></tr>
			<tr><th>剩餘名額</th><td>${(lesVO.lesAvailable-lesVO.lesAlready)}</td></tr>
		</table>
	</div>
	<div class=picContainer>
		<img src="<%= request.getContextPath()%>${lesVO.pic}" width="200">
	</div>
	<div class=actionContainer>
	       
		
		
			<input type="hidden" name="les_ID" value="${lesVO.lesID}">		
		    <input type="hidden" name="mem_ID" value="${sessionScope.memVO.memID}">		     
		    <c:if test="${empty sessionScope.memVO}">
		        <input type ="button" onclick="javascript:location.href='http://localhost:8081/CEA102G5/front_end/member/login.jsp'" value="報名"></input>
		   	 	<input id ="favorite" type="button" value="收藏">
		   	</c:if>
		    
		    <c:if test="${!empty sessionScope.memVO}">
		    <form METHOD="post" ACTION="<%=request.getContextPath()%>/front_end/lesson.reservation/lesr.do">
		    <jsp:useBean id="lesrSvc" class="com.lesson_reservation.model.LesrService"></jsp:useBean>
		    <input type="hidden" name="les_ID" value="${lesVO.lesID}">		
		    <input type="hidden" name="mem_ID" value="${sessionScope.memVO.memID}">	
			<input type="hidden" name="action" value="insert"> 
			<input id="apply" type="submit" value= ${lesrSvc.search(sessionScope.memVO.memID,lesVO.lesID)?"已報名":"報名"}>
		</form>
		    <jsp:useBean id="lesfSvc" class="com.lesson_favorites.model.LesfService"></jsp:useBean>
		    	<input id ="favorite" type="button" value= ${lesfSvc.search(sessionScope.memVO.memID,lesVO.lesID)?"已收藏":"收藏"}>
		    </c:if>	    

	</div>
</div>

<script>
<c:if test="${!empty lesVO}">
	lesID = ${lesVO.lesID};
</c:if>

if($("#favorite").val()=="已收藏"){
	 $("#favorite").attr("disabled","true");
}

$("#favorite").on("click",function(){
	if(memID== -1){		
		window.location.href="<%=request.getContextPath()%>/front_end/member/login.jsp";
	}else{
	$.ajax({
		url:"<%=request.getContextPath()%>/front_end/lesson.favorites/lesf.do",
		type:"POST",
		data:{
			action:"insert",
			memID:memID,
			lesID:lesID,			
		},
		cache:false,
		ifModified:true,
		success:function(){
		  $("#favorite").val("已收藏");
		  $("#favorite").attr("disabled","true");
		}
	});
	}
	
});

if($("#apply").val()=="已報名"){
	 $("#apply").attr("disabled","true");
}
$("#apply").on("click",function(){
	if(memID== -1)
		window.location.href="<%=request.getContextPath()%>/front_end/member/login.jsp";		
});
</script>


</body>
</html>