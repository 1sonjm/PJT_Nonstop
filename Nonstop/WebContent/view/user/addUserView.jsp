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
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" > -->
	 <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
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
     .input-group .form-control:first-child, .input-group-addon:first-child, .input-group-btn:first-child > .btn, .input-group-btn:first-child > .btn-group > .btn, .input-group-btn:first-child > .dropdown-toggle, .input-group-btn:last-child > .btn:not(:last-child):not(.dropdown-toggle), .input-group-btn:last-child > .btn-group:not(:last-child) > .btn {
    border-bottom-right-radius: 0;
    border-top-right-radius: 0;
    margin-left: 625px;
    width: 47.5%;
    
}   
        
    .tabbable-line > .nav-tabs {
  
    margin-top: 50px;
}    
        
        
        
  .input-group-btn:last-child > .btn, .input-group-btn:last-child > .btn-group {
    z-index: 2;
    margin-left: 278px;
}
  
        
    .container{
    margin-top:20px;
}
.image-preview-input {
    position: relative;
	overflow: hidden;
	margin: 0px;    
    color: #333;
    background-color: #fff;
    border-color: #ccc;    
}
.image-preview-input input[type=file] {
	position: absolute;
	top: 0;
	right: 0;
	margin: 0;
	padding: 0;
	font-size: 20px;
	cursor: pointer;
	opacity: 0;
	filter: alpha(opacity=0);
}
.image-preview-input-title {
    margin-left:2px;
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
		
	var id=$("input[name='userId']").val();
	var name=$("input[name='userName']").val();
	var pw=$("input[name='password']").val();
	var pw_confirm=$("input[name='password2']").val();
	var email=$("input[name='email']").val();
	var tel=$("input[name='tel']").val();
	var addr=$("input[name='addr']").val();
	var image=$("input[name='image']").val();
	
	
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
		
	var id=$("input[name='userId']").val();
	var name=$("input[name='userName']").val();
	var pw=$("input[name='password']").val();
	var pw_confirm=$("input[name='password2']").val();
	var email=$("input[name='email']").val();
	var tel=$("input[name='tel']").val();
	var addr=$("input[name='addr']").val();
	var image=$("input[name='image']").val();
	var companyName=$("input[name='companyName']").val();
	var empNum=$("input[name='empNum']").val();
	var pubDate=$("input[name='pubDate']").val();
	
	var id=$("input[name='userId']").val();
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
			      
			      $("#password").keyup( function(){
			         $("#checkpw").text('');
			      });
			      
			      $("#password2").keyup( function() {
			         if( $("#password").val() != $("#password2").val() ) {
			            $("#checkpw").text('');
			            $("#checkpw").html("비밀번호가 일치하지 않습니다.");
			         } else {
			            $("#checkpw").text('');
			            $("#checkpw").html("비밀번호가 일치합니다.");
			         }
			      });
			   }); 
		 
		 
		 
		 $(document).on('click', '#close-preview', function(){ 
		        $('.image-preview').popover('hide');
		        // Hover befor close the preview
		        $('.image-preview').hover(
		            function () {
		               $('.image-preview').popover('show');
		            }, 
		             function () {
		               $('.image-preview').popover('hide');
		            }
		        );    
		    });


		    $(function() {
		        // Create the close button
		        var closebtn = $('<button/>', {
		            type:"button",
		            text: 'x',
		            id: 'close-preview',
		            style: 'font-size: initial;',
		        });
		        closebtn.attr("class","close pull-right");
		        // Set the popover default content
		        $('.image-preview').popover({
		            trigger:'manual',
		            html:true,
		            title: "<strong>Preview</strong>"+$(closebtn)[0].outerHTML,
		            content: "There's no image",
		            placement:'bottom'
		        });
		        // Clear event
		        $('.image-preview-clear').click(function(){
		            $('.image-preview').attr("data-content","").popover('hide');
		            $('.image-preview-filename').val("");
		            $('.image-preview-clear').hide();
		            $('.image-preview-input input:file').val("");
		            $(".image-preview-input-title").text("Browse"); 
		        }); 
		        // Create the preview image
		        $(".image-preview-input input:file").change(function (){     
		            var img = $('<img/>', {
		                id: 'dynamic',
		                width:250,
		                height:200
		            });      
		            var file = this.files[0];
		            var reader = new FileReader();
		            // Set preview image into the popover data-content
		            reader.onload = function (e) {
		                $(".image-preview-input-title").text("Change");
		                $(".image-preview-clear").show();
		                $(".image-preview-filename").val(file.name);            
		                img.attr('src', e.target.result);
		                $(".image-preview").attr("data-content",$(img)[0].outerHTML).popover("show");
		            }        
		            reader.readAsDataURL(file);
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
	                                    	<input type="text" id="addUser11" name="userId" class="form-control" placeholder="User ID">
	                                    	<div id="checkId1" style="color:red; font-size:12px; margin-left:640px;">아이디를 입력해주세요.</div>
	                 				 	</div>
	                                  	<div class="form-group">
	                                    	<input type="password" id="password" name="password" class="form-control" placeholder="Password">
	                                  	</div>
		                                <div class="form-group">
		                                    <input type="password" id="password2" name="password2" class="form-control" placeholder="Password 확인">
		                                </div>
	                                  	<div id="checkpw1" style="color:red; font-size:12px; margin-left:640px; margin-top:-10px;"></div>
	                                  	<div class="form-group">
	                                    	<input type="text" id="userName" name="userName" class="form-control" placeholder="이름">
	                                  	</div>
	                                  	<div class="form-group">
	                                    	<input type="text" id="addr" name="addr" class="form-control" placeholder="주소">
	                                  	</div>
	                                  	<div class="form-group">
	                                    	<input type="text" id="tel" name="tel" class="form-control" placeholder="연락처">
	                                  	</div>
	                                  	<div class="form-group">
	                                    	<input type="text" id="email" name="email" class="form-control" placeholder="이메일">
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
                                      		<input type="password" id="password" name="password" class="form-control" placeholder="Password">
                                  		</div>
	                                  	<div class="form-group">
	                                      	<input type="password" id="password2" name="password2" class="form-control" placeholder="Password 확인">
	                                  	</div>
	                                  	<div id="checkpw2" style="color:red; font-size:12px; margin-left:640px; margin-top:-10px;"></div>
	                                  	<div class="form-group">
	                                      	<input type="text" id="userName" name="userName" class="form-control" placeholder="이름">
	                                  	</div>
	                                  	<div class="form-group">
	                                      	<input type="text" id="addr" name="addr" class="form-control" placeholder="주소">
	                                  	</div>
	                                  	<div class="form-group">
	                                      	<input type="text" id="tel" name="tel" class="form-control" placeholder="연락처">
	                                  	</div>
	                                  	<div class="form-group">
	                                      	<input type="text" id="email" name="email" class="form-control" placeholder="이메일">
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
						
									 	<div class="col-md-5">
										   <!-- image-preview-filename input [CUT FROM HERE]-->
								           <div class="input-group image-preview">
								              <input type="text" class="form-control image-preview-filename" disabled="disabled"> <!-- don't give a name === doesn't send on POST/GET -->
								                <span class="input-group-btn">
								                    <!-- image-preview-clear button -->
								                    <button type="button" class="btn btn-default image-preview-clear" style="display:none;">
								                        <span class="glyphicon glyphicon-remove"></span> Clear
								                    </button>
								                    <!-- image-preview-input -->
								                    <div class="btn btn-default image-preview-input">
								                        <span class="glyphicon glyphicon-folder-open"></span>
								                        <span class="image-preview-input-title">찾아보기</span>
								                        <input type="file" accept="image/png, image/jpeg, image/gif, image/jpg" name="file" id="image"/> <!-- rename it -->
								                    </div>
								                </span>
								            </div><!-- /input-group image-preview [TO HERE]--> 
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