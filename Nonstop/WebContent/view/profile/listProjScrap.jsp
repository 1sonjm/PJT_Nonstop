<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">

<head>

	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>프로젝트 목록보기</title>

    <!-- Bootstrap Core CSS -->
    <link href="../../resources/css/nonstop.css" rel="stylesheet">
	
    <!-- Custom CSS -->
    <link href="../../resources/css/full.css" rel="stylesheet">
	<link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>
	<!-- jQuery -->
    <script src="../../resources/javascript/jquery.js"></script>


	<style>
	
		#table {
        	border-collapse: collapse;
		    border: collapse;
		    width: 100%;
            padding-left : 20px;
            table-layout : fixed;
		}
		
		 th, tr {
		    padding: 8px;
		    text-align: left;
		   
		    text-overflow:ellipsis;
		    overflow:hidden;
		} 
		
	     #projThumbnail:hover{
	    	background-color:#ffffe6;
	    	border: 2px solid orange;
	    } 
        
     	#shape1{
        	margin:0;
        	padding:5px;
        	background-color: #dddddd;
     	}
     	#shape2{
        	margin:0;
        	padding:5px;
        	background-color: orange;
     	}
     	
     	/* scrap button */
     	.fa-star.inbox-started, .fa-star:hover {
          color: #f78a09;
    	}
      
       .fa-star {
          color: #d5d5d5;
        }
        

	</style>

	<script type="text/javascript">

		$(function() {
			//프로젝트 상세보기
			$(".detailButton").on("click", function(){
				self.location ="/project/getProject?projNo="+$(this).attr("value");
			});
		});
		
		
		   $(function() {
				//프로젝트 스크랩
	            $(".fa-star").on("click" , function() {

	                  var flag = $(this).attr('scrap');
	                  var requestTarget;

	                  if(flag==0){
	                     requestTarget = "addJsonProjScrap";
	                  }else{
	                     requestTarget = "deleteJsonProjScrap";
	                  }
	                   var projNo=$(this).attr('projNo');
	                   $.ajax(
	                      {
	                         url : "/profile/"+requestTarget+"/"+projNo,
	                         method : "GET",
	                         dateType : "json",
	                         headers : {
	                            "Accept" : "application/json",
	                           "Content-Type" : "application/json"   
	                       },
	                         context : this,
	                         success : function(JSONData , status){
	                          
	                            if(flag==0){
	                               $(this).removeClass('fa fa-star').addClass('fa fa-star inbox-started');
	                               $(this).attr('scrap','1');
	                            }else{
	                               $(this).removeClass('fa fa-star inbox-started').addClass('fa fa-star');
	                           $(this).attr('scrap','0');
	                            }
	                         }
	                      });
	                   });
	            });

	</script>


</head>

<body>

<div class="container">
  <input type="hidden" class="projNo" name="projNo" id="projNo" value="${project.projNo}" />
  <input type="hidden" class="projUserId" name="projUserId" id="projUserId" value="${project.projUserId}" />
  <div class="row">

  </div>
