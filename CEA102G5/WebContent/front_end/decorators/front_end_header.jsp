<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html>
<html>

<head>

	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/popper.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/script2.js"></script>
    
    <!-- link -->
    <link rel="stylesheet" href="<%= request.getContextPath()%>/resource/css/table.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/bootstrap.min.css" type="text/css" media="all" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/font-awesome.min.css" type="text/css" media="all" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/ionicons.min.css" type="text/css" media="all" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/owl.carousel.css" type="text/css" media="all" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/owl.theme.css" type="text/css" media="all" />
    <link rel='stylesheet' href='<%=request.getContextPath()%>/resource/css/prettyPhoto.css' type='text/css' media='all' />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/style.css" type="text/css" media="all" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/custom.css" type="text/css" media="all" />
    <link href="http://fonts.googleapis.com/css?family=Great+Vibes%7CLato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet" />
    <title>Eatin</title>
    
    <style>
    img.logo-image{
    	max-width:35%;
    }

    .contact-icon>a>img{
    	max-width:50%;
    }

    
* {
	list-style: none;
}


.dialogue {
	position:fixed;
	top:38%;
	right:2%;
  	width: 400px;
  	display:flex;
  	flex-direction:column;
  	justify-content: flex-end;
  	height:350px;
  	padding: 5px 20px;
  	box-shadow: 0 0 10px #000;
  	background-color: #f4f5f7;
  	border-radius: 20px;
}
.messagesArea{
	overflow:auto;
}

#productArea img{
    height:100px;
}
#productArea {
    position:sticky;
    top:0px;
    left:0px;
    width:100%;
    z-index:800;
    background-color: #f4f5f7;
}

.user {
  display: flex;
  align-items: flex-start;
  margin-bottom: 20px;
}
.user .avatar {
  width: 60px;
  text-align: center;
  flex-shrink: 0;
}
.user .pic {
  border-radius: 50%;
  overflow: hidden;
}
.user .pic img {
  width: 100%;
  vertical-align: middle;
}
.user .name {
  color: #333;
}
.user .text {
  background-color: #aaa;
  padding: 16px;
  border-radius: 10px;
  position: relative;
}

.remote .text {
  margin-left: 20px;
  margin-right: 80px;
  color: #eee;
  background-color: #4179f1;
}
.remote .text::before {
  border-right: 10px solid #4179f1;
  left: -10px;
}

.local {
  justify-content: flex-end;
}
.local .text {
  margin-right: 10px;
  margin-left: 80px;
  order: -1;
  background-color: #fff;
  color: #333;
}
.local .text::before {
  border-left: 10px solid #fff;
  right: -10px;
}

.remote .text::before,.local .text::before {
  content: "";
  position: absolute;
  top: 20px;
  border-top: 10px solid transparent;
  border-bottom: 10px solid transparent;
}
.remote .text,.local .text {
  font-weight: 300;
  box-shadow: 0 0 10px #888;
}

.contactMsgs {
	position:relative;
}
.contactMsgs::after {
  content: attr(data-count);
  position: absolute;
  font-size: 14px;
  text-align: center;
  line-height: 16px;
  height: 16px;
  width: 16px;
  border-radius: 16px;
  color: #fff;
  top: 36%;
  right: 30%;
  background-color: #02F78E;
}

    
    
    
    </style>
   
</head>

<body>

<script>
	var memID = -1;
	var lesID = "-1";
	var comID = "-1";
</script>

	<c:set var="home" value="${pageContext.request.contextPath}/front_end/front_end_index.jsp" />
    <c:set var="les" value="${pageContext.request.contextPath}/front_end/lesson/listQueryLesson.jsp" />
    <c:set var="com" value="${pageContext.request.contextPath}/front_end/commodity/comindex.jsp" />
    <c:set var="mem" value="${pageContext.request.contextPath}/front_end/member/frontMemSelect.jsp" />


