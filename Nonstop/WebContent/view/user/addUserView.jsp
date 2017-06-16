<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>Nonstop</title>
<!-- Bootstrap Core CSS -->
 <link href="/resources/css/nonstop.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="/resources/css/full.css" rel="stylesheet">
<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="utf-8">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" > -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
 -->

	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/cupertino/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//============= "가입"  Event 연결 =============
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-primary" ).on("click" , function() {
				fncAddUser();
			});
		});	
		
		
		//============= "취소"  Event 처리 및  연결 =============
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				$("form")[0].reset();
			});
		});	
		
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
				
			
			$("form").attr("method" , "POST").attr("action" , "/user/addUser").submit();
		}
		

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
		                    url : '/user/checkUserId/'+userId,
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
	<div class="container">
	
		<h1 class="bg-primary text-center">개 인 회 원 가 입</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" method="post" enctype="multipart/form-data">		
		<div class="form-group">
                  <label class="col-md-4 control-label" for="userId">아이디</label>      
                  <div class="col-md-4">
                  	 <input class="form-control input-md" type="text" id="userId" name="userId" value="${param.userId }">
                        <div id="checkId" style="color:red; font-size:12px;">아이디를 입력해주세요.</div>
                  </div>
               </div>
		  
		  <div class="form-group">
                  <label class="col-md-4 control-label" for="password">비밀번호</label>   
                  <div class="col-md-4">            
                     <input class="form-control input-md" type="password" id="password" name="password">
                  </div>
               </div>      
               
               <div class="form-group">
                  <label class="col-md-4 control-label" for="password2">비밀번호확인</label>   
                  <div class="col-md-4">            
                     <input class="form-control input-md" type="password" id="password2" name="password2">
                        <div id="checkpw" style="color:red; font-size:12px;"></div>
                  </div>
               </div>
		  
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">이름</label>
		    <div class="col-sm-4">

		      <input type="text" class="form-control" id="userName" name="userName" placeholder="회원이름" value="${param.nickname }">



		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <label for="tel" class="col-sm-offset-1 col-sm-3 control-label">연락처</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="tel" name="tel" placeholder="연락처">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="addr" class="col-sm-offset-1 col-sm-3 control-label">주소</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="addr" name="addr" placeholder="주소">
		    </div>
		  </div>
		  
		  
		   <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">이메일</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="email" name="email" placeholder="이메일">
		    </div>
		  </div>
		  
		  
		 <div class="form-group">
						<label class="col-md-4 control-label">프로필 사진</label>  
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
		  
		  
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >가 &nbsp;입</button>
			  <a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	
</body>

</html>