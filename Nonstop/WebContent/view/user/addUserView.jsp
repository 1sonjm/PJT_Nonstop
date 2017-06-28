<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>
<script src="/resources/javascript/jquery.js"></script>

<!-- <script src="/resources/javascript/bootstrap.min.js"></script> -->

<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
   integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
   crossorigin="anonymous"></script>
<!-- Bootstrap Core CSS -->
<link href="/resources/css/nonstop.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="/resources/css/full.css" rel="stylesheet"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" > -->
	 
	<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	 -->
	<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/cupertino/jquery-ui.css">
 
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	 -->
	<!--  ///////////////////////// CSS ////////////////////////// -->
	 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="/css/custom-theme.css" >
	 
	
	
	
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
        
     .form-control {
	
	margin-left: 640px;
	width: 20%;
	}   
    
        
    .tabbable-line > .nav-tabs {
  
    margin-top: 50px;
}    
        
 .tabbable-line > .nav-tabs {
   
    margin-left: -90px;
}       
      
  
        
.btn-file {
    position: relative;
    overflow: hidden;
}
.btn-file input[type=file] {
    position: absolute;
    top: 0;
    right: 0;
    min-width: 100%;
    min-height: 100%;
    font-size: 100px;
    text-align: right;
    filter: alpha(opacity=0);
    opacity: 0;
    outline: none;
    background: white;
    cursor: inherit;
    display: block;
}
.input-group {
    position: relative;
    display: table;
    border-collapse: separate;
    margin-left: 640px;
}
.input-group .form-control:last-child, .input-group-addon:last-child, .input-group-btn:last-child > .btn, .input-group-btn:last-child > .btn-group > .btn, .input-group-btn:last-child > .dropdown-toggle, .input-group-btn:first-child > .btn:not(:first-child), .input-group-btn:first-child > .btn-group:not(:first-child) > .btn {
    border-bottom-left-radius: 0;
    width: 26%;
    border-top-left-radius: 0;
    margin-left: 0px;
}
.btn-block {
    display: block;
    width: 20%;
    margin-left: 640px;
}
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	//============= 개인회원가입 버튼 =============
		 $(function() {
	$( "#addUserV" ).on("click" , function() {
		fncAddUser();
	});
});	
	
	
	
	
	
//============= 기업회원가입 버튼 =============
$(function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$( "#addCompanyV" ).on("click" , function() {
		fncAddCompany();
	});
});	
		
		
		//============= "취소"  Event 처리 및  연결 =============
		
		
		function fncAddUser() {
		
	var id=$("input[id='addUser11']").val();
	var name=$("input[id='userName1']").val();
	var pw=$("input[id='password11']").val();
	var pw_confirm=$("input[id='password22']").val();
	var email=$("input[id='email1']").val();
	var tel=$("input[id='tel1']").val();
	var addr=$("input[id='addr1']").val();
	var image=$("input[id='image1']").val();
	
	
	if(id == null || id.length <1){
		alert("아이디는 반드시 입력하셔야 합니다.");
		return;
	}
	
	if(name == null || name.length <1){
		alert("이름은 반드시 입력하셔야 합니다.");
		return;
	}
	
	if(pw == null || pw.length <1){
		alert("패스워드는 반드시 입력하셔야 합니다.");
		return;
	}
	if(pw_confirm == null || pw_confirm.length <1){
		alert("패스워드 확인은  반드시 입력하셔야 합니다.");
		return;
	}
	
	if(email == null || email.length <1){
		alert("이메일은 반드시 입력하셔야 합니다.");
		return;
	}
	
	if(tel == null || tel.length <1){
		alert("연락처는 반드시 입력하셔야 합니다.");
		return;
	}
	
	if(addr == null || addr.length <1){
		alert("주소는 반드시 입력하셔야 합니다.");
		return;
	}
	
	
	if( pw != pw_confirm ) {				
		alert("비밀번호 확인이 일치하지 않습니다.");
		$("input:text[name='password2']").focus();
		return;
	}
		
	
	$("#addUserF").attr("method" , "POST").attr("action" , "/user/addUser").submit();
}
	
