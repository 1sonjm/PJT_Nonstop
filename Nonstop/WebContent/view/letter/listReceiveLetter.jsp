<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="utf-8">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	 $(function() {
		 $("span.getLetter").on("click" , function() {
				var letNo = $(this).attr('letNo');
			self.location ="/letter/getLetter?letNo="+letNo;
			});
		 
		 $("#deleteLetter").on("click" , function() {
				var letNo = $(this).attr('letNo');
				var receiveId = $(this).attr('receiveId');
			self.location ="/letter/deleteLetter?letNo="+letNo+"&receiveId="+receiveId;
			});
		 
		 $("#sendLetterList").on("click" , function() {
				var sendId = $(this).attr('sendId');
			self.location ="/letter/getSendLetterList?sendId="+sendId;
			});
		 
		 $("#receiveLetterList").on("click" , function() {
				var receiveId = $(this).attr('receiveId');
			self.location ="/letter/getReceiveLetterList?receiveId="+receiveId;
			});
		 
		
	});	
</script>
</head>

<body>
	
	<div class="container">
	<div class="page-header text-center">
	       <h5 class=" text-left" >쪽지함</h5>
	    </div>
		
		<div class="col-sm-offset-1  col-sm-2 text-center">
		      <button type="button" class="btn btn-primary" id="sendLetterList" sendId="${sessionScope.user.userId}" >보낸쪽지함</button>
		</div>
		<div class="col-sm-offset-1  col-sm-2 text-center">
		      <button type="button" class="btn btn-danger" id="receiveLetterList" receiveId="${sessionScope.user.userId}">받은쪽지함</button>
		</div>
	  
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th valign="middle" align="center">No</th>
            <th align="center" valign="middle">발신인</th>
            <th align="center" valign="middle">받은날짜</th>
            <th align="center" valign="middle">읽음여부</th>
          
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="letter" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			
			<tr>
			<td align="center">${ i }</td>
			
			  <td align="center">${letter.sendId}</td>
			 
			  <td align="center">${letter.letRegdate}</td>
			  
			 <c:if test="${letter.letReaddate == null}">
			  	<td align="center">읽지않음</td>
			  </c:if>
			  
			  <c:if test="${letter.letReaddate != null}">
			  	<td align="center">읽음</td>
			  </c:if>
			
			<td align="center">
				<div class="col-sm-offset-2  col-sm-2 text-center">
					<span class="getLetter" letNo="${letter.letNo}">
		      			<button type="button" class="btn btn-primary" id="getLetter" letNo="${letter.letNo}" >쪽지 보기</button>
		      			
		      		</span>
		      		<button type="button" class="btn btn-danger" id="deleteLetter" letNo="${letter.letNo}" receiveId="${sessionScope.user.userId}">쪽지 삭제</button>
		    	</div>
		    </td>
		   </tr> 
          </c:forEach>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	
 	
	
</body>

</html>
