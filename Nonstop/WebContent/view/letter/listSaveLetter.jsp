<%@ page contentType="text/html; charset=utf-8"%>
<%@ page pageEncoding="utf-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="utf-8">

<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<link rel='stylesheet prefetch'
	href='http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<!-- Bootstrap Dropdown Hover CSS -->



<!-- jQuery UI toolTip 사용 CSS-->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- jQuery UI toolTip 사용 JS-->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
body {
	padding-top: 50px;
}

.mail-box {
	border-collapse: collapse;
	border-spacing: 0;
	display: table;
	table-layout: fixed;
	width: 100%;
}

.mail-box aside {
	display: table-cell;
	float: none;
	height: 100%;
	padding: 0;
	vertical-align: top;
}

.mail-box .sm-side {
	background: none repeat scroll 0 0 #f7f7f7;
	border-radius: 4px 0 0 4px;
	width: 15%;
	height:100%;
}

.mail-box .lg-side {
	background: none repeat scroll 0 0 #fff;
	border-radius: 0 4px 4px 0;
	width: 75%;
}

.mail-box .sm-side .user-head {
	background: none repeat scroll 0 0 #e8e8e8;
	border-radius: 4px 0 0;
	color: #fff;
	min-height: 80px;
	padding-top: 10px;
	border-bottom:1px solid #e2e2e2;
	padding-left: 22px;
}

.user-head .inbox-avatar {
	float: left;
	width: 65px;
}

.user-head .inbox-avatar img {
	margin-top:5px;
	border-radius: 4px;
}

.user-head .user-name {
	display: inline-block;
	margin-top: 10px;
}

.user-head .user-name h5 {
	font-size: 18px;
	font-weight: 300;
	margin-bottom: 0;
	margin-top: 10px;
}

.user-head .user-name h5 a {
	color: #666;
	font-weight:600;
}

.user-head .user-name span a {
	color: #87e2e7;
	font-size: 12px;
}

a.mail-dropdown {
	background: none repeat scroll 0 0 #80d3d9;
	border-radius: 2px;
	color: #01a7b3;
	font-size: 10px;
	margin-top: 20px;
	padding: 3px 5px;
}

.inbox-body {
	padding: 20px;
}

.btn-compose {
	background: none repeat scroll 0 0 #ff6600;
	color: #fff;
	padding: 12px 0;
	text-align: center;
	width: 100%;
}

.btn-compose:hover {
	background: none repeat scroll 0 0 #ff6600;
	color: #fff;
}

ul.inbox-nav {
	display: inline-block;
	margin: 0;
	padding-bottom: 10px;
	width: 100%;
}

.inbox-divider {
	border-bottom: 1px solid #d5d8df;
}

ul.inbox-nav li {
	display: inline-block;
	line-height: 45px;
	width: 100%;
}

ul.inbox-nav li a {
	color: #6a6a6a;
	display: inline-block;
	line-height: 45px;
	padding: 0 20px;
	width: 100%;
}

ul.inbox-nav li a:hover, ul.inbox-nav li.active a, ul.inbox-nav li a:focus
	{
	background: none repeat scroll 0 0 #d5d7de;
	color: #6a6a6a;
}

ul.inbox-nav li a i {
	color: #6a6a6a;
	font-size: 16px;
	padding-right: 10px;
}

ul.inbox-nav li a span.label {
	margin-top: 13px;
}

ul.labels-info li h4 {
	color: #5c5c5e;
	font-size: 13px;
	padding-left: 15px;
	padding-right: 15px;
	padding-top: 20px;
	text-transform: uppercase;
	font-weight:600;
}

ul.labels-info li {
	margin: 0;
}

ul.labels-info li a {
	border-radius: 0;
	color: #6a6a6a;
}

ul.labels-info li a:hover, ul.labels-info li a:focus {
	background: none repeat scroll 0 0 #d5d7de;
	color: #6a6a6a;
}

ul.labels-info li a i {
	padding-right: 10px;
}

.nav.nav-pills.nav-stacked.labels-info p {
	color: #9d9f9e;
	font-size: 11px;
	margin-bottom: 0;
	padding: 0 22px;
}

