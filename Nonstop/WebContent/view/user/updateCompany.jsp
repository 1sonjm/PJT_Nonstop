<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
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

   
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
		body {
            padding-top : 50px;
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
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//============= "수정"  Event 연결 =============
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-primary" ).on("click" , function() {
				fncUpdateCompany();
			});
		});	
		
		 
		//============= "취소"  Event 처리 및  연결 =============
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("#cancel").on("click" , function() {
				self.location = "../index.jsp"
			});
		});	
		
		//=============이메일" 유효성Check  Event 처리 =============
		 $(function() {
			 
			 $("input[name='email']").on("change" , function() {
					
				 var email=$("input[name='email']").val();
			    
				 if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) ){
			    	alert("이메일 형식이 아닙니다.");
			     }
			});
			 
		});	
		
		 $(function(){
				$("#datepicker").datepicker({dateFormat:"yy-mm-dd", 
					dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
					  monthNames : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']

				});
		 });
		///////////////////////////////////////////////////////////////////////
		function fncUpdateCompany() {
			var name=$("input[name='userName']").val();
			
			if(name == null || name.length <1){
				alert("이름은  반드시 입력하셔야 합니다.");
				return;
			}
				
			
				
			$("form").attr("method" , "POST").attr("action" , "/user/updateCompany").submit();
		}
		
		
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
	</script>
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/view/common/toolbar.jsp" />
    	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-center">
	       <h3 class=" text-info">회원정보수정</h3>
	       <h5 class="text-muted">내 정보를 <strong class="text-danger">최신정보로 관리</strong>해 주세요.</h5>
	    </div>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" method="post" enctype="multipart/form-data">
		
		  <div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">아 이 디</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userId" name="userId" value="${user.userId }" placeholder="중복확인하세요"  readonly>
		       <span id="helpBlock" class="help-block">
		      	<strong class="text-danger">아이디는 수정불가</strong>
		      </span>
		    </div>
		  </div>
		
		  <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">비밀번호</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password" name="password" placeholder="변경비밀번호">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">비밀번호 확인</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password2" name="password2" placeholder="변경비밀번호 확인">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">이름</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userName" name="userName" value="${user.userName}" placeholder="변경회원이름">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="tel" class="col-sm-offset-1 col-sm-3 control-label">연락처</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="tel" name="tel" value="${user.tel}" placeholder="변경연락처">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="addr" class="col-sm-offset-1 col-sm-3 control-label">주소</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="addr" name="addr"  value="${user.addr}" placeholder="변경주소">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">기업명</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="companyName" name="companyName" value="${user.companyName}" placeholder="변경기업명">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">직원수</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="empNum" name="empNum" value="${user.empNum}" placeholder="변경직원수">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="pubDate" class="col-sm-offset-1 col-sm-3 control-label">설립일</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control"  id="datepicker" name="pubDate" placeholder="이곳을 클릭하여 설립일을 선택해 주세요"  readonly>
		       <span id="helpBlock" class="help-block">
		      	<strong class="text-danger" >설립일을 선택하세요</strong>
		      </span>
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">이메일</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="email" name="email" value="${user.email}" placeholder="변경이메일">
		    </div>
		  </div>
		  
		  <div class="form-group">
						<label class="col-md-4 control-label">기업 로고</label>  
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
				                        <input type="file" accept="image/png, image/jpeg, image/gif, image/jpg" name="updateFile" id="image" <%-- value="${user.image} --%>"/> <!-- rename it -->
				                    </div>
				                </span>
				            </div><!-- /input-group image-preview [TO HERE]--> 
						</div>
					</div>			
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >수 &nbsp;정</button>
			  <a class="btn btn-primary btn" href="#" role="button" id="cancel">취 &nbsp;소</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
	    
 	</div>
	<!--  화면구성 div Start /////////////////////////////////////-->
 	
</body>

</html>