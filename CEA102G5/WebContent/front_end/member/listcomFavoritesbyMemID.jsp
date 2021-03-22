<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.commodity.model.*"%>
<%@ page import="com.member.model.*"%>

<%
MemVO memVO = (MemVO) session.getAttribute("memVO"); 
int memID = memVO.getMemID();
ComService comSvc =new ComService();
List list = comSvc.getFavorite(memID);
pageContext.setAttribute("list",list);
%>

<html>
<head><title>訂單明細 - listOd_ByOmID.jsp</title>
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 <link rel="stylesheet" href="<%=request.getContextPath() %>/resource/css/lightbox.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>



<body bgcolor=#E8FFE8>
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

	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
  }
  textarea{
  	resize:none;
  }
</style>
<h2 class="page-title text-center" style='color:black;'>Order Detail</h2>

	


<table>
	<tr>
		<th>商品編號</th>
		<th>商品類別</th>
		<th>商品名稱</th>
		<th>商品價格</th>
		<th>商品圖片</th>
<!-- 		<th>商品圖片2</th> -->
		<th>商品簡介</th>
		<th>商品狀態</th>
		<th>商品重量</th>
		<th>商品單位</th>
		<th>商品熱量(cal)</th>
		<th>商品碳水(g)</th>
		<th>商品蛋白質(g)</th>
		<th>商品脂肪(g)</th>
		<th>商品特性</th>
		<th>商品銷量</th>
		<th>商品創建時間</th>
		
		
	</tr>

	<c:forEach var="comVO" items="${list}">
		
		<tr>
			<td>${comVO.comID}</td>
			<td>
			<c:forEach var="comcVO" items="${comcSvc.all}">
                    <c:if test="${comVO.comcID==comcVO.comcID}">
	                   ${comcVO.comcName}
                    </c:if>
                </c:forEach>
			</td>
			<td>${comVO.comName}</td>
			<td>$ ${comVO.comPrice}</td>
			<td><img src = "<%=request.getContextPath()%>/ComPicReader${comVO.comPicSrc}&pic=1" height="100" width="100"></td>
<%-- 			<td><img src = "<%=request.getContextPath()%>/ComPicReader${comVO.comPicSrc}&pic=2" height="100" width="100"></td> --%>
			<td>${comVO.comContent}</td>
			<td>
			<c:if test="${comVO.comStatus==1}">
				下架
			</c:if>
			<c:if test="${comVO.comStatus==0}">
				上架
			</c:if>
			</td>
			<td>${comVO.comWeight}</td>
			<td>${comVO.comUnit}</td>
			<td>${comVO.comCal}</td>
			<td>${comVO.comCarb}</td>
			<td>${comVO.comPro}</td>
			<td>${comVO.comFat}</td>
			<td>${comVO.comProp}</td>
			<td>${comVO.comSales}</td>
			<td>${comVO.comTime}</td>
<!-- 			<td> -->
<%-- 			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/commodity/com.do" style="margin-bottom: 0px;"> --%>
<!-- 			     <input type="submit" value="修改"> -->
<%-- 			     <input type="hidden" name="comID"  value="${comVO.comID}"> --%>
<%-- 			     <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--送出本網頁的路徑給Controller--> --%>
<!-- 			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM> -->
<!-- 			</td> -->
<!-- 			<td> -->
<%-- 			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/commodity/com.do" style="margin-bottom: 0px;"> --%>
<%-- 			     <input type="submit" value="${(comVO.comStatus==0)?"下架":"上架" }"> --%>
<%-- 			     <input type="hidden" name="comID"  value="${comVO.comID}"> --%>
<%-- 			     <input type="hidden" name="comName"  value="${comVO.comName}"> --%>
<%-- 			     <input type="hidden" name="comStatus"  value="${comVO.comStatus}"> --%>
<%-- 			     <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--送出本網頁的路徑給Controller--> --%>
<!-- 			     <input type="hidden" name="action" value="comStatusChange"></FORM> -->
<!-- 			</td> -->
		</tr>
	</c:forEach>
</table>


<div class="modal fade" id="msgTextDiv" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title" id="exampleModalLongTitle">會員評價</h3>
        </button>
      </div>
      <div class="modal-body">
      <div>
        <img class='star' id='star1' src="<%=request.getContextPath()%>/resource/images/starempty.png" alt="" width="30px" height="30px">
        <img class='star' id='star2' src="<%=request.getContextPath()%>/resource/images/starempty.png" alt="" width="30px" height="30px">
        <img class='star' id='star3' src="<%=request.getContextPath()%>/resource/images/starempty.png" alt="" width="30px" height="30px">
        <img class='star' id='star4' src="<%=request.getContextPath()%>/resource/images/starempty.png" alt="" width="30px" height="30px">
        <img class='star' id='star5' src="<%=request.getContextPath()%>/resource/images/starempty.png" alt="" width="30px" height="30px">
        <input id='score' name='score' type="hidden" value="">
    </div>
        <textarea id='msgText' cols="60" rows="10" placeholder="請輸入評價"></textarea>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button class='submitbtn' type="button" class="btn btn-primary">送出回覆</button>
        <input type='hidden' id='omIDforMsg' value=''>
        <input type='hidden' id='comIDforMsg' value=''>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
var servletPathName ="${pageContext.request.requestURI}";
</script>


</body>
</html>