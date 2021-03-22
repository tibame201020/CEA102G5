<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.recipe.model.*"%>

<html>
<head><title>所有審核中食譜檢舉 - listAllRecReport.jsp</title>
</head>
<body>
<style>
  table#table-1 {
	background-color:#E8FFE8;
    border: 2px solid black;
    text-align: ;
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
  textarea{
  	resize:none;
  }
</style>

<h2 class="page-title text-center" style='color:black;'>Recipe Report</h2>
			<br> <select id='selectStatus'>
				<option value="0">未審核</option>
                <option value="1">已審核</option>
			</select>
<div id='showRecr'></div>				

<div class="modal fade" id="replyModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h3 class="modal-title" id="exampleModalLabel">回覆該食譜檢舉</h3>
            </div>
            <div class="modal-body">
              <textarea id='msgReport' cols="50" rows="10" placeholder="請輸入回覆"></textarea>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">關閉</button>
              <button type="button" id='msgBtn'>送出回覆</button>
              <input type='hidden' id='msgRecrID' value=''>
            </div>
          </div>
        </div>
      </div>
      
      	<div class="modal fade" id="successModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h3 class="modal-title" id="exampleModalLabel">已成功操作!</h3>
            </div>
            <div class="modal-body">
             <img id = 'successDivImg' src='<%=request.getContextPath()%>/resource/images/success.png' width='100px' height='100px'>
              <font id='successMsg' color='red'></font>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">關閉</button>
            </div>
          </div>
        </div>
      </div>
      
      



<script type="text/javascript">
	$(document).on('show.bs.modal', '.modal', function () {
	  $(this).appendTo('body');
	});
	
	$("#showRecr").on("click",".checkRec",function(){
		let recID = $(this).next().val();
		window.location.href = "<%=request.getContextPath()%>/back_end/recipe/rec.do?action=GetRecDetail_ByrecID&recID="+recID+"";
	});
	
	$("#showRecr").on("click",".updateRec",function(){
		let recID = $(this).parent().prev().children().next().val();
		let btn = $(this);
			$.ajax({
				url:"<%=request.getContextPath()%>/recipe/rec.do",
				type:"post",
				data:{
					action:"updateStatus",
					recID:recID,
					recBonus:"10",
					recStatus:"0",
				},
				dataType:"text",
				context:btn,
				cache:false,
				ifModified:true,
				success:function(){
						$(this).attr("disabled",true);
						$(this).parent().prev().prev().prev().text("已停權");
				}
			});	
		
	});
	
	
	$("#msgBtn").click(function(){

		var msgRecrID = $("#msgRecrID").val();
		var msgReport = $("#msgReport").val();
		if(msgReport.trim() == ''){
			$("#replyModal").modal("hide");
			$("#successDivImg").attr("src","<%=request.getContextPath()%>/resource/images/warning.png");
			$("#successMsg").text("請輸入訊息");
			$("#successModal").modal("show");
			return;
		}
		
		$.ajax({
			url:"<%=request.getContextPath()%>/reciper/recr.do",
			type:"post",
			data:{
				action:"addRecrReply",
				msgRecrID:msgRecrID,
				msgReport:msgReport
			},
			dataType:"text",
			cache:false,
			ifModified:true,
			context:locate,
			success:function(data){
				$(this).text(msgReport);
				$("#msgReport").val('');
				$("#replyModal").modal("hide");
				$("#successDivImg").attr("src","<%=request.getContextPath()%>/resource/images/success.png");
				$("#successMsg").text("已成功送出檢舉");
				$("#successModal").modal("show");
			}
		});
		
		
	});
	var locate;
	$("#showRecr").on("click",".reply",function(){
		locate = $(this).parent().prev().prev().prev();
		var recrIDStr = $(this).next().val();
		$("#msgRecrID").val(recrIDStr);
		$("#replyModal").modal("show");
	});
	
	$("#selectStatus").change(function(){
		var selectStatus = $("#selectStatus").val();
		console.log(selectStatus);
		$.ajax({
			url:"<%=request.getContextPath()%>/reciper/recr.do",
			type:"post",
			data:{
				action:"getAllRecrbyStatus",
				status:selectStatus		
			},
			dataType:"json",
			cache:false,
			ifModified:true,
			success:function(data){
					generateTable(data);
			}
		});
	});
	
	$(document).ready(function(){
		var selectStatus = $("#selectStatus").val();
		$.ajax({
			url:"<%=request.getContextPath()%>/reciper/recr.do",
			type:"post",
			data:{
				action:"getAllRecrbyStatus",
				status:selectStatus		
			},
			dataType:"json",
			cache:false,
			ifModified:true,
			success:function(data){
					generateTable(data);
			}
		});
	});

	
	function generateTable(data){
		if(data == ""){
			var html = "";
			$("#showRecr").html(html);
			return;
		}
		
		var html = "";
		html += "<table><tr><th>食譜主檔ID</th><th>食譜標題</th><th>食譜圖片</th><th>檢舉者ID</th><th>食譜檢舉內容</th><th>食譜審核狀態</th><th>食譜回覆內容</th><th>查看食譜明細</th>";
		if(data[0].recrStatus == '0'){
			html += "<th>下架該食譜</th>";
			html += "<th>回覆食譜檢舉</th></tr>";
		}else{
			html += "</tr>";
		}
		for(let i = 0 ; i<data.length; i++){
			html += "<tr class='tr'><td class='tdrecID'>"+data[i].recID+"</td><td>"+data[i].recName+"</td>";
			html += "<td><img src='<%=request.getContextPath()%>/ComPicReader"+data[i].recPicSrc+"&pic=1' height='100' width='100'></td>";
			html += "<td class='tdmemID'>"+data[i].memID+"</td>";
			html += "<td>"+data[i].recrContent+"</td>";
			if(data[i].recrStatus == '0'){
				html += "<td>未審核</td>";
			}else{
				html += "<td>已審核</td>";
			}
			if(typeof(data[i].recrReplyContent) == 'undefined'){
				html +="<td>暫無回覆</td>";
			}else{
				html += "<td>"+data[i].recrReplyContent+"</td>";				
			} 
			html += "<td><input class='checkRec' type='button' value='查看食譜明細'>";
			html += "<input class='checkRecID' type='hidden' value='"+data[i].recID+"'></td>";
			if(data[i].recrStatus == '0'){
				html += "<td><input class='updateRec' type='button' value='下架該食譜'>";
				html += "<td><input class='reply' type='button' value='回覆食譜檢舉'>";
			}
			html += "<input type='hidden' id='recrID' value='"+data[i].recrID+"'></td></tr>";
		}
		html += "</table>"
		
		$("#showRecr").html(html);
	}
</script>
<script type="text/javascript">
	var servletPathName ="${pageContext.request.requestURI}";
</script>			


</body>

</html>