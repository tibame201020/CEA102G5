<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.commodity.model.*"%>

<%
  ComVO comVO = (ComVO) request.getAttribute("comVO"); //EmpServlet.java (Controller) 存入req的empVO物件 (包括幫忙取出的empVO, 也包括輸入資料錯誤時的empVO物件)
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>商品資料修改 - update_com_input.jsp</title>



</head>
<body bgcolor='white'>
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

<h3>商品資料修改:</h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/commodity/com.do" name="form1" enctype="multipart/form-data">
<table>
	<tr>
		<td>商品名稱:</td>
		<td><input type="TEXT" name="comName" size="45" 
			 value="<%=comVO.getComName()%>" /></td>
	</tr>
	<tr>
		<td>商品價格:</td>
		<td><input type="TEXT" name="comPrice" size="45"
			 value="<%=comVO.getComPrice()%>" /></td>
	</tr>
	<tr>
		<td>商品圖片</td>
		<td><input type="file" name="upfile1" id="myFile" /></td>
	</tr>
	<tr>
		<td>商品簡介</td>
		<td><input type="TEXT" name="comContent" size="45"
			 value="<%=comVO.getComContent()%>" /></td>
	</tr>
	<tr>
		<td>商品狀態</td>
		<td><input type="TEXT" name="comStatus" size="45"
			 value="<%=comVO.getComStatus()%>" /></td>
	</tr>
	<tr>
		<td>商品重量</td>
		<td><input type="TEXT" name="comWeight" size="45"
			 value="<%=comVO.getComWeight()%>" /></td>
	</tr>
	<tr>
		<td>商品單位</td>
		<td><input type="TEXT" name="comUnit" size="45"
			 value="<%=comVO.getComUnit()%>" /></td>
	</tr>
	<tr>
		<td>商品熱量</td>
		<td><input type="TEXT" name="comCal" size="45"
			 value="<%=comVO.getComCal()%>" /></td>
	</tr>
	<tr>
		<td>碳水化合物</td>
		<td><input type="TEXT" name="comCarb" size="45"
			 value="<%=comVO.getComCarb()%>" /></td>
	</tr>
	<tr>
		<td>蛋白質</td>
		<td><input type="TEXT" name="comPro" size="45"
			 value="<%=comVO.getComPro()%>" /></td>
	</tr>
	<tr>
		<td>脂質</td>
		<td><input type="TEXT" name="comFat" size="45"
			 value="<%=comVO.getComFat()%>" /></td>
	</tr>
	<tr>
		<td>性質</td>
		<td><input type="TEXT" name="comProp" size="45"
			 value="<%=comVO.getComProp()%>" /></td>
	</tr>
</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="comID" value="<%=comVO.getComID()%>">
<input type="submit" value="送出修改"></FORM>

<script type="text/javascript">
var servletPathName ="${pageContext.request.requestURI}";
</script>
</body>
</html>