<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8"%>


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
			$( "#send" ).on("click" , function() {
				
				
				$("form").attr("method" , "POST").attr("action" , "/letter/addLetter").submit();
				
				/*  popWin 
				= window.open("/view/letter/addLetterResult.jsp",
										"popWin", 
										"left=300,top=100,width=200,height=200,marginwidth=0,marginheight=0,"+
										"scrollbars=no,scrolling=no,menubar=no,resizable=no");     */
			});
		});	
		
		
		//============= "취소"  Event 처리 및  연결 =============
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("#close").on("click" , function() {
				close();
			});
		});	
	
		
		
	</script>		
    
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	
	<div class="container">
	
		<h1 class="bg-primary text-center">답장하기</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		  <div class="form-group">
		    <label for="sendId" class="col-sm-offset-1 col-sm-3 control-label">발신자</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="sendId" name="sendId" value = "${sessionScope.user.userId}" readOnly>
	
		    </div>
		 
		  </div>
		  
		  <div class="form-group">
		    <label for="receiveId" class="col-sm-offset-1 col-sm-3 control-label">수신자</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiveId" name="receiveId" value="${letter.sendId}" readOnly>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="letDetail" class="col-sm-offset-1 col-sm-3 control-label">쪽지 내용</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="letDetail" name="letDetail" placeholder="쪽지 내용을 작성하세요">
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary" id="send">전&nbsp;송</button>
			  <a class="btn btn-primary btn" href="#" role="button" id="close">취&nbsp;소</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	
</body>

</html>