<div id="menu-slideout" class="slideout-menu hidden-md-up">
			<div class="mobile-menu">
				<ul id="mobile-menu" class="menu">
					<li>
                                        <a href="${home}">Home</a>
                                    </li>
                                    
                                     <li>
                                        <a href="#">Recipe</a>
                                    </li>
                                    
                                     <li>
                                        <a href="${com}">Mall</a>
                                    </li>
                                    
                                     <li>
                                        <a href="${les}">Course</a>
                                    </li>
                                    <li>
                                        <a href="${mem}">Member</a>
                                    </li>
									<li>
                                        <a href="#">Contact</a>
                                    </li>  
				</ul>
			</div>
		</div>
	

    <div class="site">
        <div class="topbar">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <div class="topbar-text">
                            <span>Work time: Monday - Friday: 08AM-06PM</span>
                            <span>Saturday - Sunday: 10AM-06PM</span>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="topbar-menu">
                            <ul class="topbar-menu">
                            <c:if test="${empty sessionScope.memVO}">
                                <li><a href="<%=request.getContextPath()%>/front_end/member/login.jsp">Login</a></li>
                            </c:if>
                            
                            <c:if test="${!empty sessionScope.memVO}">
                            	<li><a href=${mem}>${memVO.memName}</a></li>
                                <li><a href="<%=request.getContextPath() %>/front_end/member/mem.do?action=logout">LogOut</a></li>
                            </c:if>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <header id="header" class="header header-desktop header-2">
        <div class="top-search">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12">
                            <form>
                                <input type="search" class="top-search-input" name="s" placeholder="What are you looking for?" />
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-md-3">
                        <a href="${home}" id="logo">
                            <img class="logo-image" src="<%=request.getContextPath()%>/resource/images/logo.png" alt="Eatin Logo" />
                        </a>
                    </div>
                    <div class="col-md-9">
                        <div class="header-right">
                            <nav class="menu">
                                <ul class="main-menu">
                                    <li>
                                        <a href="${home}">Home</a>
                                    </li>
                                    
                                     <li>
                                        <a href="#">Recipe</a>
                                    </li>
                                    
                                     <li>
                                        <a href="${com}">Mall</a>
                                    </li>
                                    
                                     <li>
                                        <a href="${les}">Course</a>
                                    </li>
                                    <li>
                                        <a href="${mem}">Member</a>
                                    </li>
									<c:if test="${!empty memVO}">
								         
								          	<li class="contact-icon">
								            	<a href="#"><img src="<%=request.getContextPath()%>/resource/images/contact.jpg" width=50px></a>
								            </li>
								        
								   </c:if> 
                                </ul>
                            </nav>
                     <div class="btn-wrap">
                     	<c:if test="${!empty memVO}">
                     	<jsp:useBean id="cartSvc" class="com.cart.model.CartService"></jsp:useBean>
                     	<jsp:useBean id="comSvc" class="com.commodity.model.ComService"></jsp:useBean>
                     	<c:set var="cartTotalPrice" value="0" />
                                <div class="mini-cart-wrap">
                                    <div class="mini-cart">
<!--                                     購物車數量 -->
                                        <div class="mini-cart-icon" data-count="${fn:length(cartSvc.getAllByMemID(memVO.memID))}">
                                            <i class="ion-bag"></i>
                                        </div>
                                    </div>
                                    <div class="widget-shopping-cart-content">
                                        <ul class="cart-list">
                                        <c:forEach var="cartVO" items="${cartSvc.getAllByMemID(memVO.memID)}">
                                        <li>
<!--                                             刪除商品 -->
                                                <a href="#" id=delete class="remove" data-price="${cartVO.cardCount*comSvc.getOneCom(cartVO.comID).comPrice}" data-comID="${cartVO.comID}" data-memID="${memVO.memID}">×</a>
                                                <a href="<%=request.getContextPath()%>/front_end/cart/comCart.do?action=getOne_For_Cart&comID=${cartVO.comID}">
<!--                                                 圖片 -->
                                                    <img src = "<%=request.getContextPath()%>/ComPicReader${comSvc.getOneCom(cartVO.comID).comPicSrc}&pic=1"/>
<!--                                                     商品名稱 -->
                                                    ${comSvc.getOneCom(cartVO.comID).comName}&nbsp;
                                                </a>
