<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en-US">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0" />
  <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
  <link rel="shortcut icon" href="<%=request.getContextPath()%>/resource/images/favicon.ico" />
  <title>EATIN Shop &#8211; Homepage Main | EATIN HTML Template</title>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/bootstrap.min.css" type="text/css" media="all" />
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/font-awesome.min.css" type="text/css" media="all" />
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/ionicons.min.css" type="text/css" media="all" />
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/owl.carousel.css" type="text/css" media="all" />
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/owl.theme.css" type="text/css" media="all" />
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/settings.css" type="text/css" media="all" />
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/style1.css" type="text/css" media="all" />
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/custom1.css" type="text/css" media="all" />
  <link href="http://fonts.googleapis.com/css?family=Great+Vibes%7CLato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet" />
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
            <script src="http://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
            <script src="http://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
  <style type="text/css" media="screen">
    body {

      overflow-y: scroll;
      overflow-x: hidden;

    }
    .itempic {
      display: table-cell;
      border: solid 1.5px #fff;
      box-sizing: border-box;
    }
    .star {
      width: 250px;
      height: 280px;
    }
    .header.scrolling-menu:hover {
      background: #fff;

      -moz-box-shadow: 0 10px 20px rgba(0, 0, 0, .15);
      -webkit-box-shadow: 0 10px 20px rgba(0, 0, 0, .15);
      box-shadow: 0 10px 20px rgba(0, 0, 0, .15);
      z-index: 999;
    }

    #oneline {
      width: 0%;
    }
    #gymbtn {
      background-color: black;
      border-color: black;
    }
    .containerbg {
      padding-right: 47px;
      padding-left: 47px;
      margin-top: 30px;
    }
    .cool {
      margin-left: 80px;
      margin-bottom: -21px;
    }

  </style>
</head>

