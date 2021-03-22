<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
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
	width: 600px; 
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

    <div id="header">
        <label>
        	<b>按商品關鍵字搜尋: </b>
        	<input type="text" id="search"  style="font-size:16px" size="25" placeholder="請輸入食材關鍵字:(例如:牛)">
        </label>&nbsp; &nbsp;
        <jsp:useBean id="comcSvc" scope="page" class="com.commodity_category.model.ComcService"/>
        
        <label>
	        <b>按分類搜尋:</b>
	        <select size="1" name="comcID" id="comcID" onchange="getCombyCategory()">
	        <option selected="selected" disabled="disabled"  style='display: none' value=''></option>
	        	<c:forEach var="comcVO" items="${comcSvc.all}">
  					<option value="${comcVO.comcID}">${comcVO.comcName}
  			</c:forEach>
	        </select>
        </label>
    </div>
    
    
        <div id="ingredients"></div>
    

<script type="text/javascript">

	

	$("#ingredients").on("click","#confirm",function(){
		//將checkbox選中的值存入一個陣列
		var checkArr = new Array();
		$("input[name='checkComID']:checked").each(function(){
			checkArr.push($(this).val());
		});
		console.log(checkArr);
		
		var checkedArr = new Array();
		$("input[name='alreadyChecked']").each(function(){
			checkedArr.push($(this).val());
		});
		console.log("已選的為"+checkedArr);
		
		$.ajax({
			url:"<%=request.getContextPath()%>/recipe/rec.do",
			type:"POST",
			data:{
				action:"getComifChecked",
				checkComID: checkArr,
				checkedComID:checkedArr
			},
			dataType : "json",
			traditional: true,
			cache:false,
			ifModified:true,
			success:function(data){
				 var aChecked = $("input[name='alreadyChecked']").val();
				 if(typeof(aChecked)=='undefined'){
					 generateIngTable(data);
					 calculate();
				 }else{
					 var html = '';
					 for(let i = 0 ;i<data.length;i++){
						 html += "<tr>";
							html += "<input type='hidden' name='alreadyChecked' value='"+data[i].comID +"'>";
							html += "<td>"+data[i].comName+"</td>";
							html += "<td class='cal'>"+ data[i].comCal +"</td>";
							html += "<td class='carb'>"+data[i].comCarb+"</td>";
							html += "<td class='pro'>"+data[i].comPro+"</td>";
							html += "<td class='fat'>"+data[i].comFat+"</td>";
							html += "<td><input type='text' class = 'ingNums' name='ingNums' style='width:150px' placeholder='請輸入食材克數' ></td>";
							html += "<td><img class='ingredientsRemove' src='<%=request.getContextPath()%>/resource/images/trash.png'></td>";
							html +="</tr>";	
					 }
					 $("#ingTable").append(html);
				 }
				 
				 
			}
			
		});	
		
	});
	
	function generateIngTable(data){
		console.log(data[0].comName);
		var html = "";
		html += "<table id='ingTable'><tr><td>食材名稱</td><td>食材熱量</td><td>食材碳水化合物</td><td>食材蛋白質</td><td>食材脂質</td><td></td><td></td></tr>";
		for(let i = 0; i<data.length; i++){
			html += "<tr>";
			html += "<input type='hidden' name='alreadyChecked' value='"+data[i].comID +"'>";
			html += "<td>"+data[i].comName+"</td>";
			html += "<td class='cal'>"+ data[i].comCal +"</td>";
			html += "<td class='carb'>"+data[i].comCarb+"</td>";
			html += "<td class='pro'>"+data[i].comPro+"</td>";
			html += "<td class='fat'>"+data[i].comFat+"</td>";
			html += "<td><input type='text' class = 'ingNums' name='ingNums' style='width:150px' placeholder='請輸入食材克數' ></td>";
			html += "<td><img class='ingredientsRemove' src='<%=request.getContextPath()%>/resource/images/trash.png'></td>";
			html +="</tr>";	
		}
		html +="</table>";
		$("#showIngredient").html(html);
		
	}
	
	$("#search").keyup(function(){
		
		clearTimeout($(this).data('timer'));
		
		var timer = setTimeout(function(){
			getCombycomName();
		},500);
		
		$(this).data('timer',timer);
		
	});
	
	function getCombycomName(){
		var searchText = $("#search").val();
// 		console.log(searchText);

		$.ajax({
			url:"<%=request.getContextPath()%>/commodity/com.do",
			type:"POST",
			data:{
				action:"listComByName",
				searchText : searchText,
				columnName : "COM_NAME"
			},
			dataType:"json",
			cache:false,
			ifModified:true,
			success:function(data){
				
				if(data==0){
					var html = "";
					html += "<h1><font face='verdana' color='red'>查無資料</font></h1>";
					$("#ingredients").html(html);
				}else{
					generateTable(data);
					
				}
			}
			
		});
	}
	
	function getCombyCategory(){
// 		var comcID = $("#comcID").find("option:selected").text(); 抓取文字

		var comcID = $("#comcID").val();
// 		console.log(comcID);
		
		$.ajax({
			url:"<%=request.getContextPath()%>/commodity_category/comc.do",
			type:"POST",
			data:{
				action:"listComforRec",
				comcID:comcID
			},
			dataType:"json",
			cache:false,
			ifModified:true,
			success:function(data){
				generateTable(data);
			}
			
		});
		
	}
	
	function generateTable(data){
		var html = "";
		html = "<input type='button' id='confirm' data-dismiss='modal' value='確認帶回'>";
		html+="<table><tr><td>勾選食材</td><td>食材名稱</td><td>食材圖片</td></tr>";
		for(let i = 0;i<data.length;i++){
			html+="<tr><td><input type='checkbox' name='checkComID' value='"+data[i].comID+"'></td>";
			html+="<td>"+data[i].comName+"</td>";
			html+="<td><img src = '<%=request.getContextPath()%>/ComPicReader"+ data[i].comPicSrc +"&pic=1' height='100' width='100'></td></tr>";
		}
		html+="</table>";
		
		$("#ingredients").html(html);
	}


</script>
    


</html>