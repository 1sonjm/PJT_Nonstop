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

	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	 $(function() {
		 $(".fa-trash").on("click" , function() {
				var careerNo=$(this).attr('careerNo');
				self.location ="/profile/deleteCareer?careerNo="+careerNo;
			});
		 
		 $("#addCareer").on("click" , function() {
		 		$("form").attr("method" , "POST").attr("action" , "/profile/addCareer").submit();
			}); 
		 
		 $('#selectTechClass').on('change',function(){
				var a = "?techClass="+document.querySelector('#selectTechClass').value
				$.ajax("/statistics/getJSONListTechData"+a,{
					method : "POST" ,
					dataType : "json" ,
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					success : function(jsonData) {
						//console.log(jsonData.techDataList[0].techName);
						document.querySelector("#selectTechData").innerHTML = "";
						for(var i=0;i<jsonData.techDataList.length;i++){
							document.querySelector("#selectTechData").innerHTML 
								+= "<option value='"+jsonData.techDataList[i].techNo+"'>"
											+jsonData.techDataList[i].techName
										+"</option>";
							}
						}
					});
				})
	});	
	
</script>
</head>

<body>
	
	<div class="row">
            <!-- Column -->
            <div class="col-md-12">
            	<div class="card">
	            	<div class="col-md-12">
						<div class="page-header text-center">
							<h5 class=" text-left" style="padding-left:10px; font-size: 16px">개인 기술정보</h5>
						</div>
					
					    <table class="table table-hover">
					        <thead>
          					<tr>
					            <th>No</th>
					            <th>분류</th>
					            <th>기능명</th>
					            <th>경력</th>
					            <th></th>
					          </tr>
					        </thead>
            
            <c:if test="${user.userId==sessionScope.user.userId }">
			   <div class="btn-group">
                   <button type="button" class="btn btn-info btn-md" data-toggle="modal" data-target="#myModal" style = "align: right">
                   <i id="addViewCareer" class="fa fa-cog"></i></button> 
                      
               </div>
			</c:if>
			   
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="career" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			<th scope="row">${ i }</th>
			
			<td>
			<c:if test="${career.techClass == '1'}">Language</c:if>
			<c:if test="${career.techClass == '2'}">Framework</c:if>
			<c:if test="${career.techClass == '3'}">DBMS</c:if>
			</td>
			 
			 
			  <td>
			  <c:if test="${career.techNo == '1000' }">Java</c:if>
			  <c:if test="${career.techNo == '1001' }">Python</c:if>
			  <c:if test="${career.techNo == '1002' }">Php</c:if>
			  <c:if test="${career.techNo == '1003' }">JavaScript</c:if>
			  <c:if test="${career.techNo == '1004' }">Swift</c:if>
			  <c:if test="${career.techNo == '2000' }">Spring</c:if>
			  <c:if test="${career.techNo == '2001' }">Django</c:if>
			  <c:if test="${career.techNo == '2002' }">Symfony</c:if>
			  <c:if test="${career.techNo == '3000' }">Oracle</c:if>
			  <c:if test="${career.techNo == '3001' }">Mssql</c:if>
			  <c:if test="${career.techNo == '3002' }">Mysql</c:if>
			  <c:if test="${career.techNo == '3003' }">SQLite</c:if>
			  </td>
			 
			  <td>${career.careerUseTerm}개월  &nbsp; &nbsp; </td>
			  
			  	<c:if test="${career.careerUserId==sessionScope.user.userId }">
			   
			  		
			   		<td class="text-right"><i class="fa fa-trash" aria-hidden="true" careerNo="${career.careerNo}"></i></td>
			   		
			   
				</c:if>

			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  </div>
	  </div>
	  </div>
 	</div>
 	
	<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade" style="display: none;">
                         <div class="modal-dialog">
                            <div class="modal-content">
                              <div class="modal-header">
                                <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                                  <h4 class="modal-title">개인기술정보 추가</h4>
                              </div>
                                      
                              <div class="modal-body">
                                <form role="form" id="addMail" class="form-horizontal"> 
                                   <div class="form-group">
                                     <label class="col-lg-2 control-label">분류</label>
                                       <div class="col-lg-5">
                                         <select class="form-control" id="selectTechClass" name="techClass">
											<c:forEach var="classValue" items="${techClassList}" begin="0" step="1">
											  <option value="${classValue.techClass}">
												<c:choose>
													<c:when test="${classValue.techClass == 1}">Language</c:when>
													<c:when test="${classValue.techClass == 2}">Framework</c:when>
													<c:when test="${classValue.techClass == 3}">DBMS</c:when>
												</c:choose>
											 </option>
										   </c:forEach>
										 </select>
                                       </div>
                                   </div>
                                          
                                   <div class="form-group">
                                     <label class="col-lg-2 control-label">기술명</label>
                                       <div class="col-lg-5">
                                         <select class="form-control" id="selectTechData"name="techNo" >
										    <c:forEach var="career" items="${techDataList}" begin="0" step="1">
												<option value="${career.techNo}">${career.techName}</option>
											</c:forEach>
										 </select>
                                       </div>
                                   </div>
                                              
                                   <div class="form-group">
                                   	 <label class="col-lg-2 control-label">기술사용기간</label>
                                       <div class="col-lg-7">
                                         <input type="text" name="careerUseTerm" placeholder="개월단위로 입력해 주세요. ex)24" class="form-control">
                                       </div>
                                   </div>

                                   <div class="form-group">
                                     <div class="col-lg-offset-2 col-lg-10">
                             		   <span>
                                         <button class="btn btn-send" type="submit" id="addCareer">add</button>
                                       </span>
                            		 </div>
                                   </div>
                                </form>
                              </div>
                            </div><!-- /.modal-content -->
                          </div><!-- /.modal-dialog -->
                        </div><!-- /.modal -->
</body>

</html>
