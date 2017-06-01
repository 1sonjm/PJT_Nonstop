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
			 $( "#addReturnLetter" ).on("click" , function() {
					
				 var letNo = $(this).attr('letNo');
				
				self.location ="/letter/addReturnLetter?letNo="+letNo;
				});
			 
			 $( "#close" ).on("click" , function() {
					
				 var receiveId = $(this).attr('receiveId');
				
				self.location ="/letter/getReceiveLetterList?receiveId="+receiveId;
				});
 
		});	
		
	</script>		
    
</head>

<body>

	
	<div class="container">
	
		<h1 class="bg-primary text-center">쪽지보기</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		  <div class="form-group">
		    <label for="sendId" class="col-sm-offset-1 col-sm-1 control-label">발신자</label> 
		    <div class="col-sm-3" id="sendId">
		    	<input type="text" class="form-control" name="sendId" value="${letter.sendId}" readOnly>
		   </div>
		  </div>  
		  
		  <div class="form-group">
		    <label for="receiveId" class="col-sm-offset-1 col-sm-1 control-label">수신자</label>
		    <div class="col-sm-3">
		      <input type="text" class="form-control" id="receiveId" name="receiveId" value="${letter.receiveId}" readOnly>
		    </div>
		  </div>
		  <br/><br/>
		   <div class="form-group">
		    <label for="letDetail" class="col-sm-offset-1 col-sm-1 control-label">쪽지내용</label>
		    <div class="col-sm-8">
		      <input type="text" class="form-control" id="letDetail" name="letDetail" value="${letter.letDetail}" style="height:400px" readOnly >
		    </div>
		  </div>
		  
		  
		  
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		    
		      <button type="button" class="btn btn-primary" letNo="${letter.letNo}"  id="addReturnLetter" >답장하기</button>
		    
			 <button type="button" class="btn btn-primary" receiveId="${sessionScope.user.userId}"  id="close" >이전</button>
		    
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	
</body>

</html>