.inbox-head {
	background: none repeat scroll 0 0 #737373;
	border-radius: 0 4px 0 0;
	color: #e6e6e6;
	min-height: 80px;
	padding: 20px;
}

.inbox-head h3 {
	display: inline-block;
	font-weight: 300;
	margin: 0;
	padding-top: 6px;
}

.inbox-head .sr-input {
	border: medium none;
	border-radius: 4px 0 0 4px;
	box-shadow: none;
	color: #8a8a8a;
	float: left;
	height: 40px;
	padding: 0 10px;
}

.inbox-head .sr-btn {
	background: none repeat scroll 0 0 #00a6b2;
	border: medium none;
	border-radius: 0 4px 4px 0;
	color: #fff;
	height: 40px;
	padding: 0 20px;
}

.table-inbox {
	border: 1px solid #d3d3d3;
	margin-bottom: 0;
}

.table-inbox tr td {
	padding: 12px !important;
}

.table-inbox tr td:hover {
	cursor: pointer;
}

.table-inbox tr td .fa-star.inbox-started, .table-inbox tr td .fa-star:hover
	{
	color: #f78a09;
}

.table-inbox tr td .fa-star {
	color: #d5d5d5;
}

.table-inbox tr.unread td {
	background: none repeat scroll 0 0 #f7f7f7;
	font-weight: 600;
}

ul.inbox-pagination {
	float: right;
}

ul.inbox-pagination li {
	float: left;
}

.mail-option {
	display: inline-block;
	margin-bottom: 10px;
	width: 100%;
}

.mail-option .chk-all, .mail-option .btn-group {
	margin-right: 5px;
}

.mail-option .chk-all, .mail-option .btn-group a.btn {
	background: none repeat scroll 0 0 #fcfcfc;
	border: 1px solid #e7e7e7;
	border-radius: 3px !important;
	color: #afafaf;
	display: inline-block;
	padding: 5px 10px;
}

.inbox-pagination a.np-btn {
	background: none repeat scroll 0 0 #fcfcfc;
	border: 1px solid #e7e7e7;
	border-radius: 3px !important;
	color: #afafaf;
	display: inline-block;
	padding: 5px 15px;
}

.mail-option .chk-all input[type="checkbox"] {
	margin-top: 0;
}

.mail-option .btn-group a.all {
	border: medium none;
	padding: 0;
}

.inbox-pagination a.np-btn {
	margin-left: 5px;
}

.inbox-pagination li span {
	display: inline-block;
	margin-right: 5px;
	margin-top: 7px;
}

.fileinput-button {
	background: none repeat scroll 0 0 #eeeeee;
	border: 1px solid #e6e6e6;
}

.inbox-body .modal .modal-body input, .inbox-body .modal .modal-body textarea
	{
	border: 1px solid #e6e6e6;
	box-shadow: none;
}

.btn-send, .btn-send:hover {
	background: none repeat scroll 0 0 #00a8b3;
	color: #fff;
}

.btn-send:hover {
	background: none repeat scroll 0 0 #009da7;
}

.modal-header h4.modal-title {
	font-family: "Open Sans", sans-serif;
	font-weight: 300;
}

.modal-body label {
	font-family: "Open Sans", sans-serif;
	font-weight: 400;
}

.heading-inbox h4 {
	border-bottom: 1px solid #ddd;
	color: #444;
	font-size: 18px;
	margin-top: 20px;
	padding-bottom: 10px;
}

.sender-info {
	margin-bottom: 20px;
}

.sender-info img {
	height: 30px;
	width: 30px;
}

.sender-dropdown {
	background: none repeat scroll 0 0 #eaeaea;
	color: #777;
	font-size: 10px;
	padding: 0 3px;
}

.view-mail a {
	color: #ff6c60;
}

.attachment-mail {
	margin-top: 30px;
}

.attachment-mail ul {
	display: inline-block;
	margin-bottom: 30px;
	width: 100%;
}

.attachment-mail ul li {
	float: left;
	margin-bottom: 10px;
	margin-right: 10px;
	width: 150px;
}

