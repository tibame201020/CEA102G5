<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">



</style>

<meta charset="UTF-8">
<title>Lesson List</title>
</head>
<body>
    
<link rel="stylesheet" href="<%= request.getContextPath()%>/resource/lesson/css/fullcalendar.min.css">
<script src="<%= request.getContextPath()%>/resource/lesson/js/moment.min.js"></script>
<script src="<%= request.getContextPath()%>/resource/lesson/js/fullcalendar.min.js"></script>
<script defer src="<%= request.getContextPath()%>/resource/lesson/js/listAllLesson.js"></script>
	
		

		<div id = listView></div>


 <div class="modal fade" id="basicModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true" >
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="myModalLabel">課程資訊</h3>
                </div>
                <div class="modal-body">   
<div id=modalView></div>
                </div>
                <div class="modal-footer">
                	<form METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/lesson/les.do" style="display:inline-block;">
                    <input type="hidden" name="action" value="cancelFromList">
                    <input type="hidden" name="lesID" value=>  
					<input type=submit value=取消課程>
                    </form>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    
    
    
     <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true" >
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="myModalLabel">新增課程</h3>
                </div>
                <div class="modal-body">   
<div id=modalView>
	<jsp:include page="addLessonForModal.jsp" />
</div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    
<%--     <c:if test="${!empty openAddPage}"> --%>
<!-- 	    <script type="text/javascript"> -->
<!--  	    	$("#addModal").modal('show'); -->
<!-- 	    </script> -->
<%--     </c:if> --%>
 
 

<script type="text/javascript">
	var servletPathName ="${pageContext.request.requestURI}";
</script>



</body>
</html>