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
                                <form class="form-search">
                                    <input type="text" class="search-field" placeholder="Search Recipe…" value="" name="s" />
                                    <input type="submit" value="Search" id="inToRight1" />
                                </form>
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