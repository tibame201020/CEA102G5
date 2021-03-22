<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/creditStyle.css">
	<div class="body-text"></div>
  <form action="<%=request.getContextPath()%>/front_end/ordermaster/om.do" method="POST">
    <div class="form-container">
      <div class="personal-information">
        <h1>付款資訊</h1>
      </div> <!-- end of personal-information -->
           
          <input id="column-left" type="text" name="first-name" required="required" placeholder="First Name"/>
          <input id="column-right" type="text" name="last-name" required="required" placeholder="Surname"/>
          <input id="input-field" type="text" name="number" required="required" placeholder="Card Number"/>
          <input id="column-left" type="text" name="expiry" required="required" placeholder="MM / YY"/>
          <input id="column-right" type="text" name="cvc" required="required" placeholder="CCV"/>
         
          <div class="card-wrapper"></div>
      
          <input id="input-button" type="submit" value="確認提交"/>
        	<input type="hidden" name="action"  value="credit">
    </form>
  </div>
  <script type="text/javascript">
  
  </script>
    
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='https://s3-us-west-2.amazonaws.com/s.cdpn.io/121761/card.js'></script>
<script src='https://s3-us-west-2.amazonaws.com/s.cdpn.io/121761/jquery.card.js'></script>
<script  src="<%=request.getContextPath()%>/resource/js/creditScript.js"></script>
</body>
</html>