<body>
  <header id="header" class="header header-desktop header-2">
    <div class="container">
      <div class="row">
        <div class="col-md-3">
          <a href="html-EATIN.html" id="logo">
            <img class="logo-image" src="<%=request.getContextPath()%>/resource/images/logo1.png" alt="EATIN Logo" />
          </a>
        </div>
        <div class="col-md-9">
          <div class="header-right">
            <nav class="menu">
              <ul class="main-menu">
                <li class="mega-menu">
                  <a href="html-EATIN.html">Home</a>
                </li>
                <li class="dropdown">
                  <a href="#">Course</a>
                  <ul class="sub-menu">
                    <li><a href="#">Course</a></li>
                    <li><a href="#">Coach</a></li>
                    <li><a href="#">About</a></li>
                  </ul>
                </li>
                <li class="dropdown">
                  <a href="#">Shop</a>
                  <ul class="sub-menu">
                    <li><a href="#">Best Sellers</a></li>
                    <li><a href="#">New Products</a></li>
                    <li><a href="#">Shopping Cart</a></li>
                    <li><a href="#">Wishlist</a></li>
                  </ul>
                </li>
                <li class="dropdown">
                  <a href="#">Recipe</a>
                  <ul class="sub-menu">
                    <li><a href="#">Blog List</a></li>
                    <li><a href="#">Blog Classic</a></li>
                    <li><a href="#">Blog Masonry</a></li>
                    <li><a href="#">Blog Single</a></li>
                  </ul>
                </li>
                <li>
                  <a href="#">Login</a>
                </li>
              </ul>
            </nav>
            <div class="btn-wrap">
              <div class="mini-cart-wrap">
                <div class="mini-cart">
                  <div class="mini-cart-icon">
                    <i class="ion-bag"></i>
                  </div>
                </div>
                <div class="widget-shopping-cart-content">
                  <ul class="cart-list">
                    <li>
                      <a href="#" class="remove">×</a>
                      <a href="shop-detail.html">
                        <img src="<%=request.getContextPath()%>/resource/images/shop/thumb/shop_1.jpg" alt="" />
                        Orange Juice&nbsp;
                      </a>
                      <span class="quantity">1 × $12.00</span>
                    </li>
                    <li>
                      <a href="#" class="remove">×</a>
                      <a href="shop-detail.html">
                        <img src="<%=request.getContextPath()%>/resource/images/shop/thumb/shop_2.jpg" alt="" />
                        Aurore Grape&nbsp;
                      </a>
                      <span class="quantity">1 × $9.00</span>
                    </li>
                  </ul>
                  <p class="total">
                    <strong>Subtotal:</strong>
                    <span class="amount">$21.00</span>
                  </p>
                  <p class="buttons">
                    <a href="cart.html" class="view-cart">View cart</a>
                    <a href="checkout.html" class="checkout">Checkout</a>
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </header>
  <header class="header header-mobile" id="nav123">
    <div class="container">
      <div class="row">
        <div class="col-xs-2">
          <div class="header-left">
            <div id="open-left"><i class="ion-navicon"></i></div>
          </div>
        </div>
        <div class="col-xs-8">
          <div class="header-center">
            <a href="html-EATIN.html" id="logo-2">
              <img class="logo-image" src="<%=request.getContextPath()%>/resource/images/logo1.png" alt="EATIN Logo" />
            </a>
          </div>
        </div>
        <div class="col-xs-2">
          <div class="header-right">
            <div class="mini-cart-wrap">
              <a href="cart.html">
                <div class="mini-cart">
                  <div class="mini-cart-icon" data-count="2">
                    <i class="ion-bag"></i>
                  </div>
                </div>
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </header>
  <div id="main">
    <div class="section">
      <div class="container-fluid">
        <div class="row">
          <div class="col-sm-12 p-0">
            <div id="rev_slider" class="rev_slider fullscreenbanner">
              <ul>
                <li data-transition="fade" data-slotamount="default" data-hideafterloop="0" data-hideslideonmobile="off" data-easein="default" data-easeout="default" data-masterspeed="300" data-rotate="0" data-saveperformance="off" data-title="Slide">
                  <div>
                    <video autoplay muted loop id="myVideo">
                      <source src="<%=request.getContextPath()%>/resource/vedio/strawberry2.mp4" type="video/mp4">
                    </video>
                  </div>
                </li>
                <li data-transition="fade" data-slotamount="default" data-hideafterloop="0" data-hideslideonmobile="off" data-easein="default" data-easeout="default" data-masterspeed="300" data-rotate="0" data-saveperformance="off" data-title="Slide">
                  <img src="<%=request.getContextPath()%>/resource/images/slider/slide_bg_4.jpg" alt="" data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="off" class="rev-slidebg" />
                  <div class="tp-caption rs-parallaxlevel-2" data-x="center" data-hoffset="" data-y="center" data-voffset="-80" data-width="['none','none','none','none']" data-height="['none','none','none','none']" data-type="image" data-responsive_offset="on" data-frames='[{"delay":0,"speed":300,"frame":"0","from":"opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"opacity:0;","ease":"Power3.easeInOut"}]' data-textAlign="['inherit','inherit','inherit','inherit']" data-paddingtop="[0,0,0,0]" data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]" data-paddingleft="[0,0,0,0]">
                    <img src="<%=request.getContextPath()%>/resource/images/slider/slide_6.png" alt="" style="margin-top: 100px;" />
                  </div>
                  <div class="tp-caption rs-parallaxlevel-1" data-x="center" data-hoffset="" data-y="center" data-voffset="-120" data-width="['none','none','none','none']" data-height="['none','none','none','none']" data-type="image" data-responsive_offset="on" data-frames='[{"delay":0,"speed":1500,"frame":"0","from":"z:0;rX:0;rY:0;rZ:0;sX:0.9;sY:0.9;skX:0;skY:0;opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"opacity:0;","ease":"Power3.easeInOut"}]' data-textAlign="['inherit','inherit','inherit','inherit']" data-paddingtop="[0,0,0,0]" data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]" data-paddingleft="[0,0,0,0]">
                    <img src="<%=request.getContextPath()%>/resource/images/slider/slide_logo2.png" style="margin-top: 100px;" />
                  </div>
                  <a class="tp-caption btn-2 hidden-xs" href="#" data-x="['center','center','center','center']" data-y="['center','center','center','center']" data-voffset="['260','260','260','260']" data-width="['auto']" data-height="['auto']" data-type="button" data-responsive_offset="on" data-responsive="off" data-frames='[{"delay":0,"speed":300,"frame":"0","from":"opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"opacity:0;","ease":"Power3.easeInOut"},{"frame":"hover","speed":"300","ease":"Power0.easeIn","to":"o:1;rX:0;rY:0;rZ:0;z:0;","style":"c:rgb(95,189,116);bg:rgba(51, 51, 51, 0);"}]' data-textAlign="['inherit','inherit','inherit','inherit']" data-paddingtop="[16,16,16,16]" data-paddingright="[30,30,30,30]" data-paddingbottom="[16,16,16,16]" data-paddingleft="[30,30,30,30]">Shop Now
                  </a>
                </li>
                <li data-transition="fade" data-slotamount="default" data-hideafterloop="0" data-hideslideonmobile="off" data-easein="default" data-easeout="default" data-masterspeed="300" data-rotate="0" data-saveperformance="off" data-title="Slide">
                  <img src="<%=request.getContextPath()%>/resource/images/gym/gym21.jpg" alt="" data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="off" class="rev-slidebg" />
                  <div class="tp-caption rs-parallaxlevel-1" data-x="right" data-hoffset="" data-y="right" data-voffset="-120" data-width="['none','none','none','none']" data-height="['none','none','none','none']" data-type="image" data-responsive_offset="on" data-frames='[{"delay":0,"speed":1500,"frame":"0","from":"z:0;rX:0;rY:0;rZ:0;sX:0.9;sY:0.9;skX:0;skY:0;opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"opacity:0;","ease":"Power3.easeInOut"}]' data-textAlign="['inherit','inherit','inherit','inherit']" data-paddingtop="[0,0,0,0]" data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]" data-paddingleft="[0,0,0,0]">
                    <img src="<%=request.getContextPath()%>/resource/images/gym/gymp2.png" style=" margin-right:-50px;margin-top:-30px" alt="" />
                  </div>
                  <a class="tp-caption btn-2 hidden-xs" id="gymbtn" href="#" data-x="['center','center','center','center']" data-y="['center','center','center','center']" data-voffset="['260','260','260','260']" data-width="['auto']" data-height="['auto']" data-type="button" data-responsive_offset="on" data-responsive="off" data-frames='[{"delay":0,"speed":300,"frame":"0","from":"opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"opacity:0;","ease":"Power3.easeInOut"},{"frame":"hover","speed":"300","ease":"Power0.easeIn","to":"o:1;rX:0;rY:0;rZ:0;z:0;","style":"c:black;bg:rgba(51, 51, 51, 0);"}]' data-textAlign="['inherit','inherit','inherit','inherit']" data-paddingtop="[16,16,16,16]" data-paddingright="[30,30,30,30]" data-paddingbottom="[16,16,16,16]" data-paddingleft="[30,30,30,30]">Join Now
                  </a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="section section-bg-1 section-cover pt-17 pb-3">
      <div class="container">
        <div class="row">
          <div data-aos="zoom-in-up">
            <div class="col-sm-6">
              <div class="mt-3 mb-3">
                <img id="move" src="<%=request.getContextPath()%>/resource/images/oranges.png" alt="" />
              </div>
            </div>
          </div>
          <div data-aos="fade-up" data-aos-anchor-placement="center-center">
            <div class="col-sm-6">
              <div class="mb-1 section-pretitle default-left">Welcome to</div>
              <h2 class="section-title mtn-2 mb-3">EATIN Store</h2>
              <p class="mb-4">
                EATIN store opened its doors in 1990, it was David's dream to offer the best and widest range of organic foods available, and his mission to promote health in the community and to bring a sense of discovery and adventure into food shopping.
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="changepic">
      <div data-aos="zoom-out">
        <div class="text-center mb-1 section-pretitle">Tasty & Function</div>
        <h2 class="text-center section-title mtn-2">EATIN Store</h2>
      </div>
      <h1 class="text-center section-title mtn-2" style="opacity:0">EATIN Store</h1>
      <div class="container">
        <div class="row">
          <div class="col-6">
            <div class="itempic" data-aos="fade-down"><img class='star' id='star1' src="<%=request.getContextPath()%>/resource/images/change/a_01.jpg" alt=""></div>
            <div class="itempic" data-aos="fade-up"><img class='star' id='star2' src="<%=request.getContextPath()%>/resource/images/change/b_01.jpg" alt=""></div>
            <div class="itempic" data-aos="fade-down"><img class='star' id='star3' src="<%=request.getContextPath()%>/resource/images/change/g_01.jpg" alt=""></div>
            <div class="itempic" data-aos="fade-up"><img class='star' id='star4' src="<%=request.getContextPath()%>/resource/images/change/d_01.jpg" alt=""></div>
            <div class="itempic" data-aos="fade-down"><img class='star' id='star5' src="<%=request.getContextPath()%>/resource/images/change/e_01.jpg" alt=""></div>
          </div>
        </div>
        <div class="row">
          <div class="col-6">
            <div class="itempic" data-aos="fade-up"><img class='star' id='star6' src="<%=request.getContextPath()%>/resource/images/change/z_01.jpg" alt=""></div>
            <div class="itempic" data-aos="fade-down"><img class='star' id='star7' src="<%=request.getContextPath()%>/resource/images/change/x_01.jpg" alt=""></div>
            <div class="itempic" data-aos="fade-up"><img class='star' id='star8' src="<%=request.getContextPath()%>/resource/images/change/y_01.jpg" alt=""></div>
            <div class="itempic" data-aos="fade-down"><img class='star' id='star9' src="<%=request.getContextPath()%>/resource/images/change/r_01.jpg" alt=""></div>
            <div class="itempic" data-aos="fade-up"><img class='star' id='star10' src="<%=request.getContextPath()%>/resource/images/change/q_01.jpg" alt=""></div>
          </div>
        </div>
      </div>
    </div>
    <div class="containerbg">
      <div class="section section-bg-2 section-cover pt-17 pb-3">
        <div class="row">
          <div class="col-sm-12">
            <div data-aos="zoom-out">
              <div class="text-center mb-1 section-pretitle">Keep Healthy</div>
              <h2 class="text-center section-title mtn-2" style="color: white">IN Course</h2>
            </div>
            <div class="EATIN-seperator center mb-6">
              <span class="sep-holder"><span class="sep-line"></span></span>
              <div class="sep-icon"><i class="EATIN-flower"></i></div>
              <span class="sep-holder"><span class="sep-line"></span></span>
            </div>
          </div>
          <div class="col-sm-6">
            <div class="accordion icon-left" id="accordion1">
              <div class="accordion-group toggle">
              </div>
            </div>
          </div>
          <div class="col-sm-6">
            <div data-aos="zoom-in-up">
              <div class="text-center app-desc floating">
                <img src="<%=request.getContextPath()%>/resource/images/gym/gymp4_2.png" alt="" class="cool" />
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div data-aos="zoom-out">
      <div class="related-title">
        <div class="text-center mb-1 section-pretitle">Find Delicious</div>
        <h2 class="text-center section-title mtn-2">IN Products</h2>
      </div>
    </div>
    <div data-aos="fade-right">
      <div class="product-carousel p-0" data-auto-play="true" data-desktop="4" data-laptop="2" data-tablet="2" data-mobile="1">
        <div class="product-item text-center">
          <div class="product-thumb">
            <a href="shop-detail.html">
              <img src="<%=request.getContextPath()%>/resource/images/shop/shop_5.jpg" alt="" />
            </a>
            <div class="product-action">
              <span class="add-to-cart">
                <a href="#" data-toggle="tooltip" data-placement="top" title="Add to cart"></a>
              </span>
              <span class="wishlist">
                <a href="#" data-toggle="tooltip" data-placement="top" title="Add to wishlist"></a>
              </span>
              <span class="quickview">
                <a href="#" data-toggle="tooltip" data-placement="top" title="Quickview"></a>
              </span>
            </div>
          </div>
          <div class="product-info">
            <a href="shop-detail.html">
              <h2 class="title">Carrot</h2>
              <span class="price">$12.00</span>
            </a>
          </div>
        </div>
        <div class="product-item text-center">
          <div class="product-thumb">
            <a href="shop-detail.html">
              <img src="<%=request.getContextPath()%>/resource/images/shop/shop_6.jpg" alt="" />
            </a>
            <div class="product-action">
              <span class="add-to-cart">
                <a href="#" data-toggle="tooltip" data-placement="top" title="Add to cart"></a>
              </span>
              <span class="wishlist">
                <a href="#" data-toggle="tooltip" data-placement="top" title="Add to wishlist"></a>
              </span>
              <span class="quickview">
                <a href="#" data-toggle="tooltip" data-placement="top" title="Quickview"></a>
              </span>
            </div>
          </div>
          <div class="product-info">
            <a href="shop-detail.html">
              <h2 class="title">Sprouting Broccoli</h2>
              <span class="price">$6.00</span>
            </a>
          </div>
        </div>
        <div class="product-item text-center">
          <div class="product-thumb">
            <a href="shop-detail.html">
              <img src="<%=request.getContextPath()%>/resource/images/shop/shop_7.jpg" alt="" />
            </a>
            <div class="product-action">
              <span class="add-to-cart">
                <a href="#" data-toggle="tooltip" data-placement="top" title="Add to cart"></a>
              </span>
              <span class="wishlist">
                <a href="#" data-toggle="tooltip" data-placement="top" title="Add to wishlist"></a>
              </span>
              <span class="quickview">
                <a href="#" data-toggle="tooltip" data-placement="top" title="Quickview"></a>
              </span>
            </div>
          </div>
          <div class="product-info">
            <a href="shop-detail.html">
              <h2 class="title">Chinese Cabbage</h2>
              <span class="price">$9.00</span>
            </a>
          </div>
        </div>
        <div class="product-item text-center">
          <div class="product-thumb">
            <a href="shop-detail.html">
              <img src="<%=request.getContextPath()%>/resource/images/shop/shop_6.jpg" alt="" />
            </a>
            <div class="product-action">
              <span class="add-to-cart">
                <a href="#" data-toggle="tooltip" data-placement="top" title="Add to cart"></a>
              </span>
              <span class="wishlist">
                <a href="#" data-toggle="tooltip" data-placement="top" title="Add to wishlist"></a>
              </span>
              <span class="quickview">
                <a href="#" data-toggle="tooltip" data-placement="top" title="Quickview"></a>
              </span>
            </div>
          </div>
          <div class="product-info">
            <a href="shop-detail.html">
              <h2 class="title">Sprouting Broccoli</h2>
              <span class="price">$6.00</span>
            </a>
          </div>
        </div>
        <div class="product-item text-center">
          <div class="product-thumb">
            <a href="shop-detail.html">
              <img src="<%=request.getContextPath()%>/resource/images/shop/shop_6.jpg" alt="" />
            </a>
            <div class="product-action">
              <span class="add-to-cart">
                <a href="#" data-toggle="tooltip" data-placement="top" title="Add to cart"></a>
              </span>
              <span class="wishlist">
                <a href="#" data-toggle="tooltip" data-placement="top" title="Add to wishlist"></a>
              </span>
              <span class="quickview">
                <a href="#" data-toggle="tooltip" data-placement="top" title="Quickview"></a>
              </span>
            </div>
          </div>
          <div class="product-info">
            <a href="shop-detail.html">
              <h2 class="title">Sprouting Broccoli</h2>
              <span class="price">$6.00</span>
            </a>
          </div>
        </div>
        <div class="product-item text-center">
          <div class="product-thumb">
            <a href="shop-detail.html">
              <img src="<%=request.getContextPath()%>/resource/images/shop/shop_6.jpg" alt="" />
            </a>
            <div class="product-action">
              <span class="add-to-cart">
                <a href="#" data-toggle="tooltip" data-placement="top" title="Add to cart"></a>
              </span>
              <span class="wishlist">
                <a href="#" data-toggle="tooltip" data-placement="top" title="Add to wishlist"></a>
              </span>
              <span class="quickview">
                <a href="#" data-toggle="tooltip" data-placement="top" title="Quickview"></a>
              </span>
            </div>
          </div>
          <div class="product-info">
            <a href="shop-detail.html">
              <h2 class="title">Sprouting Broccoli</h2>
              <span class="price">$6.00</span>
            </a>
          </div>
        </div>
        <div class="product-item text-center">
          <div class="product-thumb">
            <a href="shop-detail.html">
              <div class="badges">
                <span class="hot">Hot</span>
              </div>
              <img src="<%=request.getContextPath()%>/resource/images/shop/shop_8.jpg" alt="" />
            </a>
            <div class="product-action">
              <span class="add-to-cart">
                <a href="#" data-toggle="tooltip" data-placement="top" title="Add to cart"></a>
              </span>
              <span class="wishlist">
                <a href="#" data-toggle="tooltip" data-placement="top" title="Add to wishlist"></a>
              </span>
              <span class="quickview">
                <a href="#" data-toggle="tooltip" data-placement="top" title="Quickview"></a>
              </span>
            </div>
          </div>
          <div class="product-info">
            <a href="shop-detail.html">
              <h2 class="title">Tieton Cherry</h2>
              <span class="price">$9.00</span>
            </a>
          </div>
        </div>
      </div>
    </div>
    <div class="section pt-12">
      <div class="container">
        <div class="row">
          <div class="col-sm-12">
            <div data-aos="zoom-out">
              <div class="text-center mb-1 section-pretitle">Select Wealthy</div>
              <h2 class="text-center section-title mtn-2">IN Recipe</h2>
            </div>
            <div class="EATIN-seperator center mb-6">
              <span class="sep-holder"><span class="sep-line"></span></span>
              <div class="sep-icon"><i class="EATIN-flower"></i></div>
              <span class="sep-holder"><span class="sep-line"></span></span>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-4">
            <div data-aos="fade-up" data-aos-duration="100">
              <div class="blog-grid-item">
                <div class="post-thumbnail">
                  <a href="blog-detail.html">
                    <div id="hoverimg">
                      <img src="<%=request.getContextPath()%>/resource/images/blog/blog_1.jpg" alt="" />
                    </div>
                  </a>
                </div>
                <div class="post-content">
                  <div class="entry-meta">
                    <span class="posted-on">
                      <i class="ion-calendar"></i>
                      <span>August 9, 2016</span>
                    </span>
                    <span class="comment">
                      <i class="ion-chatbubble-working"></i> 0
                    </span>
                  </div>
                  <a href="blog-detail.html">
                    <h1 class="entry-title">How to steam &amp; purée your sugar pie pumkin</h1>
                  </a>
                  <div class="entry-content">
                    Cut the halves into smaller pieces and place in a large pot of water with a steam basket to keep the pumpkin pieces from touching…
                  </div>
                  <div class="entry-more">
                    <a href="blog-detail.html">Read more</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div data-aos="fade-up" data-aos-duration="600">
              <div class="blog-grid-item">
                <div class="post-thumbnail">
                  <a href="blog-detail.html">
                    <img src="<%=request.getContextPath()%>/resource/images/blog/blog_2.jpg" alt="" />
                  </a>
                </div>
                <div class="post-content">
                  <div class="entry-meta">
                    <span class="posted-on">
                      <i class="ion-calendar"></i>
                      <span>August 9, 2016</span>
                    </span>
                    <span class="comment">
                      <i class="ion-chatbubble-working"></i> 0
                    </span>
                  </div>
                  <a href="blog-detail.html">
                    <h1 class="entry-title">Great bulk recipes to help use all your organic vegetables</h1>
                  </a>
                  <div class="entry-content">
                    A fridge full of organic vegetables purchased or harvested with the best of intentions, and then life gets busy, leaving no time to peel,
                  </div>
                  <div class="entry-more">
                    <a href="blog-detail.html">Read more</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="blog-grid-item">
              <div data-aos="fade-up" data-aos-duration="1100">
                <div class="post-thumbnail">
                  <a href="blog-detail.html">
                    <img src="<%=request.getContextPath()%>/resource/images/blog/blog_1.jpg" alt="" />
                  </a>
                </div>
                <div class="post-content">
                  <div class="entry-meta">
                    <span class="posted-on">
                      <i class="ion-calendar"></i>
                      <span>August 9, 2016</span>
                    </span>
                    <span class="comment">
                      <i class="ion-chatbubble-working"></i> 0
                    </span>
                  </div>
                  <a href="blog-detail.html">
                    <h1 class="entry-title">How can salmon be raised organically in fish farms?</h1>
                  </a>
                  <div class="entry-content">
                    Organic food consumption is rapidly increasing. The heightened interest in the global environment and a willingness to look
                  </div>
                  <div class="entry-more">
                    <a href="blog-detail.html">Read more</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-sm-12" id="oneline">
            <hr class="mt-7 mb-3" />
          </div>
        </div>
      </div>
    </div>
    <div class="copyright">
      <div class="container">
        <div class="row">
          <div class="col-md-8">
            Welcome to <a href="#">EATIN Store</a> - All you need is health.
          </div>
          <div class="col-md-4">
            <img src="<%=request.getContextPath()%>/resource/images/footer_payment.png" alt="" />
          </div>
        </div>
      </div>
      <div class="backtotop" id="backtotop"></div>
    </div>
  </div>
  <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.min.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery-migrate.min.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/modernizr-2.7.1.min.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/owl.carousel.min.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.countdown.min.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/imagesloaded.pkgd.min.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/isotope.pkgd.min.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.isotope.init.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/script.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.themepunch.tools.min.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.themepunch.revolution.min.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/extensions/revolution.extension.video.min.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/extensions/revolution.extension.slideanims.min.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/extensions/revolution.extension.actions.min.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/extensions/revolution.extension.layeranimation.min.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/extensions/revolution.extension.kenburn.min.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/extensions/revolution.extension.navigation.min.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/extensions/revolution.extension.migration.min.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/extensions/revolution.extension.parallax.min.js"></script>
  <script type="text/javascript">
    $("#star1").hover(function() {
      $("#star1").fadeOut(100, function() {
        $("#star1").attr('src', '<%=request.getContextPath()%>/resource/images/change/a_01.jpg');
        $("#star1").fadeIn();
      });

      $("#star2").fadeOut(200, function() {
        $("#star2").attr('src', '<%=request.getContextPath()%>/resource/images/change/a_02.jpg');
        $("#star2").fadeIn();
      });

      $("#star3").fadeOut(300, function() {
        $("#star3").attr('src', '<%=request.getContextPath()%>/resource/images/change/a_03.jpg');
        $("#star3").fadeIn();
      });

      $("#star4").fadeOut(400, function() {
        $("#star4").attr('src', '<%=request.getContextPath()%>/resource/images/change/a_04.jpg');
        $("#star4").fadeIn();
      });

      $("#star5").fadeOut(500, function() {
        $("#star5").attr('src', '<%=request.getContextPath()%>/resource/images/change/a_05.jpg');
        $("#star5").fadeIn();
      });

      $("#star6").fadeOut(100, function() {
        $("#star6").attr('src', '<%=request.getContextPath()%>/resource/images/change/a_06.jpg');
        $("#star6").fadeIn();
      });

      $("#star7").fadeOut(200, function() {
        $("#star7").attr('src', '<%=request.getContextPath()%>/resource/images/change/a_07.jpg');
        $("#star7").fadeIn();
      });

      $("#star8").fadeOut(300, function() {
        $("#star8").attr('src', '<%=request.getContextPath()%>/resource/images/change/a_08.jpg');
        $("#star8").fadeIn();
      });

      $("#star9").fadeOut(400, function() {
        $("#star9").attr('src', '<%=request.getContextPath()%>/resource/images/change/a_09.jpg');
        $("#star9").fadeIn();
      });
      $("#star10").fadeOut(500, function() {
        $("#star10").attr('src', '<%=request.getContextPath()%>/resource/images/change/a_10.jpg');
        $("#star10").fadeIn();
      });

    }, function() {
      $("#star1").attr('src', '<%=request.getContextPath()%>/resource/images/change/a_01.jpg');
      $("#star2").attr('src', '<%=request.getContextPath()%>/resource/images/change/b_02.jpg');
      $("#star3").attr('src', '<%=request.getContextPath()%>/resource/images/change/g_03.jpg');
      $("#star4").attr('src', '<%=request.getContextPath()%>/resource/images/change/d_04.jpg');
      $("#star5").attr('src', '<%=request.getContextPath()%>/resource/images/change/e_05.jpg');
      $("#star6").attr('src', '<%=request.getContextPath()%>/resource/images/change/z_06.jpg');
      $("#star7").attr('src', '<%=request.getContextPath()%>/resource/images/change/y_07.jpg');
      $("#star8").attr('src', '<%=request.getContextPath()%>/resource/images/change/x_08.jpg');
      $("#star9").attr('src', '<%=request.getContextPath()%>/resource/images/change/r_09.jpg');
      $("#star10").attr('src', '<%=request.getContextPath()%>/resource/images/change/q_10.jpg');

    });


    $("#star2").hover(function() {
      $("#star1").fadeOut(200, function() {
        $("#star1").attr('src', '<%=request.getContextPath()%>/resource/images/change/b_01.jpg');
        $("#star1").fadeIn();
      });

      $("#star2").fadeOut(100, function() {
        $("#star2").attr('src', '<%=request.getContextPath()%>/resource/images/change/b_02.jpg');
        $("#star2").fadeIn();
      });

      $("#star3").fadeOut(200, function() {
        $("#star3").attr('src', '<%=request.getContextPath()%>/resource/images/change/b_03.jpg');
        $("#star3").fadeIn();
      });

      $("#star4").fadeOut(300, function() {
        $("#star4").attr('src', '<%=request.getContextPath()%>/resource/images/change/b_04.jpg');
        $("#star4").fadeIn();
      });

      $("#star5").fadeOut(400, function() {
        $("#star5").attr('src', '<%=request.getContextPath()%>/resource/images/change/b_05.jpg');
        $("#star5").fadeIn();
      });

      $("#star6").fadeOut(200, function() {
        $("#star6").attr('src', '<%=request.getContextPath()%>/resource/images/change/b_06.jpg');
        $("#star6").fadeIn();
      });

      $("#star7").fadeOut(100, function() {
        $("#star7").attr('src', '<%=request.getContextPath()%>/resource/images/change/b_07.jpg');
        $("#star7").fadeIn();
      });

      $("#star8").fadeOut(200, function() {
        $("#star8").attr('src', '<%=request.getContextPath()%>/resource/images/change/b_08.jpg');
        $("#star8").fadeIn();
      });

      $("#star9").fadeOut(300, function() {
        $("#star9").attr('src', '<%=request.getContextPath()%>/resource/images/change/b_09.jpg');
        $("#star9").fadeIn();
      });
      $("#star10").fadeOut(400, function() {
        $("#star10").attr('src', '<%=request.getContextPath()%>/resource/images/change/b_10.jpg');
        $("#star10").fadeIn();
      });


    }, function() {
      $("#star1").attr('src', '<%=request.getContextPath()%>/resource/images/change/a_01.jpg');
      $("#star2").attr('src', '<%=request.getContextPath()%>/resource/images/change/b_02.jpg');
      $("#star3").attr('src', '<%=request.getContextPath()%>/resource/images/change/g_03.jpg');
      $("#star4").attr('src', '<%=request.getContextPath()%>/resource/images/change/d_04.jpg');
      $("#star5").attr('src', '<%=request.getContextPath()%>/resource/images/change/e_05.jpg');
      $("#star6").attr('src', '<%=request.getContextPath()%>/resource/images/change/z_06.jpg');
      $("#star7").attr('src', '<%=request.getContextPath()%>/resource/images/change/y_07.jpg');
      $("#star8").attr('src', '<%=request.getContextPath()%>/resource/images/change/x_08.jpg');
      $("#star9").attr('src', '<%=request.getContextPath()%>/resource/images/change/r_09.jpg');
      $("#star10").attr('src', '<%=request.getContextPath()%>/resource/images/change/q_10.jpg');

    });


    $("#star3").hover(function() {
      $("#star1").fadeOut(300, function() {
        $("#star1").attr('src', '<%=request.getContextPath()%>/resource/images/change/g_01.jpg');
        $("#star1").fadeIn();
      });

      $("#star2").fadeOut(200, function() {
        $("#star2").attr('src', '<%=request.getContextPath()%>/resource/images/change/g_02.jpg');
        $("#star2").fadeIn();
      });

      $("#star3").fadeOut(100, function() {
        $("#star3").attr('src', '<%=request.getContextPath()%>/resource/images/change/g_03.jpg');
        $("#star3").fadeIn();
      });

      $("#star4").fadeOut(200, function() {
        $("#star4").attr('src', '<%=request.getContextPath()%>/resource/images/change/g_04.jpg');
        $("#star4").fadeIn();
      });

      $("#star5").fadeOut(300, function() {
        $("#star5").attr('src', '<%=request.getContextPath()%>/resource/images/change/g_05.jpg');
        $("#star5").fadeIn();
      });

      $("#star6").fadeOut(300, function() {
        $("#star6").attr('src', '<%=request.getContextPath()%>/resource/images/change/g_06.jpg');
        $("#star6").fadeIn();
      });

      $("#star7").fadeOut(200, function() {
        $("#star7").attr('src', '<%=request.getContextPath()%>/resource/images/change/g_07.jpg');
        $("#star7").fadeIn();
      });

      $("#star8").fadeOut(100, function() {
        $("#star8").attr('src', '<%=request.getContextPath()%>/resource/images/change/g_08.jpg');
        $("#star8").fadeIn();
      });

      $("#star9").fadeOut(200, function() {
        $("#star9").attr('src', '<%=request.getContextPath()%>/resource/images/change/g_09.jpg');
        $("#star9").fadeIn();
      });
      $("#star10").fadeOut(300, function() {
        $("#star10").attr('src', '<%=request.getContextPath()%>/resource/images/change/g_10.jpg');
        $("#star10").fadeIn();
      });


    }, function() {
      $("#star1").attr('src', '<%=request.getContextPath()%>/resource/images/change/a_01.jpg');
      $("#star2").attr('src', '<%=request.getContextPath()%>/resource/images/change/b_02.jpg');
      $("#star3").attr('src', '<%=request.getContextPath()%>/resource/images/change/g_03.jpg');
      $("#star4").attr('src', '<%=request.getContextPath()%>/resource/images/change/d_04.jpg');
      $("#star5").attr('src', '<%=request.getContextPath()%>/resource/images/change/e_05.jpg');
      $("#star6").attr('src', '<%=request.getContextPath()%>/resource/images/change/z_06.jpg');
      $("#star7").attr('src', '<%=request.getContextPath()%>/resource/images/change/y_07.jpg');
      $("#star8").attr('src', '<%=request.getContextPath()%>/resource/images/change/x_08.jpg');
      $("#star9").attr('src', '<%=request.getContextPath()%>/resource/images/change/r_09.jpg');
      $("#star10").attr('src', '<%=request.getContextPath()%>/resource/images/change/q_10.jpg');

    });




    $("#star4").hover(function() {
      $("#star1").fadeOut(400, function() {
        $("#star1").attr('src', '<%=request.getContextPath()%>/resource/images/change/d_01.jpg');
        $("#star1").fadeIn();
      });

      $("#star2").fadeOut(300, function() {
        $("#star2").attr('src', '<%=request.getContextPath()%>/resource/images/change/d_02.jpg');
        $("#star2").fadeIn();
      });

      $("#star3").fadeOut(200, function() {
        $("#star3").attr('src', '<%=request.getContextPath()%>/resource/images/change/d_03.jpg');
        $("#star3").fadeIn();
      });

      $("#star4").fadeOut(100, function() {
        $("#star4").attr('src', '<%=request.getContextPath()%>/resource/images/change/d_04.jpg');
        $("#star4").fadeIn();
      });

      $("#star5").fadeOut(200, function() {
        $("#star5").attr('src', '<%=request.getContextPath()%>/resource/images/change/d_05.jpg');
        $("#star5").fadeIn();
      });

      $("#star6").fadeOut(400, function() {
        $("#star6").attr('src', '<%=request.getContextPath()%>/resource/images/change/d_06.jpg');
        $("#star6").fadeIn();
      });

      $("#star7").fadeOut(300, function() {
        $("#star7").attr('src', '<%=request.getContextPath()%>/resource/images/change/d_07.jpg');
        $("#star7").fadeIn();
      });

      $("#star8").fadeOut(200, function() {
        $("#star8").attr('src', '<%=request.getContextPath()%>/resource/images/change/d_08.jpg');
        $("#star8").fadeIn();
      });

      $("#star9").fadeOut(100, function() {
        $("#star9").attr('src', '<%=request.getContextPath()%>/resource/images/change/d_09.jpg');
        $("#star9").fadeIn();
      });
      $("#star10").fadeOut(200, function() {
        $("#star10").attr('src', '<%=request.getContextPath()%>/resource/images/change/d_10.jpg');
        $("#star10").fadeIn();
      });


    }, function() {
      $("#star1").attr('src', '<%=request.getContextPath()%>/resource/images/change/a_01.jpg');
      $("#star2").attr('src', '<%=request.getContextPath()%>/resource/images/change/b_02.jpg');
      $("#star3").attr('src', '<%=request.getContextPath()%>/resource/images/change/g_03.jpg');
      $("#star4").attr('src', '<%=request.getContextPath()%>/resource/images/change/d_04.jpg');
      $("#star5").attr('src', '<%=request.getContextPath()%>/resource/images/change/e_05.jpg');
      $("#star6").attr('src', '<%=request.getContextPath()%>/resource/images/change/z_06.jpg');
      $("#star7").attr('src', '<%=request.getContextPath()%>/resource/images/change/y_07.jpg');
      $("#star8").attr('src', '<%=request.getContextPath()%>/resource/images/change/x_08.jpg');
      $("#star9").attr('src', '<%=request.getContextPath()%>/resource/images/change/r_09.jpg');
      $("#star10").attr('src', '<%=request.getContextPath()%>/resource/images/change/q_10.jpg');
    });

    $("#star5").hover(function() {
      $("#star1").fadeOut(500, function() {
        $("#star1").attr('src', '<%=request.getContextPath()%>/resource/images/change/e_01.jpg');
        $("#star1").fadeIn();
      });

      $("#star2").fadeOut(400, function() {
        $("#star2").attr('src', '<%=request.getContextPath()%>/resource/images/change/e_02.jpg');
        $("#star2").fadeIn();
      });

      $("#star3").fadeOut(300, function() {
        $("#star3").attr('src', '<%=request.getContextPath()%>/resource/images/change/e_03.jpg');
        $("#star3").fadeIn();
      });

      $("#star4").fadeOut(200, function() {
        $("#star4").attr('src', '<%=request.getContextPath()%>/resource/images/change/e_04.jpg');
        $("#star4").fadeIn();
      });

      $("#star5").fadeOut(100, function() {
        $("#star5").attr('src', '<%=request.getContextPath()%>/resource/images/change/e_05.jpg');
        $("#star5").fadeIn();
      });

      $("#star6").fadeOut(500, function() {
        $("#star6").attr('src', '<%=request.getContextPath()%>/resource/images/change/e_06.jpg');
        $("#star6").fadeIn();
      });

      $("#star7").fadeOut(400, function() {
        $("#star7").attr('src', '<%=request.getContextPath()%>/resource/images/change/e_07.jpg');
        $("#star7").fadeIn();
      });

      $("#star8").fadeOut(300, function() {
        $("#star8").attr('src', '<%=request.getContextPath()%>/resource/images/change/e_08.jpg');
        $("#star8").fadeIn();
      });

      $("#star9").fadeOut(200, function() {
        $("#star9").attr('src', '<%=request.getContextPath()%>/resource/images/change/e_09.jpg');
        $("#star9").fadeIn();
      });
      $("#star10").fadeOut(100, function() {
        $("#star10").attr('src', '<%=request.getContextPath()%>/resource/images/change/e_10.jpg');
        $("#star10").fadeIn();
      });


    }, function() {
      $("#star1").attr('src', '<%=request.getContextPath()%>/resource/images/change/a_01.jpg');
      $("#star2").attr('src', '<%=request.getContextPath()%>/resource/images/change/b_02.jpg');
      $("#star3").attr('src', '<%=request.getContextPath()%>/resource/images/change/g_03.jpg');
      $("#star4").attr('src', '<%=request.getContextPath()%>/resource/images/change/d_04.jpg');
      $("#star5").attr('src', '<%=request.getContextPath()%>/resource/images/change/e_05.jpg');
      $("#star6").attr('src', '<%=request.getContextPath()%>/resource/images/change/z_06.jpg');
      $("#star7").attr('src', '<%=request.getContextPath()%>/resource/images/change/y_07.jpg');
      $("#star8").attr('src', '<%=request.getContextPath()%>/resource/images/change/x_08.jpg');
      $("#star9").attr('src', '<%=request.getContextPath()%>/resource/images/change/r_09.jpg');
      $("#star10").attr('src', '<%=request.getContextPath()%>/resource/images/change/q_10.jpg');

    });

    $("#star6").hover(function() {
      $("#star1").fadeOut(100, function() {
        $("#star1").attr('src', '<%=request.getContextPath()%>/resource/images/change/z_01.jpg');
        $("#star1").fadeIn();
      });

      $("#star2").fadeOut(200, function() {
        $("#star2").attr('src', '<%=request.getContextPath()%>/resource/images/change/z_02.jpg');
        $("#star2").fadeIn();
      });

      $("#star3").fadeOut(300, function() {
        $("#star3").attr('src', '<%=request.getContextPath()%>/resource/images/change/z_03.jpg');
        $("#star3").fadeIn();
      });

      $("#star4").fadeOut(400, function() {
        $("#star4").attr('src', '<%=request.getContextPath()%>/resource/images/change/z_04.jpg');
        $("#star4").fadeIn();
      });

      $("#star5").fadeOut(500, function() {
        $("#star5").attr('src', '<%=request.getContextPath()%>/resource/images/change/z_05.jpg');
        $("#star5").fadeIn();
      });

      $("#star6").fadeOut(100, function() {
        $("#star6").attr('src', '<%=request.getContextPath()%>/resource/images/change/z_06.jpg');
        $("#star6").fadeIn();
      });

      $("#star7").fadeOut(200, function() {
        $("#star7").attr('src', '<%=request.getContextPath()%>/resource/images/change/z_07.jpg');
        $("#star7").fadeIn();
      });

      $("#star8").fadeOut(300, function() {
        $("#star8").attr('src', '<%=request.getContextPath()%>/resource/images/change/z_08.jpg');
        $("#star8").fadeIn();
      });

      $("#star9").fadeOut(400, function() {
        $("#star9").attr('src', '<%=request.getContextPath()%>/resource/images/change/z_09.jpg');
        $("#star9").fadeIn();
      });
      $("#star10").fadeOut(500, function() {
        $("#star10").attr('src', '<%=request.getContextPath()%>/resource/images/change/z_10.jpg');
        $("#star10").fadeIn();
      });

    }, function() {
      $("#star1").attr('src', '<%=request.getContextPath()%>/resource/images/change/a_01.jpg');
      $("#star2").attr('src', '<%=request.getContextPath()%>/resource/images/change/b_02.jpg');
      $("#star3").attr('src', '<%=request.getContextPath()%>/resource/images/change/g_03.jpg');
      $("#star4").attr('src', '<%=request.getContextPath()%>/resource/images/change/d_04.jpg');
      $("#star5").attr('src', '<%=request.getContextPath()%>/resource/images/change/e_05.jpg');
      $("#star6").attr('src', '<%=request.getContextPath()%>/resource/images/change/z_06.jpg');
      $("#star7").attr('src', '<%=request.getContextPath()%>/resource/images/change/y_07.jpg');
      $("#star8").attr('src', '<%=request.getContextPath()%>/resource/images/change/x_08.jpg');
      $("#star9").attr('src', '<%=request.getContextPath()%>/resource/images/change/r_09.jpg');
      $("#star10").attr('src', '<%=request.getContextPath()%>/resource/images/change/q_10.jpg');

    });
    $("#star7").hover(function() {
      $("#star1").fadeOut(200, function() {
        $("#star1").attr('src', '<%=request.getContextPath()%>/resource/images/change/y_01.jpg');
        $("#star1").fadeIn();
      });

      $("#star2").fadeOut(100, function() {
        $("#star2").attr('src', '<%=request.getContextPath()%>/resource/images/change/y_02.jpg');
        $("#star2").fadeIn();
      });

      $("#star3").fadeOut(200, function() {
        $("#star3").attr('src', '<%=request.getContextPath()%>/resource/images/change/y_03.jpg');
        $("#star3").fadeIn();
      });

      $("#star4").fadeOut(300, function() {
        $("#star4").attr('src', '<%=request.getContextPath()%>/resource/images/change/y_04.jpg');
        $("#star4").fadeIn();
      });

      $("#star5").fadeOut(400, function() {
        $("#star5").attr('src', '<%=request.getContextPath()%>/resource/images/change/y_05.jpg');
        $("#star5").fadeIn();
      });

      $("#star6").fadeOut(200, function() {
        $("#star6").attr('src', '<%=request.getContextPath()%>/resource/images/change/y_06.jpg');
        $("#star6").fadeIn();
      });

      $("#star7").fadeOut(100, function() {
        $("#star7").attr('src', '<%=request.getContextPath()%>/resource/images/change/y_07.jpg');
        $("#star7").fadeIn();
      });

      $("#star8").fadeOut(200, function() {
        $("#star8").attr('src', '<%=request.getContextPath()%>/resource/images/change/y_08.jpg');
        $("#star8").fadeIn();
      });

      $("#star9").fadeOut(300, function() {
        $("#star9").attr('src', '<%=request.getContextPath()%>/resource/images/change/y_09.jpg');
        $("#star9").fadeIn();
      });
      $("#star10").fadeOut(400, function() {
        $("#star10").attr('src', '<%=request.getContextPath()%>/resource/images/change/y_10.jpg');
        $("#star10").fadeIn();
      });


    }, function() {
      $("#star1").attr('src', '<%=request.getContextPath()%>/resource/images/change/a_01.jpg');
      $("#star2").attr('src', '<%=request.getContextPath()%>/resource/images/change/b_02.jpg');
      $("#star3").attr('src', '<%=request.getContextPath()%>/resource/images/change/g_03.jpg');
      $("#star4").attr('src', '<%=request.getContextPath()%>/resource/images/change/d_04.jpg');
      $("#star5").attr('src', '<%=request.getContextPath()%>/resource/images/change/e_05.jpg');
      $("#star6").attr('src', '<%=request.getContextPath()%>/resource/images/change/z_06.jpg');
      $("#star7").attr('src', '<%=request.getContextPath()%>/resource/images/change/y_07.jpg');
      $("#star8").attr('src', '<%=request.getContextPath()%>/resource/images/change/x_08.jpg');
      $("#star9").attr('src', '<%=request.getContextPath()%>/resource/images/change/r_09.jpg');
      $("#star10").attr('src', '<%=request.getContextPath()%>/resource/images/change/q_10.jpg');

    });
    $("#star8").hover(function() {
      $("#star1").fadeOut(300, function() {
        $("#star1").attr('src', '<%=request.getContextPath()%>/resource/images/change/x_01.jpg');
        $("#star1").fadeIn();
      });

      $("#star2").fadeOut(200, function() {
        $("#star2").attr('src', '<%=request.getContextPath()%>/resource/images/change/x_02.jpg');
        $("#star2").fadeIn();
      });

      $("#star3").fadeOut(100, function() {
        $("#star3").attr('src', '<%=request.getContextPath()%>/resource/images/change/x_03.jpg');
        $("#star3").fadeIn();
      });

      $("#star4").fadeOut(200, function() {
        $("#star4").attr('src', '<%=request.getContextPath()%>/resource/images/change/x_04.jpg');
        $("#star4").fadeIn();
      });

      $("#star5").fadeOut(300, function() {
        $("#star5").attr('src', '<%=request.getContextPath()%>/resource/images/change/x_05.jpg');
        $("#star5").fadeIn();
      });

      $("#star6").fadeOut(300, function() {
        $("#star6").attr('src', '<%=request.getContextPath()%>/resource/images/change/x_06.jpg');
        $("#star6").fadeIn();
      });

      $("#star7").fadeOut(200, function() {
        $("#star7").attr('src', '<%=request.getContextPath()%>/resource/images/change/x_07.jpg');
        $("#star7").fadeIn();
      });

      $("#star8").fadeOut(100, function() {
        $("#star8").attr('src', '<%=request.getContextPath()%>/resource/images/change/x_08.jpg');
        $("#star8").fadeIn();
      });

      $("#star9").fadeOut(200, function() {
        $("#star9").attr('src', '<%=request.getContextPath()%>/resource/images/change/x_09.jpg');
        $("#star9").fadeIn();
      });
      $("#star10").fadeOut(300, function() {
        $("#star10").attr('src', '<%=request.getContextPath()%>/resource/images/change/x_10.jpg');
        $("#star10").fadeIn();
      });


    }, function() {
      $("#star1").attr('src', '<%=request.getContextPath()%>/resource/images/change/a_01.jpg');
      $("#star2").attr('src', '<%=request.getContextPath()%>/resource/images/change/b_02.jpg');
      $("#star3").attr('src', '<%=request.getContextPath()%>/resource/images/change/g_03.jpg');
      $("#star4").attr('src', '<%=request.getContextPath()%>/resource/images/change/d_04.jpg');
      $("#star5").attr('src', '<%=request.getContextPath()%>/resource/images/change/e_05.jpg');
      $("#star6").attr('src', '<%=request.getContextPath()%>/resource/images/change/z_06.jpg');
      $("#star7").attr('src', '<%=request.getContextPath()%>/resource/images/change/y_07.jpg');
      $("#star8").attr('src', '<%=request.getContextPath()%>/resource/images/change/x_08.jpg');
      $("#star9").attr('src', '<%=request.getContextPath()%>/resource/images/change/r_09.jpg');
      $("#star10").attr('src', '<%=request.getContextPath()%>/resource/images/change/q_10.jpg');

    });
    $("#star9").hover(function() {
      $("#star1").fadeOut(400, function() {
        $("#star1").attr('src', '<%=request.getContextPath()%>/resource/images/change/r_01.jpg');
        $("#star1").fadeIn();
      });

      $("#star2").fadeOut(300, function() {
        $("#star2").attr('src', '<%=request.getContextPath()%>/resource/images/change/r_02.jpg');
        $("#star2").fadeIn();
      });

      $("#star3").fadeOut(200, function() {
        $("#star3").attr('src', '<%=request.getContextPath()%>/resource/images/change/r_03.jpg');
        $("#star3").fadeIn();
      });

      $("#star4").fadeOut(100, function() {
        $("#star4").attr('src', '<%=request.getContextPath()%>/resource/images/change/r_04.jpg');
        $("#star4").fadeIn();
      });

      $("#star5").fadeOut(200, function() {
        $("#star5").attr('src', '<%=request.getContextPath()%>/resource/images/change/r_05.jpg');
        $("#star5").fadeIn();
      });

      $("#star6").fadeOut(400, function() {
        $("#star6").attr('src', '<%=request.getContextPath()%>/resource/images/change/r_06.jpg');
        $("#star6").fadeIn();
      });

      $("#star7").fadeOut(300, function() {
        $("#star7").attr('src', '<%=request.getContextPath()%>/resource/images/change/r_07.jpg');
        $("#star7").fadeIn();
      });

      $("#star8").fadeOut(200, function() {
        $("#star8").attr('src', '<%=request.getContextPath()%>/resource/images/change/r_08.jpg');
        $("#star8").fadeIn();
      });

      $("#star9").fadeOut(100, function() {
        $("#star9").attr('src', '<%=request.getContextPath()%>/resource/images/change/r_09.jpg');
        $("#star9").fadeIn();
      });
      $("#star10").fadeOut(200, function() {
        $("#star10").attr('src', '<%=request.getContextPath()%>/resource/images/change/r_10.jpg');
        $("#star10").fadeIn();
      });


    }, function() {
      $("#star1").attr('src', '<%=request.getContextPath()%>/resource/images/change/a_01.jpg');
      $("#star2").attr('src', '<%=request.getContextPath()%>/resource/images/change/b_02.jpg');
      $("#star3").attr('src', '<%=request.getContextPath()%>/resource/images/change/g_03.jpg');
      $("#star4").attr('src', '<%=request.getContextPath()%>/resource/images/change/d_04.jpg');
      $("#star5").attr('src', '<%=request.getContextPath()%>/resource/images/change/e_05.jpg');
      $("#star6").attr('src', '<%=request.getContextPath()%>/resource/images/change/z_06.jpg');
      $("#star7").attr('src', '<%=request.getContextPath()%>/resource/images/change/y_07.jpg');
      $("#star8").attr('src', '<%=request.getContextPath()%>/resource/images/change/x_08.jpg');
      $("#star9").attr('src', '<%=request.getContextPath()%>/resource/images/change/r_09.jpg');
      $("#star10").attr('src', '<%=request.getContextPath()%>/resource/images/change/q_10.jpg');
    });
    $("#star10").hover(function() {
      $("#star1").fadeOut(500, function() {
        $("#star1").attr('src', '<%=request.getContextPath()%>/resource/images/change/q_01.jpg');
        $("#star1").fadeIn();
      });

      $("#star2").fadeOut(400, function() {
        $("#star2").attr('src', '<%=request.getContextPath()%>/resource/images/change/q_02.jpg');
        $("#star2").fadeIn();
      });

      $("#star3").fadeOut(300, function() {
        $("#star3").attr('src', '<%=request.getContextPath()%>/resource/images/change/q_03.jpg');
        $("#star3").fadeIn();
      });

      $("#star4").fadeOut(200, function() {
        $("#star4").attr('src', '<%=request.getContextPath()%>/resource/images/change/q_04.jpg');
        $("#star4").fadeIn();
      });

      $("#star5").fadeOut(100, function() {
        $("#star5").attr('src', '<%=request.getContextPath()%>/resource/images/change/q_05.jpg');
        $("#star5").fadeIn();
      });

      $("#star6").fadeOut(500, function() {
        $("#star6").attr('src', '<%=request.getContextPath()%>/resource/images/change/q_06.jpg');
        $("#star6").fadeIn();
      });

      $("#star7").fadeOut(400, function() {
        $("#star7").attr('src', '<%=request.getContextPath()%>/resource/images/change/q_07.jpg');
        $("#star7").fadeIn();
      });

      $("#star8").fadeOut(300, function() {
        $("#star8").attr('src', '<%=request.getContextPath()%>/resource/images/change/q_08.jpg');
        $("#star8").fadeIn();
      });

      $("#star9").fadeOut(200, function() {
        $("#star9").attr('src', '<%=request.getContextPath()%>/resource/images/change/q_09.jpg');
        $("#star9").fadeIn();
      });
      $("#star10").fadeOut(100, function() {
        $("#star10").attr('src', '<%=request.getContextPath()%>/resource/images/change/q_10.jpg');
        $("#star10").fadeIn();
      });


    }, function() {
      $("#star1").attr('src', '<%=request.getContextPath()%>/resource/images/change/a_01.jpg');
      $("#star2").attr('src', '<%=request.getContextPath()%>/resource/images/change/b_02.jpg');
      $("#star3").attr('src', '<%=request.getContextPath()%>/resource/images/change/g_03.jpg');
      $("#star4").attr('src', '<%=request.getContextPath()%>/resource/images/change/d_04.jpg');
      $("#star5").attr('src', '<%=request.getContextPath()%>/resource/images/change/e_05.jpg');
      $("#star6").attr('src', '<%=request.getContextPath()%>/resource/images/change/z_06.jpg');
      $("#star7").attr('src', '<%=request.getContextPath()%>/resource/images/change/y_07.jpg');
      $("#star8").attr('src', '<%=request.getContextPath()%>/resource/images/change/x_08.jpg');
      $("#star9").attr('src', '<%=request.getContextPath()%>/resource/images/change/r_09.jpg');
      $("#star10").attr('src', '<%=request.getContextPath()%>/resource/images/change/q_10.jpg');

    });

  </script>
  <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
  <script>
    AOS.init();

  </script>
</body>

</html>
