<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.admin_info.model.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin List</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
	th{
	text-align:right;}

</style>
</head>


<body>
	
		<h3>管理員列表</h3>
<jsp:useBean id="admiSvc" class="com.admin_info.model.AdmiService"/>
			
	<table class="table">
	
	<tr>
		<th>編號</th>
		<th>姓名</th>
		<th>帳號</th>
		<th>密碼</th>
		<th>狀態</th>
		<th>日期</th>
		<th colspan=2>編輯</th>
	</tr>
	
<c:forEach var="admiVO" items="${admiSvc.all}">
	
	<tr class="admin">
		<td class="admID" style="background-color:${admiVO.admStatus ==true?"white":"#9D9D9D"};color:${admiVO.admStatus ==true?"black":"white"}" >${admiVO.admID}</td>
		<td style="background-color:${admiVO.admStatus ==true?"white":"#9D9D9D"};color:${admiVO.admStatus ==true?"black":"white"}">${admiVO.admName}</td>
		<td style="background-color:${admiVO.admStatus ==true?"white":"#9D9D9D"};color:${admiVO.admStatus ==true?"black":"white"}">${admiVO.admAccount}</td>
		<td style="background-color:${admiVO.admStatus ==true?"white":"#9D9D9D"};color:${admiVO.admStatus ==true?"black":"white"}">${admiVO.admPassword}</td>
		<td class="status" style="background-color:${admiVO.admStatus ==true?"white":"#9D9D9D"};color:${admiVO.admStatus ==true?"black":"white"}">${admiVO.admStatus ==true?"在職":"離職"}</td>
		<td style="background-color:${admiVO.admStatus ==true?"white":"#9D9D9D"};color:${admiVO.admStatus ==true?"black":"white"}">${admiVO.admTime}</td>
		
     	<td style="background-color:${admiVO.admStatus ==true?"white":"#9D9D9D"}">
    		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/admin_info/admi.do">
    			<input type="hidden" name=admID value=${admiVO.admID}>
    			<input type="hidden" name=action value=forUpdate>
   				<input class="cc" type=submit value="修改" ${admiVO.admStatus ==true?"":"hidden"}>
    		</FORM>
    	</td>
    	<td style="background-color:${admiVO.admStatus ==true?"white":"#9D9D9D"};color:${admiVO.admStatus ==true?"black":"white"}">
			<button type="button" class="change" style="background-color:${admiVO.admStatus ==true?"#AE0000":"#9D9D9D"};color:${admiVO.admStatus ==true?"":"white"};border-color:${admiVO.admStatus ==true?"#AE0000":"#9D9D9D"}">${admiVO.admStatus ==true?"刪除":"離職"}</button>
    		<input id='hID' type="hidden"  value="">
    	</td>
   	</tr>
</c:forEach>

</table>

		
		
<script type="text/javascript">

	var locate;
$('.change').click(function(){
	
	locate = $(this).parent().prev().prev().prev();
	var admID =$(this).parents("tr.admin").children("td.admID").text();
		
	console.log(admID);
	console.log(locate);
	
	
	$("#hID").val(admID);
	
	
	$.ajax({
		
		url:"<%=request.getContextPath()%>/admin_info/admi.do",
		type:"POST",
		data:{
			action:"delete",
			admID: admID,
			
		},
		dataType:"text",
		context:locate,
		success:function(data){	
				
			$(this).text("離職");
			$(this).next().next().next().children().text("離職").css({"background-color":"#9D9D9D	","border-color":"#9D9D9D	"});
			c =$(this).next().next().children().children("input.cc");
			console.log(c);
			
			$(c).attr("disabled",true).css({"background-color":"#9D9D9D	"}).hide();
			$(this).parents("tr.admin").children().css({"background-color":"#9D9D9D	","color":"white"});
			
			
		}
		
				
	});
	
});



var servletPathName ="${pageContext.request.requestURI}";
</script>



</body>
</html>