</div>

    <div class="margin-bottom-40">
    	<div class="container">   	
        	<div class="row">
        		<c:set var="i" value="0" />
				<c:forEach var="project" items="${scrapProj}">
				<c:set var="i" value="${ i+1 }" />
				<c:if test="${project.scrapNo !=0}">
				
					<div class="col-md-6 col-sm-6 hero-feature" style="margin-top: 30px; margin-bottom: 20px; height: 400px">
						<input type="hidden" class="projNo" name="projNo" id="projNo" value="${project.projNo}" /> 
						<input type="hidden" name="projAnnoEnd" id="projAnnoEnd" value="${project.projAnnoEnd}" /> 
						<input type="hidden" name="projStartDate" id="projStartDate" value="${project.projStartDate}" /> 
						<input type="hidden" name="projEndDate" id="projEndDate" value="${project.projEndDate}" />
						<div class="thumbnail" id="projThumbnail">
							<table  id="table" style="height: 400px; overflow:hidden;">
								<tr style="height: 40px; border-bottom: 1px solid #ddd">
									<th colspan="10" style="font-size: 25px; table-layout: fixed; height: 40px;  white-space:nowrap;">
										<c:if test="${project.scrapNo==0}">
			                               <i class="fa fa-star" projNo="${project.projNo}" scrap="${project.scrapNo}"></i>
			                            </c:if>
			                            <c:if test="${project.scrapNo!=0}">
			                               <i class="fa fa-star inbox-started"  projNo="${project.projNo}" scrap="${project.scrapNo}"></i>
			                            </c:if>
										${project.projTitle}
									</th>
									<th colspan="2" style="text-align: center">
										<c:choose>
											<c:when test="${project.projDday<=0}">
												<div class="w3-panel w3-round-large" id="shape1">
												    <font color=black>마감</font>
												</div>
											</c:when>
											<c:when test="${project.projDday>=1}">
												<div class="w3-panel w3-round-large" id="shape2">
													<font color=white>모집중</font>
												</div>
											</c:when>
										</c:choose>
									</th>
								</tr>

								<tr style="height: 10px; font-size: 15px; text-align: center">
									<td colspan="3">공고기간</td>
									<td colspan="3">예상기간</td>
									<td colspan="3">지원자수</td>
									<td colspan="3">개발지역</td>
								</tr>

								<tr style="height: 50px">

									<!-- <th colspan="3" style="border-right: 1px solid #ddd; text-align: center" id="thatDay" value=""><script language=javascript>d_day()</script>일 남음</th>
									<th colspan="3" style="border-right: 1px solid #ddd; text-align: center" id="expectDay" value=""><script language=javascript>expect_day()</script>일</th> -->
									<th colspan="3" style="border-right: 1px solid #ddd; text-align: center" id="thatDay" value="">
										<c:choose>
											<c:when test="${project.projDday<=0}">
												<font color=#ff607f>마감</font>
											</c:when>
											<c:when test="${project.projDday==1}">
												<font color=#ff607f>마감 임박</font>
											</c:when>
											<c:when test="${project.projDday>1}">
												<font color=#ff607f>${project.projDday}</font>일 남음
											</c:when>
										</c:choose>
									</th>
									<th colspan="3" style="border-right: 1px solid #ddd; text-align: center" id="expectDay" value="">${project.projExpectDate}일</th>
									<th colspan="3" style="border-right: 1px solid #ddd; text-align: center">sdsdfsdf</th>
									<th colspan="3" style="text-align: center">${project.projLocation}</th>
								</tr>

								<tr style="height: 10px; border-bottom: 1px solid #ddd">
									<th colspan="12"></th>
								</tr>

								<tr style="height: 20px">
									<th colspan="12">
									<c:choose>
										<c:when test="${project.projDivision==11}">
									  		개발 분야 : 개발>WEB
									  	</c:when>
										<c:when test="${project.projDivision==12}">
									  		개발 분야 : 개발>APP
									  	</c:when>
										<c:when test="${project.projDivision==21}">
									  		개발 분야 : 디자이너>WEB
									  	</c:when>
										<c:when test="${project.projDivision==22}">
									  		개발 분야 : 디자이너>APP
									  	</c:when>
									</c:choose></th>
								</tr>


								<tr style="height: 20px; border-bottom: 1px solid #ddd">
									<th colspan="12">개발 기술 : java</th>
								</tr>

								<tr style="height: 150px; text-align: top-left;" class="projDetail">
									<td colspan="12">
										<p>
											<strong>상세내용</strong>
										</p> 
									${project.projDetail}
									</td>
								</tr>

								<tr>
									<th colspan="4" ></th>
									<th colspan="4" style="background-color: #dddddd; text-align: center" class="detailButton" value="${project.projNo}">상세보기</th>
									<th colspan="4" ></th>
								</tr>
							</table>
						</div>
					</div>
					</c:if>
				</c:forEach>
	            </div>
	         </div>
	      </div>
	        
	             
	<div class="container text-center">
		 
		 <nav>
		  <!-- 크기조절 :  pagination-lg pagination-sm-->
		  <ul class="pagination" >
		    
		    <!--  <<== 좌측 nav -->
		  	<c:if test="${ resultPage.currentPage <= resultPage.pageUnit }">
		 		<li class="disabled">
			</c:if>
			<c:if test="${ resultPage.currentPage > resultPage.pageUnit }">
				<li>
			</c:if>
		    <%--   <a href="javascript:fncGetList('${ resultPage.currentPage-1}')" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a> --%>
		    </li>
		    
		    <!--  중앙  -->
			<c:forEach var="i"  begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" step="1">
				
				<c:if test="${ resultPage.currentPage == i }">
					<!--  현재 page 가르킬경우 : active -->
				    <li class="active">
				    	<a href="javascript:fncGetList('${ i }');">${ i }<span class="sr-only">(current)</span></a>
				    </li>
				</c:if>	
				
				<c:if test="${ resultPage.currentPage != i}">	
					<li>
						<a href="javascript:fncGetList('${ i }');">${ i }</a>
					</li>
				</c:if>
			</c:forEach>
		    
		     <!--  우측 nav==>> -->
		     <c:if test="${ resultPage.endUnitPage >= resultPage.maxPage }">
		  		<li class="disabled">
			</c:if>
			<c:if test="${ resultPage.endUnitPage < resultPage.maxPage }">
				<li>
			</c:if>
		      <%-- <a href="javascript:fncGetList('${resultPage.endUnitPage+1}')" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a> --%>
		    </li>
		  </ul>
		</nav>
		
	</div>

</body>

</html>
