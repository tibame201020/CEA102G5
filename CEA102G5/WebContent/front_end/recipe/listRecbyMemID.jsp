<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.recipe.model.*"%>
<%@ page import="com.member.model.*"%>


<%
	MemVO memVO = (MemVO) session.getAttribute("memVO");
	RecService recSvc = new RecService();
	List<RecVO> list = recSvc.getRecByMemID(memVO.getMemID());
	pageContext.setAttribute("list",list);
%>
<html>
<head><title>個人食譜主檔 - listAllRec.jsp</title>
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
</style>

	
<table>
	<tr>
		<th>食譜主檔ID</th>
		<th>會員ID</th>
		<th>食譜標題</th>
		<th>食譜圖片</th>
		<th>食譜狀態</th>
		<th>修改食譜</th>
		<th>查看食譜明細</th>
	</tr>  
	<%@ include file="page1.file" %>  
	<c:forEach var="recVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>" >
		<tr class='tabletr'>
			<td>${recVO.recID}</td>
			<td>${recVO.memID}</td>
			<td>${recVO.recName}</td>
			<td><img src="<%=request.getContextPath()%>/ComPicReader${recVO.recPicSrc}&pic=1" height="100" width="100"></td>
			<td class='status' value='${recVO.recStatus}'>${(recVO.recStatus==1)?'審核中':'已生效'}</td>


			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front_end/recipe/rec.do" style="margin-bottom: 0px;">
			    <input type="submit" id='update' value="修改食譜">
			    <input type="hidden" id="recID" name="recID" value="${recVO.recID}">
			    <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>">
			    <input type="hidden" name="action" value="GetOneForUpdateRec">
			    </FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front_end/recipe/rec.do" style="margin-bottom: 0px;">
			    <input type="submit" value="查看食譜明細">
			    <input type="hidden" name="recID"	value="${recVO.recID}">
			    <input type="hidden" name="action" value="GetRecDetail_ByrecID"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>

<script type="text/javascript">
	$(document).ready(function(){
		$(".status").each(function(){
				if($(this).attr("value") == "3"){
					$(this).text("已退回");
				}
				
				if($(this).attr("value") == "0"){
					$(this).text("已下架");
				}
		});
	});

	
	
</script>


</body>
</html>