//============= 기업회원가입 =============
function fncAddCompany() {
		
	var id=$("input[id='addUser22']").val();
	var name=$("input[id='userName2']").val();
	var pw=$("input[id='password33']").val();
	var pw_confirm=$("input[id='password44']").val();
	var email=$("input[id='email2']").val();
	var tel=$("input[id='tel2']").val();
	var addr=$("input[id='addr2']").val();
	var image=$("input[id='image2']").val();
	var companyName=$("input[name='companyName']").val();
	var empNum=$("input[name='empNum']").val();
	var pubDate=$("input[name='pubDate']").val();
	
	
	if(id == null || id.length <1){
		alert("아이디는 반드시 입력하셔야 합니다.");
		return;
	}
	
	if(name == null || name.length <1){
		alert("이름은 반드시 입력하셔야 합니다.");
		return;
	}
	
	if(pw == null || pw.length <1){
		alert("패스워드는 반드시 입력하셔야 합니다.");
		return;
	}
	if(pw_confirm == null || pw_confirm.length <1){
		alert("패스워드 확인은  반드시 입력하셔야 합니다.");
		return;
	}
	
	if(email == null || email.length <1){
		alert("이메일은 반드시 입력하셔야 합니다.");
		return;
	}
	
	if(tel == null || tel.length <1){
		alert("연락처는 반드시 입력하셔야 합니다.");
		return;
	}
	
	if(addr == null || addr.length <1){
		alert("주소는 반드시 입력하셔야 합니다.");
		return;
	}
	
	
	if( pw != pw_confirm ) {				
		alert("비밀번호 확인이 일치하지 않습니다.");
		$("input:text[name='password2']").focus();
		return;
	}
	
	$("#addCompanyF").attr("method" , "POST").attr("action" , "/user/addCompany").submit();
}
		
$(function(){
	$("#datepicker").datepicker({dateFormat:"yy-mm-dd", 
		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
		  monthNames : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
	});
});
		//==>"이메일" 유효성Check  Event 처리 및 연결
		 $(function() {
			 
			 $("input[name='email']").on("change" , function() {
				
				 var email=$("input[name='email']").val();
			    
				 if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) ){
			    	alert("이메일 형식이 아닙니다.");
			     }
			});
			 
		});	
		
		//아이디 중복체크
		   $(function(){
		      
		      $("#userId").on("keyup", function(){
		         
		         var userId = $("#userId").val();
		         
		         
		                  
		          $.ajax(
		                {
		                    url : '/user/checkId/'+userId,
		                    method : "GET",
		                    dataType : "json",
		                    headers : {
		                       "Accept" : "application/json",
		                       "Content-Type" : "application/json"
		                    },
		                    context : this,
		                    success : function(JSONData, status) {   
		                                            
		                       if(! JSONData.result) {
		                          $("#checkId").html("존재하는 아이디입니다.");
		                       } 
		                       else {
		                    	   $("#checkId").html("사용가능한 아이디입니다.");
			                       
		                       }
		                    }
		              });         
		         });      
		      });
	   
		
		   $(function(){      
			      
			      $("#password11").keyup( function(){
			         $("#checkpw1").text('');
			      });
			      
			      $("#password22").keyup( function() {
			         if( $("#password11").val() != $("#password22").val() ) {
			            $("#checkpw1").text('');
			            $("#checkpw1").html("비밀번호가 일치하지 않습니다.");
			         } else {
			            $("#checkpw1").text('');
			            $("#checkpw1").html("비밀번호가 일치합니다.");
			         }
			      });
			   }); 
		 
		   $(function(){      
			      
			      $("#password33").keyup( function(){
			         $("#checkpw2").text('');
			      });
			      
			      $("#password44").keyup( function() {
			         if( $("#password33").val() != $("#password44").val() ) {
			            $("#checkpw2").text('');
			            $("#checkpw2").html("비밀번호가 일치하지 않습니다.");
			         } else {
			            $("#checkpw2").text('');
			            $("#checkpw2").html("비밀번호가 일치합니다.");
			         }
			      });
			   }); 
		 
		   $(document).ready( function() {
		    	$(document).on('change', '.btn-file :file', function() {
				var input = $(this),
					label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
				input.trigger('fileselect', [label]);
				});
				$('.btn-file :file').on('fileselect', function(event, label) {
				    
				    var input = $(this).parents('.input-group').find(':text'),
				        log = label;
				    
				    if( input.length ) {
				        input.val(log);
				    } else {
				        if( log ) alert(log);
				    }
			    
				});
				function readURL(input) {
				    if (input.files && input.files[0]) {
				        var reader = new FileReader();
				        
				        reader.onload = function (e) {
				            $('#img-upload').attr('src', e.target.result);
				        }
				        
				        reader.readAsDataURL(input.files[0]);
				    }
				}
				$("#image1").change(function(){
				    readURL(this);
				}); 	
			});
		    
		   $(document).ready( function() {
		    	$(document).on('change', '.btn-file :file', function() {
				var input = $(this),
					label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
				input.trigger('fileselect', [label]);
				});
				$('.btn-file :file').on('fileselect', function(event, label) {
				    
				    var input = $(this).parents('.input-group').find(':text'),
				        log = label;
				    
				    if( input.length ) {
				        input.val(log);
				    } else {
				        if( log ) alert(log);
				    }
			    
				});
				function readURL(input) {
				    if (input.files && input.files[0]) {
				        var reader = new FileReader();
				        
				        reader.onload = function (e) {
				            $('#img-upload').attr('src', e.target.result);
				        }
				        
				        reader.readAsDataURL(input.files[0]);
				    }
				}
				$("#image2").change(function(){
				    readURL(this);
				}); 	
			}); 
		   
		   
		   
		//==>"ID중복확인" Event 처리 및 연결
		 
	</script>		
    
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/view/common/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	
	<script type="text/javascript">
	//============ 아이디 중복 체크 =====================
