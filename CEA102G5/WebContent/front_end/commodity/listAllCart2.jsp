<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ page import="java.util.*"%>
<%@ page import="com.commodity_category.model.*"%>
<%@ page import="com.cart.model.*"%>
<%@ page import="com.commodity.model.*"%>
<%@ page import="com.commodity.controller.*"%>
<%@ page import="com.member.model.*"%>
<%MemVO memVO = (MemVO)session.getAttribute("memVO"); %>
<html>
<head><title>購物車列表 - listAllCart.jsp</title>
</head>
<body style="width:1000px">
<h2 class="page-title text-center" style='color:black;'>Cart List</h2>
				<div class="section pt-7 pb-7" width='1000px'>
					<div class="container">
						<div class="row">
							<div class="col-md-12">
								<div class="wishlist-wrap">
									<table class="table shop-cart">
										<thead>
											<tr class="cart_item">
												<td class="product-remove">&nbsp;</td>
												<td class="product-thumbnail">&nbsp;</td>
												<td class="product-info">Product Name</td>
												<td class="product-subtotal">Unit Price</td>
												<td class="product-stock">Quantity</td>
												<td>&nbsp;</td>
											</tr>
										</thead>
										<tbody>
<form name="checkoutForm" action="<%=request.getContextPath()%>/front_end/cart/comCart.do" method="POST">
										<jsp:useBean id="cartSvc" class="com.cart.model.CartService"></jsp:useBean>
										<jsp:useBean id="comSvc" class="com.commodity.model.ComService"></jsp:useBean>
										 <c:forEach var="cartVO" items="${cartSvc.getAllByMemID(memVO.memID)}">
											<tr class="cart_item">
												<td class="product-remove">
													<input class='checkComID' type='checkbox' name='checkComID' value='${cartVO.comID}'>
												</td>
												<td class="product-thumbnail">
													<a href="<%=request.getContextPath()%>/front_end/cart/comCart.do?action=getOne_For_Cart&comID=${cartVO.comID}">
														<img src="<%=request.getContextPath()%>/ComPicReader${cartVO.comPicSrc}&pic=1" alt="">
													</a>
												</td>
												<td class="product-info">
													<a href="<%=request.getContextPath()%>/front_end/cart/comCart.do?action=getOne_For_Cart&comID=${cartVO.comID}">${cartVO.comName}</a>
												</td>
												<td class="product-subtotal">
													<span class="amount" value='${cartVO.comPrice}'>$${cartVO.comPrice}</span>
												</td>
												<td>
													 <img class='minus' style='cursor:pointer;' src='<%=request.getContextPath()%>/resource/images/minus.png' width='30px'>
                                                     <font size='5' style='margin-left:5px; margin-right:5px;'>${cartVO.cardCount}</font>
                                                     <img class='plus' style='cursor:pointer;' src='<%=request.getContextPath()%>/resource/images/add.png' width='30px'>
												</td>
												<td>
													<input class='delete' type='button' value='DELETE'>
												</td>
											</tr>
											 <c:set var="comCount" value="${cartVO.cardCount}"/>
                                                <c:set var="comPrice" value="${cartVO.comPrice}"/>
                                                <c:set var="cartTotalPrice" value="${cartTotalPrice+comCount*comPrice}" />
											 </c:forEach>
											 
										</tbody>
									</table>

									
								</div>
							</div>
							<div class="col-md-4">
								<div class="cart-totals" style='display:inline-block; width:500px;'>
									<table>
										<tbody>
											<tr class="cart-subtotal">
												<th>Subtotal</th>
												<td id='cartSub'>$ ${cartTotalPrice}</td>
											</tr>
										</tbody>
									</table>
										<input id="checkAll" type='button' value='全選'> 
									<div class="proceed-to-checkout">
										<input type='submit' value='確認結帳'>
										<input type="hidden" name="action"  value="CHECKOUT">
									</div>
								</div>
								<div class="coupon-shipping" style='display:inline-block;'>
									<div class="coupon" style='display:inline-block;'>
										
									</div>
								</div>
							</div>
						</div>
								
</form>
					</div>
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
		
		<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/script2.js"></script>
     	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/popper.min.js"></script>	


<script>
	$("#checkAll").click(function(){
		if($(this).val() == "全選"){
			$(".checkComID").each(function(){
				$(this).prop('checked',true);
			});
			calculate();
			$(this).val("全不選");
		}else{
			$(".checkComID").each(function(){
				$(this).prop('checked',false);
			});
			calculate();
			$(this).val("全選");
		}
	});

	function calculate(){
		var total = 0;
		$("input:checkbox:checked").each(function(){
			let price = $(this).parent().next().next().next().children().attr("value");
			let qty = $(this).parent().next().next().next().next().children().next().text();
			total += price * qty;
			$("#cartSub").text("$"+total);
		});
		$("#cartSub").text("$"+total);
	}
	$(".checkComID").click(function(){
			calculate();
	});


	$(".plus").click(function(){
		let memID = ${memVO.memID};
		let count = $(this).prev().text();
		let comID = $(this).parents("tr.cart_item").children().children().val();
		let font = $(this).prev();
		$.ajax({
			url:"<%=request.getContextPath()%>/cart/comCart.do",
			type:"POST",
			data:{
				action:"plusCount",
				memID:memID,
				comID:comID,
				cardCount:count
			},
			cache:false,
			ifModified:true,
			context:font,
			success:function(){
				count++;
				$(this).text(count);
				calculate();
			}
		});
	});


	$(".minus").click(function(){
		let count = $(this).next().text();
		let comID = $(this).parents("tr.cart_item").children().children().val();
		let font = $(this).next();
		if(count == 1){
			return;
		}
		$.ajax({
			url:"<%=request.getContextPath()%>/cart/comCart.do",
			type:"POST",
			data:{
				action:"minusCount",
				comID: comID,
				cardCount: count
			},
			cache:false,
			ifModified:true,
			context:font,
			success:function(){				
					count--;						
					$(this).text(count);
					calculate();
			}
		});
	});

	$(".delete").click(function(){
		let comID = $(this).parents("tr.cart_item").children().children().val();
		let tr = $(this).parents("tr.cart_item");
		let memID = ${memVO.memID};
		console.log("OK");
		$.ajax({
			url:"<%=request.getContextPath()%>/cart/comCart.do",
			type:"POST",
			 data:{
				 action : "delete_Cart",
				 comID : comID,
				 memID : memID
			 },
			 cache:false,
			 ifModified :true,
			 context:tr,
		     success:function(data){
		    	 $(this).remove();
				 $(".mini-cart-icon").attr("data-count",data);
				 calculate();
		     }
		});
	});
</script>

</body>
</html>