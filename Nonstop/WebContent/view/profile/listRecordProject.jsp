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
	
	
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">

</script>
</head>

<body>
	
	<div class="container">
	<div class="page-header text-center">
	       <h5 class=" text-left" >프로젝트 작업이력</h5>
	    </div>

      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >기업명</th>
            <th align="left">프로젝트 명</th>
            <th align="left">프로젝트 기간</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="recordProject" items="${list2}">
			<c:set var="i" value="${ i+1 }" />
			<tr>

			<td align="center">${ i }</td>

			  <td align="left">${recordProject.comName}</td>
			 
			  <td align="left">${recordProject.proTitle}</td>
			  
			  <td align="left">${recordProject.proStartDate} ~ ${recordProject.proendDate}</td>
			  
			 
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	
 	
	
</body>

</html>
