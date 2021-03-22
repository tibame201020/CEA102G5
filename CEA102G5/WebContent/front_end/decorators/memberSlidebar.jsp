<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LessonSlidebar</title>
</head>
<body>


<div class="row">

<div class="col-md-9 col-md-push-3">
	<sitemesh:write property='body' />
</div>
<div class="col-md-3 col-md-pull-9">
                        <div class="sidebar">
                            <!--新刪改查link -->
                            <div class="widget widget-product-categories">
                                <h3 class="widget-title">Categories</h3>
                                <ul class="product-categories">
                                    <c:if test="${!empty sessionScope.memVO}">
                                    <div>
                                    	<li><a href="#">編輯個人資料</a></li>
                                        <li><a href="#">商品收藏清單</a></li>
                                        <li><a href="#">食譜收藏清單</a></li>
                                        <li><a href="<%=request.getContextPath()%>/front_end/lesson.favorites/lesf.do?action=getOne&mem_ID=${sessionScope.memVO.memID}">課程收藏清單</a></li>                                        
                                        <li><a href="<%=request.getContextPath()%>/front_end/lesson.reservation/lesr.do?action=getOne1&mem_ID=${sessionScope.memVO.memID}">課程預約清單</a></li>
                                    </div>
                                    </c:if>
                                </ul>
                            </div>
                        </div>
                    </div>

</div>


</body>
</html>