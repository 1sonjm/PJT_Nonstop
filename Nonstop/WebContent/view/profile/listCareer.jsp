<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
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
		 $("span.updateCareer").on("click" , function() {
				var careerNo=$(this).attr('careerNo');
				alert(careerNo);
			self.location ="/profile/updateCareer?careerNo="+careerNo;
			
			});
		 
		 $("span.deleteCareer").on("click" , function() {
				alert("����" );
				var careerNo=$(this).attr('careerNo');
				alert(careerNo);
			self.location ="/profile/deleteCareer?careerNo="+careerNo;
			
			});
	});	
</script>
</head>

<body>
	
	<div class="container">
	<div class="page-header text-center">
	       <h5 class=" text-left" >���� �������</h5>
	    </div>

      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >��ɸ�</th>
            <th align="left">���</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="career" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			<td align="center">${ i }</td>
			
			
			 
			 
			  <td align="left">
			  <c:if test="${career.techNo == '1000' }">Java</c:if>
			  <c:if test="${career.techNo == '1001' }">Python</c:if>
			  <c:if test="${career.techNo == '1002' }">Php</c:if>
			  </td>
			 
			  <td align="left">${career.careerUseTerm}����  &nbsp; &nbsp;
			  <span class="updateCareer" careerNo="${career.careerNo}">
			  <button type="button" class="btn btn-primary">����</button> &nbsp; &nbsp;
			   </span>
			   
			  <span class="deleteCareer" careerNo="${career.careerNo}">
			   <button type="button" class="btn btn-danger">����</button>
			  
			  </span>
			  </td>
			  
			 
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	
 	
	
</body>

</html>
