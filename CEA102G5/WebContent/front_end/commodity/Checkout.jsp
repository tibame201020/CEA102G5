<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.commodity_category.model.*"%>
<%@ page import="com.cart.model.*"%>
<%@ page import="com.commodity.model.*"%>
<%@ page import="com.commodity.controller.*"%>
<%@ page import="com.member.model.*"%>
<%@ page import="com.member_recipient.model.*"%>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<h2 class="page-title text-center" style='color:black;'>Check Out</h2>
				<div class="section pt-7 pb-7" width='1000px'>
					<div class="container">
						<div class="row">
							<div class="col-md-12" style="width:1000px;">
								<div class="wishlist-wrap">
									<table class="table shop-cart">
										<thead>
											<tr class="cart_item">												
												<td class="product-thumbnail">&nbsp;</td>
												<td class="product-info">Product Name</td>
												<td class="product-subtotal">Unit Price</td>
												<td class="product-stock">Quantity</td>
												<td>Amount</td>
											</tr>
										</thead>
										<tbody>
<form name="checkoutForm" action="<%=request.getContextPath()%>/front_end/ordermaster/om.do" method="POST">
										 <c:forEach var="cartVO" items="${checkOutList}">
											<tr class="cart_item">
												<td class="product-thumbnail">
													<a href="<%=request.getContextPath()%>/front_end/cart/comCart.do?action=getOne_For_Cart&comID=${cartVO.comID}">
														<img src="<%=request.getContextPath()%>/ComPicReader${cartVO.comPicSrc}&pic=1" alt="">
													</a>
												</td>
												<td class="product-info">
													<a href="<%=request.getContextPath()%>/front_end/cart/comCart.do?action=getOne_For_Cart&comID=${cartVO.comID}">${cartVO.comName}</a>
												</td>
												<td class="product-subtotal">
													<span class="amount">$${cartVO.comPrice}</span>
												</td>
												<td>
                                                     <font size='5' style='margin-left:5px; margin-right:5px;'>${cartVO.cardCount}</font>                                                  
												</td>
												<td>
													 <font size='5' style='margin-left:5px; margin-right:5px;'>$ ${cartVO.cardCount * cartVO.comPrice}</font>
												</td>
											</tr>
											 </c:forEach>
											 
										</tbody>
									</table>
									<h3 id='showAmount' style='float:right; margin-right:300px;'>Total Amount :$ ${amount} </h3>
									
								</div>
							</div>
						</div>
								<jsp:useBean id="memSvc" scope="page" class="com.member.model.MemService"></jsp:useBean>
								<input id='checkBonus' value='${memSvc.getMemBonus(memVO.memID).memBonus}' type='checkbox' style='width:30px;height:30px;'><font size='+2'>使用積分:${memSvc.getMemBonus(memVO.memID).memBonus}分可用</font><br><br>
								<img src='<%=request.getContextPath()%>/resource/images/recipient.png' width='50px' height='50px'>
								<input id='openModal' type='button' value='選擇收貨人地址資訊'>
								<br><br><br>
								<c:if test="${not empty memrVO}">
								<font size='5'>收貨人姓名: ${memrVO.memrName}</font><br><br>
								<font size='5'>收貨人電話: ${memrVO.memrPhone}</font><br><br>
								<font size='5'>收貨人地址: ${memrVO.memrAddress}</font><br><br>
								</c:if>
								<input type='submit' value='付款結帳'>
								<input type="hidden" name="action"  value="BUY">
								<input type="hidden" name="memID"  value="${memVO.memID}">
								<input type="hidden" name="memrID"  value="${memrVO.memrID}">
								<input type="hidden" id='totalAmount' name="totalAmount"  value="${amount}">
</form>
					</div>
				</div>
 
 
 <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document" style="width:1000px">
      <div class="modal-content" background-color="red">
        <div class="modal-header">
          <h2 class="modal-title" id="exampleModalLabel">請選擇常用收貨人資訊</h2>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <jsp:include page="/front_end/member/listAllMemRec.jsp" />
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
<script type="text/javascript">
	$("#openModal").click(function(){
		$("#exampleModal").modal("show");
	});
	
	$("#checkBonus").change(function(){
		var bonus = $(this).val();
		var totalAmount = ${amount};
		//checkbox用prop
		if($(this).is(':checked')){
			
			var newAmount = totalAmount - bonus;
			$("#showAmount").text("Total Amount: $"+newAmount);
			$("#totalAmount").val(newAmount);
			
		}else{
			$("#showAmount").text("Total Amount: $"+totalAmount);
			$("#totalAmount").val(totalAmount);
		}
		
	});
</script>

</body>

</html>