$(function(){
    
	$("#addUser11").on("keyup", function(){
       
    	var userId = $("#addUser11").val();
       
       		$.ajax(
            	{
                  url : '/user/checkId/'+userId,
                  method : "GET",
                  dataType : "json",
                  headers : {
                     "Accept" : "application/json",
                     "Content-Type" : "application/json"
                  },
                  context : this,
                  success : function(JSONData, status) {   
                                          
                     if(! JSONData.result) {
                         $("#checkId1").text("존재하는 아이디입니다.");
                     } 
                     else if(userId <4){
                    	 $("#checkId1").text("아이디는 4자 이상이어야 합니다."); 
                     }
                     else{
                  	   	 $("#checkId1").text("사용가능한 아이디입니다.");
	                       
                     }
                  }
            });//ajax      
	});
});
	$(function(){
            $("#addUser22").on("keyup", function(){
                
            	var userId = $("#addUser22").val();
               
               		$.ajax(
                    	{
                          url : '/user/checkId/'+userId,
                          method : "GET",
                          dataType : "json",
                          headers : {
                             "Accept" : "application/json",
                             "Content-Type" : "application/json"
                          },
                          context : this,
                          success : function(JSONData, status) {   
                                                  
                             if(! JSONData.result) {
                                 $("#checkId2").text("존재하는 아이디입니다.");
                             } 
                             else if(userId <4){
                            	 $("#checkId2").text("아이디는 4자 이상이어야 합니다."); 
                             }
                             else{
                          	   	 $("#checkId2").text("사용가능한 아이디입니다.");
        	                       
                             }
                          }
                    }); 
            });
	});
     
     </script>
     
		<div class="tab-content">
	        		
	        		<div class="tabbable-panel">
						<div class="tabbable-line">
							<ul class="nav nav-tabs">
								<li class="active">
									<a href="#tab_default_1" data-toggle="tab"><strong>개인 회원가입 </strong></a>
								</li>
								<li>
									<a href="#tab_default_2" data-toggle="tab"><strong>기업 회원가입</strong></a>
								</li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane active" id="tab_default_1">
									<form id="addUserF" method="post" enctype="multipart/form-data">
	                                	<div class="form-group">
	                                    	<input type="text" id="addUser11" name="userId" class="form-control" placeholder="User ID" value="${email}">
	                                    	<div id="checkId1" style="color:red; font-size:12px; margin-left:640px;">아이디를 입력해주세요.</div>
	                 				 	</div>
	                                  	<div class="form-group">
	                                    	<input type="password" id="password11" name="password" class="form-control" placeholder="Password">
	                                  	</div>
		                                <div class="form-group">
		                                    <input type="password" id="password22" name="password2" class="form-control" placeholder="Password 확인">
		                                </div>
	                                  	<div id="checkpw1" style="color:red; font-size:12px; margin-left:640px; margin-top:-10px;"></div>
	                                  	<div class="form-group">
	                                    	<input type="text" id="userName1" name="userName" class="form-control" placeholder="이름">
	                                  	</div>
	                                  	<div class="form-group">
	                                    	<input type="text" id="addr1" name="addr" class="form-control" placeholder="주소">
	                                  	</div>
	                                  	<div class="form-group">
	                                    	<input type="text" id="tel1" name="tel" class="form-control" placeholder="연락처">
	                                  	</div>
	                                  	<div class="form-group">
	                                    	<input type="text" id="email1" name="email" class="form-control" placeholder="이메일">
	                                  	</div>
                 				
                 						<div class="form-group">
        									<div class="input-group">
           									 <span class="input-group-btn">
                								<span class="btn btn-default btn-file">
                    							Browse… <input type="file" id="image1" name="file"/>
                								</span>
            								 </span>
            							<input type="text" class="form-control" placeholder="프로필 사진을 등록해 주세요"  readonly>
        									</div>
       
    									</div>						
                 				
                 				
                                  		<button class="btn btn-primary btn-block" id="addUserV" style="margin-top:60px">회원가입</button>
                                  		<button class="btn btn-default btn-block">취소</button>
            
									</form>
                        		</div>
                        		<div class="tab-pane" id="tab_default_2">
		                        	<form id="addCompanyF" method="post" enctype="multipart/form-data">
		                            	<div class="form-group">
		                                	<input type="text" id="addUser22" name="userId" class="form-control" placeholder="User ID">
		                                	<div id="checkId2" style="color:red; font-size:12px; margin-left:640px; " font->아이디를 입력해주세요.</div>
		                                </div>
                                  		<div class="form-group">
                                      		<input type="password" id="password33" name="password" class="form-control" placeholder="Password">
                                  		</div>
	                                  	<div class="form-group">
	                                      	<input type="password" id="password44" name="password2" class="form-control" placeholder="Password 확인">
	                                  	</div>
	                                  	<div id="checkpw2" style="color:red; font-size:12px; margin-left:640px; margin-top:-10px;"></div>
	                                  	<div class="form-group">
	                                      	<input type="text" id="userName2" name="userName" class="form-control" placeholder="이름">
	                                  	</div>
	                                  	<div class="form-group">
	                                      	<input type="text" id="addr2" name="addr" class="form-control" placeholder="주소">
	                                  	</div>
	                                  	<div class="form-group">
	                                      	<input type="text" id="tel2" name="tel" class="form-control" placeholder="연락처">
	                                  	</div>
	                                  	<div class="form-group">
	                                      	<input type="text" id="email2" name="email" class="form-control" placeholder="이메일">
	                                  	</div>
	                                  	<div class="form-group">
	                                      	<input type="text" id="companyName" name="companyName" class="form-control" placeholder="기업명">
	                                  	</div>
	                                   	<div class="form-group">
	                                      	<input type="text" id="empNum" name="empNum" class="form-control" placeholder="직원수">
	                                  	</div>
                                  
		                                <div class="form-group">
		    <label for="pubDate"></label>
		    <div>
		      <input type="text" class="form-control"  id="datepicker" name="pubDate" placeholder="이곳을 클릭하여 설립일을 선택해 주세요"  readonly>
		       <span id="helpBlock" class="help-block">
		      	<strong class="text-danger" style="margin-left:640px" >설립일을 선택하세요</strong>
		      </span>
		    </div>
		  </div>
                 				   		<div class="form-group">
       
        <div class="input-group">
            <span class="input-group-btn">
                <span class="btn btn-default btn-file">
                    Browse… <input type="file" id="image2" name="logoFile"/>
                </span>
            </span>
            <input type="text" class="form-control" placeholder="기업로고를 등록해 주세요"  readonly>
        </div>
       
    </div>						

                                	<button class="btn btn-primary btn-block" id="addCompanyV" style="margin-top:60px">회원가입</button>
                                	<button class="btn btn-default btn-block">취소</button>
                              	</form>
								</div>
							</div>
						</div>
					</div>
	        		
        		
		
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	
</body>

</html>
