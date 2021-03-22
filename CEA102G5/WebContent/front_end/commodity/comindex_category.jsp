<%@page import="com.commodity_category.model.ComcService"%>
<%@page import="com.cart.model.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.commodity.model.*"%>
<%@ page import="com.commodity_category.model.*"%>
<%@ page import="com.member.model.*"%>       

<%
	List<ComVO> list = (List<ComVO>)session.getAttribute("category_list");
 	pageContext.setAttribute("list",list);//為了分頁	
 	ComcService comcSvc = new ComcService();
 	List<ComcVO> countList = comcSvc.getComCountByComc();
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0" />

<title>所有商品資料 </title>
<style>
		#cf{
			text-align: center;
			width: 80%;
			margin: 20px auto;
		}
		#cf div{
			width: 32%;
			float: left;
			margin-right: 10px;
			margin-top: 10px;
		}
		#cf div img{
			width: 80%;
			height: 150px;
		}
		#cf div p{
			color:#999;
			text-align: center;
		}

</style>
 
</head>
<body bgcolor=#E8FFE8>

	<%@ include file="page1_category.file" %> 
<div id="cf">
<div class="category-carousel-2 mb-3" data-auto-play="true" data-desktop="3" data-laptop="3" data-tablet="2" data-mobile="1">
                            <div class="cat-item">
                                <div class="cats-wrap" data-bg-color="#f8c9c2">
                                    <a class='getComBycomcID' href="<%=request.getContextPath()%>/front_end/commodity_category/comc.do?action=listComforByComcIDwithSales&comcID=<%=countList.get(1).getComcID()%>">
                                    	<input type='hidden' value='<%=countList.get(1).getComcID()%>'>
                                        <img src="<%=request.getContextPath()%>/resource/images/category/meat.png" alt="" />
                                        <h2 class="category-title">
                                            Meat <mark class="count">(<%=countList.get(1).getComCount()%>)</mark>
                                        </h2>
                                    </a>
                                </div>
                            </div>
                            <div class="cat-item">
                                <div class="cats-wrap" data-bg-color="#c6e6f6">
                                    <a class='getComBycomcID' href="<%=request.getContextPath()%>/front_end/commodity_category/comc.do?action=listComforByComcIDwithSales&comcID=<%=countList.get(3).getComcID()%>">
                                    	<input type='hidden' value='<%=countList.get(2).getComcID()%>'>
                                        <img src="<%=request.getContextPath()%>/resource/images/category/seafood2.png" alt="" />
                                        <h2 class="category-title">
                                            Seafood<mark class="count">(<%=countList.get(3).getComCount()%>)</mark>
                                        </h2>
                                    </a>
                                </div>
                            </div>
                            <div class="cat-item">
                                <div class="cats-wrap" data-bg-color="#FFBB66">
                                    <a class='getComBycomcID' href="<%=request.getContextPath()%>/front_end/commodity_category/comc.do?action=listComforByComcIDwithSales&comcID=<%=countList.get(0).getComcID()%>">
                                    	<input type='hidden' value='<%=countList.get(0).getComcID()%>'>
                                        <img src="<%=request.getContextPath()%>/resource/images/category/fruits2.png" alt="" />
                                        <h2 class="category-title">
                                            Fruits <mark class="count">(<%=countList.get(0).getComCount()%>)</mark>
                                        </h2>
                                    </a>
                                </div>
                            </div>
                            <div class="cat-item">
                                <div class="cats-wrap" data-bg-color="#66CDAA">
                                    <a href="<%=request.getContextPath()%>/front_end/commodity_category/comc.do?action=listComforByComcIDwithSales&comcID=<%=countList.get(2).getComcID()%>">
                                        <img src="<%=request.getContextPath()%>/resource/images/category/vegetables.png" alt="" />
                                        <h2 class="category-title">
                                            Vegetables <mark class="count">(<%=countList.get(2).getComCount()%>)</mark>
                                        </h2>
                                    </a>
                                </div>
                            </div>
                            <div class="cat-item">
                                <div class="cats-wrap" data-bg-color="#e0d1a1">
                                    <a href="<%=request.getContextPath()%>/front_end/commodity_category/comc.do?action=listComforByComcIDwithSales&comcID=<%=countList.get(4).getComcID()%>">
                                        <img src="<%=request.getContextPath()%>/resource/images/category/Seasoning.png" alt="" />
                                        <h2 class="category-title">
                                            Seasoning <mark class="count">(<%=countList.get(4).getComCount()%>)</mark>
                                        </h2>
                                    </a>
                                </div>
                            </div>
                        </div>
<div class="product-grid">

<c:forEach var="comVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
                            <div class="col-md-4 col-sm-6 product-item text-center mb-3">
                                <div class="product-thumb">
                                    <a href="shop-detail.html">
                                        <img src="<%=request.getContextPath()%>/ComPicReader${comVO.comPicSrc}&pic=1" alt="" style="height:200px" />
                                    </a>
                                    <div class="product-action">
                                        <span class="add-to-cart">
                                            <a href="#" data-toggle="tooltip" data-placement="top" title="Add to cart"></a>
                                        </span>
                                            <input type="hidden" id="memID" value="${sessionScope.memVO.memID}">
                                            <input type="hidden" id="comID" value="${comVO.comID}">
                                        <span class="wishlist">
                                            <a href="#" data-toggle="tooltip" data-placement="top" title="Add to wishlist"></a>
                                        </span>
                                        <span class="compare">
                                            Sales:${comVO.comSales}
                                        </span>
                                    </div>
                                </div>
                                <div class="product-info">
                                    <a href="<%=request.getContextPath()%>/front_end/cart/comCart.do?action=getOne_For_Cart&comID=${comVO.comID}">
                                        <h2 class="title">${comVO.comName}</h2>
                                        <span class="price">
                                            <ins>$${comVO.comPrice}</ins>
                                        </span>
                                    </a>
                                </div>
                            </div>
</c:forEach>
</div>


</div>
 
<div>
<%@ include file="page2_category.file" %>
</div>


    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery-migrate.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/modernizr-2.7.1.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/owl.carousel.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.countdown.min.js"></script>
    <script type='text/javascript' src='<%=request.getContextPath()%>/resource/js/jquery.prettyPhoto.js'></script>
    <script type='text/javascript' src='<%=request.getContextPath()%>/resource/js/jquery.prettyPhoto.init.min.js'></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/script.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/core.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/widget.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/mouse.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/slider.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.ui.touch-punch.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/script2.js"></script>
     <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/popper.min.js"></script>
    
    <script type="text/javascript">	
		$(".product-grid").on("click",".add-to-cart",function(){
			let memID = $(this).next().val();
			let comID = $(this).next().next().val();
			if(memID == ""){
				window.location.href = "<%=request.getContextPath()%>/cart/comCart.do?action=ADD&location=<%=request.getServletPath()%>&comID="+comID+"";
				return;
			}
			$.ajax({
				url:"<%=request.getContextPath()%>/cart/comCart.do",
				type:"post",
				data:{
					action:"ADD",
					comID:comID,
					cardCount:1
				},
				cache:false,
				ifModified :true,
				success : function(){
					window.location.reload();
				}
			});
		});
    </script>

</body>
</html>