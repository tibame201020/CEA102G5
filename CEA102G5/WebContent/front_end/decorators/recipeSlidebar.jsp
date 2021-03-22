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

<style>
div.widget-products .product-list-widget li a img{
width:80px;
height:auto;
}

</style>

<div class="row">

<div class="col-md-9 col-md-push-3">
	<sitemesh:write property='body' />
</div>
<div class="col-md-3 col-md-pull-9">
                     <div class="sidebar">
                            <div class="widget widget-product-search">

                            <h3 class="widget-title">Search</h3>
										<form class="form-search" action='<%=request.getContextPath()%>/front_end/recipe/rec.do'>
											 <select name="selectType" id="selectType">
									                <option value="REC_NAME">找食譜</option>
									                <option value="MEM_NAME">找作者</option>
            								</select>
								            <input type="text" autocomplete="off" name='selectText' id="selectText"  required="required">
								            <label>
											<input type='submit' style='display:none;'>	
											<input type='hidden' name='action' value='getAllByCondition'>							            
								            <img id="searchPng" style='cursor:pointer' src="<%=request.getContextPath()%>/resource/images/search.png" alt="" width="30px" height="30px">
								            </label>								           		
										</form>
							</div>
                            <c:if test="${not empty memVO}">
                            <div class="widget widget-product-categories">
                                <h3 class="widget-title">Action</h3>
                                <ul class="product-categories">
                                    <div>
                                        <li><a href="<%=request.getContextPath()%>/front_end/recipe/addRecipe2.jsp">新增食譜</a></li>                                       
                                    	<li><a href="<%=request.getContextPath()%>/front_end/recipe/recMemFavorite.jsp">查看個人收藏食譜</a></li>
                                    	<li><a href="<%=request.getContextPath()%>/front_end/recipe/listRecbyMemID.jsp">查看個人食譜列表</a></li>
                                    </div>
                                </ul>

                            </div>
                            
                        
                            
                            
                            
					<!-- 左邊商品列 -->
                            <div class="widget widget-products">
                                <h3 class="widget-title">Popular</h3>
                                <ul class="product-list-widget">
<!--跌帶出收藏前幾的食譜 -->
					                <jsp:useBean id="lesSvc" class="com.lesson.model.LesService"/> 
									<c:forEach var="lesVO" items="${lesSvc.allTrueToFront}" begin="0" end="2">
										<li>
										 <a href="#">
										 <img src ="" max-width=100>
										 <span>##</span>
									     </a>
									     <ins>$ ###</ins>
										</li>
									</c:forEach>
                                </ul>
                            </div>
                            
					<!--左下標籤 -->
                            <div class="widget widget-tags">
                            </div>
                        </div>
                    </div>

					</div>
</div>
</div>
<script type="text/javascript">
$("#inToRight2").click(
		function(e){
			console.log("in");
			console.log($("input.search-field").val());
			console.log($("#LES_Name").val());
			let lesName = $("input.search-field").val();
			e.preventDefault();
			$("#LES_Name").val($("input.search-field").val());
			$("#LES_Price1").val($("#min_price").val());
			$("#LES_Price2").val($("#max_price").val());
			$("#lessonQueryFront").submit();
		})
$("#inToRight1").click(
		function(e){
			console.log("in");
			console.log($("input.search-field").val());
			console.log($("#LES_Name").val());
			let lesName = $("input.search-field").val();
			e.preventDefault();
			$("#LES_Name").val($("input.search-field").val());
			$("#LES_Price1").val($("#min_price").val());
			$("#LES_Price2").val($("#max_price").val());
			$("#lessonQueryFront").submit();
		})
</script>

</body>
</html>