.attachment-mail ul li img {
	width: 100%;
}

.attachment-mail ul li span {
	float: right;
}

.attachment-mail .file-name {
	float: left;
}

.attachment-mail .links {
	display: inline-block;
	width: 100%;
}

.fileinput-button {
	float: left;
	margin-right: 4px;
	overflow: hidden;
	position: relative;
}

.fileinput-button input {
	cursor: pointer;
	direction: ltr;
	font-size: 23px;
	margin: 0;
	opacity: 0;
	position: absolute;
	right: 0;
	top: 0;
	transform: translate(-300px, 0px) scale(4);
}

.fileupload-buttonbar .btn, .fileupload-buttonbar .toggle {
	margin-bottom: 5px;
}

.files .progress {
	width: 200px;
}

.fileupload-processing .fileupload-loading {
	display: block;
}

* html .fileinput-button {
	line-height: 24px;
	margin: 1px -3px 0 0;
}

*+html .fileinput-button {
	margin: 1px 0 0;
	padding: 2px 15px;
}

@media ( max-width : 767px) {
	.files .btn span {
		display: none;
	}
	.files .preview * {
		width: 40px;
	}
	.files .name * {
		display: inline-block;
		width: 80px;
		word-wrap: break-word;
	}
	.files .progress {
		width: 20px;
	}
	.files .delete {
		width: 60px;
	}
}

ul {
	list-style-type: none;
	padding: 0px;
	margin: 0px;
}
</style>
<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
	 $(function(){
		//글자수 표시
	       $('#add').keyup(function() {
	    	 var maxLength = 2000;
	         var length = $(this).val().length;
	         var length = maxLength-length;
	         $('#chars').text(length);
	       });
		 
	     //글자수 표시
	       $('#return').keyup(function() {
	    	 var maxLength = 2000;
	         var length = $(this).val().length;
	         var length = maxLength-length;
	         $('#chars2').text(length);
	       });
		 
		 $("#send").on("click", function(){
				var receiveId=$("input[name='receiveId']").val();
				var title=$("input[name='letTitle']").val();
				var letDetail=$("input[name='letDetail']").val();
				var flag=$("#letReceiveUserId").text().trim();
				
				if(receiveId == null || receiveId.length<1 ){
					alert("수신자는 반드시 입력하셔야 합니다.");
					return false;
				}
				if(title == null || title.length<1){
					alert("제목은 반드시 입력하셔야 합니다.");
					return false;
				}
				if(flag == '존재하지 않는 아이디 입니다.메세지 전송이 불가능 합니다.'){
					alert("존재하지 않는 아이디 입니다.메세지 전송이 불가능 합니다.");
					return false;
				}
				 $("form").attr("method","POST").attr("action","/letter/addLetter").submit();
			 });
		 
		  $("#inBox").on("click", function(){
			 var receiveId = $(this).attr('receiveId');
			 self.location = "/letter/getReceiveLetterList?receiveId="+receiveId;

		 });
		//팔로워프로필로 이동
			$(".followProfile").on("click", function(){
				 var userId = $(this).text().trim();
				 self.location = "/profile/getOtherProfile?userId="+userId;
			 });
		  
		  $("#sendBox").on("click", function(){
				 var sendId = $(this).attr('sendId');
				 self.location = "/letter/getSendLetterList?sendId="+sendId;
			 });
		  
		  $("#saveBox").on("click" , function() {
				 var userId = $(this).attr('userId');
				 self.location = "/letter/getSaveLetterList?userId="+userId;
				});
		 
		 
		  $(".view-message").on("click" , function() {
				var letNo = $(this).attr('letNo');
				var receiveId = $(this).attr('receiveId');
			self.location ="/letter/getLetter?letNo="+letNo+"&receiveId="+receiveId;
			});
		 
		 $("#deleteLetter").on("click" , function() {
			 $("form").attr("method" , "POST").attr("action" , "/letter/updateRecView").submit();
			});
		 
		 $("i.fa").on("click" ,function() {
				
				var flag = $(this).attr('save');
				var requestTarget;
				var asdf;
				
				
				if(flag == "0"){
					requestTarget = "addSave";
					asdf = "fa fa-star inbox-started";
				}else{
					requestTarget = "deleteSave";
					asdf = "fa fa-star";
				}
				var letNo = $(this).attr('letNo');
				$.ajax(
					{
						url : "/letter/"+requestTarget+"/"+letNo,
						method : "GET" ,
						dateType : "json",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"	
						},
						context : this,
						success : function(JSONData , status) {
							
							if(flag==0){
								$(this).removeClass('fa fa-star').addClass('fa fa-star inbox-started');
								$(this).attr('save','1');
							}else{
								$(this).removeClass('fa fa-star inbox-started').addClass('fa fa-star');
								$(this).attr('save','0');
							}
						}
					});
				});
	});	