<!--                                                 數量 單價 -->
                                                <span class="quantity">${cartVO.cardCount} × $${comSvc.getOneCom(cartVO.comID).comPrice}</span>
                                                <c:set var="comCount" value="${cartVO.cardCount}"/>
                                                <c:set var="comPrice" value="${comSvc.getOneCom(cartVO.comID).comPrice}"/>
                                                <c:set var="cartTotalPrice" value="${cartTotalPrice+comCount*comPrice}" />
                                            </li>        
                                        </c:forEach>
                                        </ul>
                                        <p class="total">
                                            <strong>Subtotal:</strong>
<!--                                             帶出總價格 -->
                                            <span class="amount">$<span>${cartTotalPrice}</span></span>
                                        </p>
                                        <p class="buttons">
<!--                                         購物車頁面 -->
                                            <a href="#" class="view-cart">View cart</a>
<!--                                             結帳頁面 -->
                                            <a href="#" class="checkout">Checkout</a>
                                        </p>
                                    </div>
                                </div>
                      	</c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <header class="header header-mobile">
            <div class="container">
                <div class="row">
                    <div class="col-xs-2">
                        <div class="header-left">
                            <div id="open-left"><i class="ion-navicon"></i></div>
                        </div>
                    </div>
                    <div class="col-xs-8">
                        <div class="header-center">
                            <a href="${home}" id="logo-2">
                                <img class="logo-image" src="<%=request.getContextPath()%>/resource/images/logo.png" alt="Eatin Logo" />
                            </a>
                        </div>
                    </div>
                    <div class="col-xs-2">
                        <div class="header-right">
                            <div class="mini-cart-wrap">
                            <c:if test="${!empty memVO}">
                                <a href="#">
                                    <div class="mini-cart" style='display:inline-block'>
                                        <div class="mini-cart-icon" data-count="${fn:length(cartSvc.getAllByMemID(memVO.memID))}">
                                            <i class="ion-bag"></i>
                                        </div>
                                    </div>
                                </a>
                            </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <div class="section pt-7 pb-7">
            <div class="container" style="position:relative;">
            <sitemesh:write property='body' />
            
