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
                                    <input type="text" class="search-field" placeholder="Search Commodity…" value="" name="s" />
                                    <input type="submit" value="Search" id="inToRight1" />
                                </form>
                            </div>
                            <div class="widget widget_price_filter">
                                <h3 class="widget-title">Filter by price</h3>
                                <div class="price_slider_wrapper">
                                    <div class="price_slider" style="display:none;"></div>
                                    <div class="price_slider_amount">
                                        <input type="text" id="min_price" name="min_price" value="" data-min="0" placeholder="Min price" />
                                        <input type="text" id="max_price" name="max_price" value="" data-max="150" placeholder="Max price" />
                                        <button type="submit" class="button" id=inToRight2>Filter</button>
                                        <div class="price_label" style="display:none;">
                                            Price: <span class="from"></span> &mdash; <span class="to"></span>
                                        </div>
                                        <div class="clear"></div>
                                    </div>
                                </div>
                            </div>
                            
                        
                            
                            
                            
					<!-- 左邊商品列 -->
                            <div class="widget widget-products">
                                <h3 class="widget-title">New  Commodity</h3>
                                <ul class="product-list-widget">
                                
<!--                                 蝶帶出銷量前幾的商品 -->
					                <jsp:useBean id="comSvc" class="com.commodity.model.ComService"/> 
									<c:forEach var="comVO" items="${comSvc.allForComindex}" begin="0" end="2">
										<li>
										 <a href="#">
										 <img src = "<%=request.getContextPath()%>/ComPicReader${comVO.comPicSrc}&pic=1" max-width=100>
										 <span>${comVO.comName}</span>
									     </a>
									     <ins>$ ${comVO.comPrice}</ins>
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

</script>

</body>
</html>