</script>
</head>

<body>
	<header>
			<jsp:include page="/view/common/toolbar.jsp"/>
		</header>
	<div class="container-fluid" style="padding-right:0px; padding-left:0px;">

		<div class="mail-box">
			<aside class="sm-side">
				<div class="user-head">
					<a class="inbox-avatar" href="javascript:;"> 
					<c:if test="${user.image != null}">
					<img width="50" hieght="60" src="/resources/images/upload/${user.image}">
					</c:if>
					<c:if test="${user.image == null}">
					<img width="50" hieght="60" src="/resources/images/upload/user_img.jpg">
					</c:if>
					</a>
					<div class="user-name">
						<h5>
							<a href="#">${user.userId}</a>
						</h5>

					</div>

				</div>
				<div class="inbox-body">
					<a href="#myModal" data-toggle="modal" title="Compose"
						class="btn btn-compose"> +send mail </a>
					<!-- Modal -->
					<div aria-hidden="true" aria-labelledby="myModalLabel"
						role="dialog" tabindex="-1" id="myModal" class="modal fade"
						style="display: none;">
						<script type="text/javascript">
						$(function(){
	      
	      $("#letReceiveId").on("keyup", function(){
	         
	         var userId = $("#letReceiveId").val();
	                  
	          $.ajax(
	                {
	                    url : "/user/checkId/"+userId,
	                    method : "GET",
	                    dataType : "json",
	                    headers : {
	                       "Accept" : "application/json",
	                       "Content-Type" : "application/json"
	                    },
	                    context : this,
	                    success : function(JSONData, status) {   
	                                            
	                       if(! JSONData.result) {
	                          $("#letReceiveUserId").html("존재하는 아이디입니다.메세지 전송이 가능합니다.");
	                       } 
	                       else {
	                    	   $("#letReceiveUserId").html("존재하지 않는 아이디 입니다.메세지 전송이 불가능 합니다.");
		                       
	                       }
	                    }
	              });         
	         });      
	      });
