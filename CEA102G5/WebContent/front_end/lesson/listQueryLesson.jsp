<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List Lesson</title>


</head>
<body>

<style>


.nowPageColor{
	background-color: #B3D9D9;
	color: #000000;
}
#nums, #orderBy{
	display:inline-block;
	width:auto;
	height:auto;
}
#pre, #next, #pageNumBlock{
	visibility:hidden;
}

div.product-grid{
	display:flex;
	flex-direction: row;
	align-items: flex-end;
	flex-wrap:wrap;
}
div.product-item .product-action{
	padding:0;
	height:16px;
}

div.pagination{
	margin:20 auto;
}

div.masonry-item{
	min-height:320px;

}


</style>

<link rel="stylesheet" href="<%= request.getContextPath()%>/resource/jquery-ui-1.12.1/jquery-ui.css">
<script src="<%= request.getContextPath()%>/resource/jquery-ui-1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="<%= request.getContextPath()%>/resource/lesson/js/frontLesson.js"></script>

<jsp:useBean id="lesSvc" class="com.lesson.model.LesService"/>
<jsp:useBean id="coaSvc" class="com.coach.model.CoaService"/>
<jsp:useBean id="talSvc" class="com.talent.model.TalService"/>

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
	<input type="hidden" name="reqUrl" value="<%=request.getServletPath()%>"> 
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

<input type=hidden id=total value=${total}>
<span>每頁筆數</span><select id=nums>
	<c:forEach var="val" begin="6" end="10">
		<option ${(nums == val)?'selected':''} value=${val}>${val}筆</option>
	</c:forEach>
</select>
<span>排序</span>

<select id=orderBy>
	<option ${(orderBy == "LES_DATE")?'selected':''} value="LES_DATE">上課日</option>
	<option ${(orderBy == "LES_ALREADY")?'selected':''} value="LES_ALREADY">報名人數</option>
	<option ${(orderBy == "LES_TIME")?'selected':''} value="LES_TIME">上課時間</option>
	<option ${(orderBy == "LES_PRICE")?'selected':''} value="LES_PRICE">價格</option>
</select>
<hr>


<div class="masonry-grid-post">
</div>

						<div class="pagination">
                            <a class="prev page-numbers" id=pre href="#">Prev</a>
                            <div id=pageNumBlock style="display:inline-block;"></div>
                            <a class="next page-numbers" id=next href="#">Next</a>
                        </div>




<script type="text/javascript">

var contextPath = "${pageContext.request.contextPath}";

var nowPage = ${(not empty page)?page:1};
$("div.masonry-grid-post").on("click",".lesContainer",function(){
	lesInfo($(this).attr("data-lesID"));
});

$("#pageNumBlock").on("click","a",function(){
	nowPage = parseInt($(this).text());
	load();
});

$("#pre").click(function(){
if($(this).text().length > 0){
	nowPage = nowPage-1;
	load();
	}
});
$("#next").click(function(){
if($(this).text().length > 0){
	nowPage = nowPage+1;
	load();
	}
});
$("#nums").change(function(){
	nowPage = 1;
	load();
});

$("#orderBy").change(function(){
	load();
});

$("#LESDATE1").datepicker({
	changeMonth : true,
	changeYear : true,
	dateFormat: "yy-mm-dd",
	maxDate:$("#lesDate").val(),
	onClose: function(selectedDate, inst) { 
		let endDate = new Date(Date.parse(selectedDate));
        endDate.setDate(endDate.getDate() + 1); 
        $("#LESDATE2").datepicker("option", "minDate", endDate); 
	     } 
});
$("#LESDATE2").datepicker({
	changeMonth : true,
	dateFormat: "yy-mm-dd",
	changeYear : true
});


</script>
</body>
</html>