<div class="dialogue">
			<div id=productArea class=productArea>
			</div>
            <div id=messagesArea class=messagesArea>
			</div>
 	<div class=inputarea>
 	<input id="message" class="text-field" type="text" placeholder="Message" onkeydown="if (event.keyCode == 13) sendMessage();" /> 
 	</div>
 </div>
                
            </div>
        </div>
        <footer class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-5">
                        <img src="<%=request.getContextPath()%>/resource/images/footer_logo.png" class="footer-logo" alt="" />
                        <p>
                            Welcome to Organik. Our products are freshly harvested, washed ready for box and finally delivered from our family farm right to your doorstep.
                        </p>
                        <div class="footer-social">
                            <a href="#" data-toggle="tooltip" data-placement="top" title="Facebook"><i class="fa fa-facebook"></i></a>
                            <a href="#" data-toggle="tooltip" data-placement="top" title="Twitter"><i class="fa fa-twitter"></i></a>
                            <a href="#" data-toggle="tooltip" data-placement="top" title="Pinterest"><i class="fa fa-pinterest"></i></a>
                            <a href="#" data-toggle="tooltip" data-placement="top" title="Instagram"><i class="fa fa-instagram"></i></a>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="widget">
                            <h3 class="widget-title">Infomation</h3>
                            <ul>
                                <li><a href="#">New Products</a></li>
                                <li><a href="#">Top Sellers</a></li>
                                <li><a href="#">Our Blog</a></li>
                                <li><a href="#">About Our Shop</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="widget">
                            <h3 class="widget-title">Useful Link</h3>
                            <ul>
                                <li><a href="#">Our Team</a></li>
                                <li><a href="#">Our Blog</a></li>
                                <li><a href="#">About Us</a></li>
                                <li><a href="#">Secure Shopping</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="widget">
                            <h3 class="widget-title">Subscribe</h3>
                            <p>
                                Enter your email address for our mailing list to keep yourself updated.
                            </p>
                            <form class="newsletter">
                                <input type="email" name="EMAIL" placeholder="Your email address" required="" />
                                <button><i class="fa fa-paper-plane"></i></button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <div class="copyright">
            <div class="container">
                <div class="row">
                    <div class="col-md-8">
                        Copyright © 2017 <a href="#">Organic Store</a> - All Rights Reserved.
                    </div>
                    <div class="col-md-4">
                         <img src="<%=request.getContextPath()%>/resource/images/footer_payment.png" alt="" />
                    </div>
                </div>
            </div>
            <div class="backtotop" id="backtotop"></div>
        </div>
    </div>

   
   <script type="text/javascript">
    
    var contextPath = "${pageContext.request.contextPath}";
    $("div.dialogue").hide();
   
    $("ul.cart-list").on("click","#delete",function(e){
    	e.stopPropagation();
    	console.log(this);
    	let price = $(this).attr("data-price");
    	let memID = $(this).attr("data-memID");
    	let comID = $(this).attr("data-comID");
    	let cartVO = $(this).parent();
		$.ajax({
			url:"<%=request.getContextPath()%>/cart/comCart.do",
			type:"POST",
			 data:{
				 action : "delete_Cart",
				 memID : memID,
				 comID : comID
			 },
			 dataType : "json",
			 cache:false,
			 ifModified :true,
		     success:function(data){
		    	 $("div.mini-cart-icon").attr("data-count", $("div.mini-cart-icon").attr("data-count")-1);
		    	 cartVO.remove();
		    	 $("span.amount").children("span").text($("span.amount").children("span").text()-price);
		     }
		});
	});
  
    $(document).on('show.bs.modal', '.modal', function () {
  	  $(this).appendTo('body');
  	});
    
    $("li.contact-icon>a").click(function(e){
    	e.preventDefault();
    	$(".contact-icon a").toggleClass("openMsgs");
    	$(".contact-icon a").attr("data-count",0);
    	if($(".contact-icon a").hasClass("contactMsgs")){
        	$(".contact-icon a").toggleClass("contactMsgs");
    	}
    	$("div.dialogue").toggle();
    	if(!webSocket){
    		connect();
    	}
    	dialogue.scrollTop = dialogue.scrollHeight;
    });
    </script>
    
    <script>
    

    
    <c:if test="${!empty memVO}">
    	memID = ${memVO.memID};
	</c:if>
    
	var MyPoint = "/ServiceWS/member/"+memID;
	var host = window.location.host;
	var path = window.location.pathname;
	var webCtx = path.substring(0, path.indexOf('/', 1));
	var endPointURL = "ws://" + window.location.host + webCtx + MyPoint;
	var messagesArea = document.getElementById("messagesArea");
	var productArea = document.getElementById("productArea");
	var self = "member"+'${memVO.memID}';
	var selfName = '${memVO.memName}';
	var webSocket;
	var dialogue = $("div.messagesArea")[0];
	<c:if test="${!empty memVO}">
		connect();
	</c:if>
	function connect() {
		// create a websocket
		webSocket = new WebSocket(endPointURL);
		webSocket.onopen = function(event) {
			console.log("Connect Success!");
			getHistory();
		};

		webSocket.onmessage = function(event) {
			var jsonObj = JSON.parse(event.data);
			if ("history" === jsonObj.type) {
				
				// 這行的jsonObj.message是從redis撈出跟好友的歷史訊息，再parse成JSON格式處理
				var messages = JSON.parse(jsonObj.message);
				
				for (var i = 0; i < messages.length; i++) {
					var jsonObj = JSON.parse(messages[i]);
					
					if(jsonObj.lesVO){
						$("#productArea").empty();
						let div = document.createElement('div');
						let html="<ul class='cart-list'><li><img src =";
						html += contextPath+jsonObj.lesVO.pic+">";
						html += jsonObj.lesVO.lesName+"</li></ul>";
						div.innerHTML= html;
						productArea.append(div);
					}
					if(jsonObj.comVO){
						$("#productArea").empty();
						let div = document.createElement('div');
						let html="<ul class='cart-list'><li><img src =";
						html += contextPath+"/ComPicReader"+jsonObj.comVO.comPicSrc+"&pic=1>";
						html += jsonObj.comVO.comName+"</li></ul>";
						div.innerHTML= html;
						productArea.append(div);
					}
					
					if(jsonObj.sender===self){
						let div = document.createElement('div');
						let html="<div class='user local'><div class='avatar'>";
						html+="<div class='pic'><img src=''></div>";
						html+="<div class='name'>"+selfName+"</div></div>";
						html+="<div class='text'>"+jsonObj.message+"</div></div>";
						div.innerHTML= html;
						messagesArea.append(div);
					}else{
						let div = document.createElement('div');
						let html="<div class='user remote'><div class='avatar'>";
						html+="<div class='pic'><img src=''></div>";
						html+="<div class='name'>"+jsonObj.sender+"</div></div>";
						html+="<div class='text'>"+jsonObj.message+"</div></div>";
						div.innerHTML= html;
						messagesArea.append(div);
					}
				}
				dialogue.scrollTop = dialogue.scrollHeight;
			} else if ("chat" === jsonObj.type) {	
					
				if(!$(".contact-icon a").hasClass("openMsgs")){
					if(typeof $(".contact-icon a").attr("data-count") == "undefined"){
						$(".contact-icon a").attr("data-count",1);
						$(".contact-icon a").addClass("contactMsgs");
					}else{
						let count = +$(".contact-icon a").attr("data-count")+1;
						$(".contact-icon a").attr("data-count",count);
						$(".contact-icon a").addClass("contactMsgs");
					}
				}
				if(jsonObj.lesVO){
					$("#productArea").empty();
					let div = document.createElement('div');
					let html="<ul class='cart-list'><li><img src =";
					html += contextPath+jsonObj.lesVO.pic+">";
					html += jsonObj.lesVO.lesName+"</li></ul>";
					div.innerHTML= html;
					productArea.append(div);
				}
				if(jsonObj.comVO){
					$("#productArea").empty();
					let div = document.createElement('div');
					let html="<ul class='cart-list'><li><img src =";
					html += contextPath+"/ComPicReader"+jsonObj.comVO.comPicSrc+"&pic=1>";
					html += jsonObj.comVO.comName+"</li></ul>";
					div.innerHTML= html;
					productArea.append(div);
				}
				
				if(jsonObj.sender===self){
					let div = document.createElement('div');
					let html="<div class='user local'><div class='avatar'>";
					html+="<div class='pic'><img src=''></div>";
					html+="<div class='name'>"+selfName+"</div></div>";
					html+="<div class='text'>"+jsonObj.message+"</div></div>";
					div.innerHTML= html;
					messagesArea.append(div);
				}else{
					let div = document.createElement('div');
					let html="<div class='user remote'><div class='avatar'>";
					html+="<div class='pic'><img src=''></div>";
					html+="<div class='name'>"+"admin"+"</div></div>";
					html+="<div class='text'>"+jsonObj.message+"</div></div>";
					div.innerHTML= html;
					messagesArea.append(div);
				}
				dialogue.scrollTop = dialogue.scrollHeight;
			}
		};

		webSocket.onclose = function(event) {
			console.log("Disconnected!");
		};
	}
	
	function sendMessage() {
		var inputMessage = document.getElementById("message");
		var message = inputMessage.value.trim();

		if (message === "") {
			alert("Input a message");
			inputMessage.focus();
		} else {
			var jsonObj = {
				"type" : "chat",
				"lesID":lesID,
				"comID":comID,
				"sender" : "member"+memID,
				"receiver" : "admin",
				"message" : message
			};
			webSocket.send(JSON.stringify(jsonObj));
			inputMessage.value = "";
			inputMessage.focus();
		}
	}
	
	function getHistory() {
		var jsonObj = {
				"type" : "history",
				"sender" : "member"+memID,
				"receiver" : "admin",
				"message" : ""
			};
		webSocket.send(JSON.stringify(jsonObj));
	}
	
	function disconnect() {
		webSocket.close();
	}
</script>
   
</body>




</html>