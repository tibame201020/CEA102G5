<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.member.model.*"%>
<%@ page import="com.recipe.model.*"%>
<%@ page import="java.util.*"%>
<%
	List<RecVO> list = (List<RecVO>) session.getAttribute("conditionList");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>食譜首頁</title>
</head>

<body>
<jsp:useBean id="memSvc" scope='page' class="com.member.model.MemService"/>
<jsp:useBean id="jedis" scope='page' class="jedis.util.favorite.JedisHandleFavorite"/>
<h2 class="page-title text-center" style='color:black;'>Recipe List</h2>
<div class="blog-list">
<%@ include file="page1.file" %> 
	<c:forEach var="recVO" items="${sessionScope.conditionList}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
	<div class="blog-list-item">
			<div class="col-md-6">
				<div class="post-thumbnail">
						<a href="<%=request.getContextPath()%>/front_end/recipe/rec.do?action=GetRecDetail_ByrecID&recID=${recVO.recID}"> 
							<img src="<%=request.getContextPath()%>/ComPicReader${recVO.recPicSrc}&pic=1" alt="" /> 
						</a>
				</div>
			</div>
			<div class="col-md-6">
				<div class="post-content">
					<div class="entry-meta">
						<span class="posted-on">
							<span>作者: ${memSvc.getOneMem(recVO.memID).memName}</span>
						</span>
						<span class="comment">
							<span style="margin-left: 10px;">總熱量: ${recVO.recCal}</span>
						</span>
						<span class="comment">
							<span style="margin-left: 10px;">${jedis.getHowManyFav(recVO.recID)}</span>
						</span>
						<span>
						<c:if test="${jedis.checkFavoriteByMemID(memVO.memID,recVO.recID)}">
							<img src="<%=request.getContextPath()%>/resource/images/heart.png" alt="" width="30px" height="30px" style="float: right;">
						</c:if>
						<c:if test="${not jedis.checkFavoriteByMemID(memVO.memID,recVO.recID)}">
							<img src="<%=request.getContextPath()%>/resource/images/heartempty.png" alt="" width="30px" height="30px" style="float: right;">
						</c:if>
						</span>
					</div>
					<a href="<%=request.getContextPath()%>/front_end/recipe/rec.do?action=GetRecDetail_ByrecID&recID=${recVO.recID}">
						<h1 class="entry-title">${recVO.recName}</h1>
					</a>
					<div class="entry-content"> 
						${recVO.recContent}
					</div>
					<div class="entry-more">
						<a href="<%=request.getContextPath()%>/front_end/recipe/rec.do?action=GetRecDetail_ByrecID&recID=${recVO.recID}">Read more</a>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>

<%@include file="page2.file" %>       

</div>
        
<script type="text/javascript">
</script>
</body>
</html>