</script>
						<div class="modal-dialog">

							<div class="modal-content">
								<div class="modal-header">
									<button aria-hidden="true" data-dismiss="modal" class="close"
										type="button">×</button>
									<h4 class="modal-title">Send to mail your partner</h4>
								</div>
								<div class="modal-body">
									<form role="form" id="addMail" class="form-horizontal">

										<div class="form-group">
											<label class="col-lg-2 control-label">From</label>
											<div class="col-lg-10">
												<input type="text" class="form-control" name="sendId"
													value="${sessionScope.user.userId}" readOnly>
											</div>
										</div>

										<div class="form-group">
											<label class="col-lg-2 control-label">To</label>
											<div class="col-lg-10">
												<input type="text" placeholder="수신자를 입력하세요" name="receiveId"
													id="letReceiveId" class="form-control">
												<div id="letReceiveUserId" style="color:#ff6600; padding-left:12px;">수신자를 입력해 주세요</div>
											</div>
										</div>

										<div class="form-group">
											<label class="col-lg-2 control-label">Title</label>
											<div class="col-lg-10">
												<input type="text" name="letTitle"
													placeholder="메일 제목을 입력하세요" class="form-control">
											</div>
										</div>

										<div class="form-group">
															<label class="col-lg-2 control-label">Mail</label>
															<div class="col-lg-10">
																<textarea id="return" maxlength="2000" rows="10" cols="30"
													name="letDetail" placeholder="2000자까지 입력가능"
													class="form-control"></textarea>
												<br /> 2000/<span id="chars2">2000</span>
															</div>
														</div>

										<div class="form-group">
											<div class="col-lg-offset-2 col-lg-10">

												<button class="btn btn-send" type="submit" id="send">send</button>
											</div>
										</div>
									</form>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!-- /.modal -->
				</div>
				<ul class="inbox-nav inbox-divider">
					<li>
						<!-- class="active" --> <a href="#"><i class="fa fa-inbox"
							id="inBox" receiveId="${sessionScope.user.userId}">받은 메일함</i> <!-- <span class="label label-danger pull-right">2</span> --></a>

					</li>
					<li><a href="#"><i class="fa fa-envelope-o" id="sendBox"
							sendId="${sessionScope.user.userId}">보낸 메일함</i></a></li>
					<li><a href="#" id="saveBox"
						userId="${sessionScope.user.userId}"><i
							class="fa fa-bookmark-o">보관메일함</i></a></li>

				</ul>



				<ul class="nav nav-pills nav-stacked labels-info inbox-divider">
					<li>
						<h4>Followers</h4>
					</li>
					<c:set var="i" value="0" />
					<c:forEach var="follow" items="${list2}">
						<c:set var="i" value="${ i+1 }" />

						<li><a href="#" class="followProfile" userId="${user.userId}">
								<i class=" fa fa-sign-blank text-danger"></i>
								${follow.targetUserId}
						</a></li>

					</c:forEach>
				</ul>


			</aside>
			<aside class="lg-side">
				<div class="inbox-head">
					<h3>메일보관함</h3>
					
				</div>
				<div class="inbox-body">
					<div class="mail-option">

						<div class="btn-group hidden-phone">
							<a data-toggle="dropdown" href="#" class="btn mini blue"
								aria-expanded="false"> More <i class="fa fa-angle-down"></i>
							</a>
							<ul class="dropdown-menu">

								<li><a href="#" id="deleteLetter" letNo="${letter.letNo}"><i
										class="fa fa-trash-o"></i> Delete</a></li>
							</ul>
						</div>
					</div>
					<table class="table table-inbox table-hover">
						<tbody>
							<form>
								<c:set var="i" value="0" />
								<c:forEach var="letter" items="${list}">
									<c:set var="i" value="${ i+1 }" />
									<c:if test="${letter.letRecView==0}">
										<!-- 삭제여부 확인 조건문 -->
										<c:if test="${letter.letReaddate==null}">
											<!-- 읽음여부 확인 조건문 -->
											<tr class="unread">
										</c:if>

										<c:if test="${letter.letReaddate!=null}">
											<!-- 읽음여부 확인 조건문 -->
											<tr class="read">
										</c:if>

										<td class="inbox-small-cells"><input type="checkbox"
											name="chbox" value="${letter.letNo}" class="mail-checkbox">
										</td>
										<td class="inbox-small-cells"><c:if
												test="${letter.letSave != '1'}">
												<!-- 편지 보관여부 확인 조건문 -->
												<i id="${letter.letNo}" save="${letter.letSave}"
													letNo="${letter.letNo}" class="fa fa-star"></i>
											</c:if> <c:if test="${letter.letSave == '1'}">
												<!-- 편지 보관여부 확인 조건문 -->

												<i id="${letter.letNo }" save="${letter.letSave}"
													letNo="${letter.letNo}" class="fa fa-star inbox-started"></i>
											</c:if></td>
										<td class="view-message  dont-show" letNo="${letter.letNo}"
											receiveId="${letter.receiveId}">${letter.sendId}</td>
										<td class="view-message" letNo="${letter.letNo}"
											receiveId="${letter.receiveId}">${letter.letTitle}</td>

										<td class="view-message  text-right" letNo="${letter.letNo}"
											receiveId="${letter.receiveId}">${letter.letRegdate}</td>
										</tr>
									</c:if>


								</c:forEach>

							</form>
						</tbody>
					</table>
				</div>
			</aside>
		</div>
	</div>


</body>

</html>
