<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%response.setHeader("Refresh", "1;URL=/CEA102G5/front_end/member/listOmbyMemID.jsp"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <meta http-equiv="refresh" content="3;url=http://www.google.com"> -->
<title>Insert title here</title>
</head>
<body style="text-align:center; vertical-align:center;">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<div style="margin-top:200px;">
		<img src="<%=request.getContextPath()%>/resource/images/success.png" style="width:100px; height:100px;">
		<span style="font-size:xx-large;">付款成功! 感謝您的購買 </span><br> 
		<span id='second' style="font-size:xx-large;">1</span> 
		<span style="font-size:xx-large;">秒後跳轉</span>
	</div>
	
	<script type="text/javascript">
	</script>
</body>
</html>