<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
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
	
		//============= "����"  Event ���� =============
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-primaryl" ).on("click" , function() {
				fncAddCompany();
			});
		});	
		
		
		//============= "���"  Event ó�� ��  ���� =============
		$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				$("form")[0].reset();
			});
		});	
	
		
		function fncAddCompany() {
			
			var id=$("input[name='userId']").val();
			var name=$("input[name='userName']").val();
			var pw=$("input[name='password']").val();
			var pw_confirm=$("input[name='password2']").val();
			var email=$("input[name='email']").val();
			var tel=$("input[name='tel']").val();
			var addr=$("input[name='addr']").val();
			
			
			
			if(id == null || id.length <1){
				alert("���̵�� �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			
			if(name == null || name.length <1){
				alert("�̸��� �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			
			if(pw == null || pw.length <1){
				alert("�н������ �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			if(pw_confirm == null || pw_confirm.length <1){
				alert("�н����� Ȯ����  �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			
			if(email == null || email.length <1){
				alert("�̸����� �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			
			if(tel == null || tel.length <1){
				alert("����ó�� �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			
			if(addr == null || addr.length <1){
				alert("�ּҴ� �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			
			
			if( pw != pw_confirm ) {				
				alert("��й�ȣ Ȯ���� ��ġ���� �ʽ��ϴ�.");
				$("input:text[name='password2']").focus();
				return;
			}
				
			/* var value = "";	
			if( $("input:text[name='phone2']").val() != ""  &&  $("input:text[name='phone3']").val() != "") {
				var value = $("option:selected").val() + "-" 
									+ $("input[name='phone2']").val() + "-" 
									+ $("input[name='phone3']").val();
			}

			$("input:hidden[name='phone']").val( value ); */
			
			$("form").attr("method" , "POST").attr("action" , "/user/addUser").submit();
		}
		

		//==>"�̸���" ��ȿ��Check  Event ó�� �� ����
		 $(function() {
			 
			 $("input[name='email']").on("change" , function() {
				
				 var email=$("input[name='email']").val();
			    
				 if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) ){
			    	alert("�̸��� ������ �ƴմϴ�.");
			     }
			});
			 
		});	
		
		 $(function(){
				$("#datepicker").datepicker({dateFormat:"yy-mm-dd", 
					dayNamesMin: ['��', 'ȭ', '��', '��', '��', '��', '��'], 
					  monthNames : ['1��', '2��', '3��', '4��', '5��', '6��', '7��', '8��', '9��', '10��', '11��', '12��']

				});
		 });
			
	   ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	   //==> �ֹι�ȣ ��ȿ�� check �� ����������....
		
		 ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
		 
		//==>"ID�ߺ�Ȯ��" Event ó�� �� ����
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
		                          $("#checkId").html("�����ϴ� ���̵��Դϴ�.");
		                       
		                       }
		                       else {
		                    	   $("#checkId").html("��밡���� ���̵��Դϴ�.");
			                       
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
            $("#checkpw").html("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
         } else {
            $("#checkpw").text('');
            $("#checkpw").html("��й�ȣ�� ��ġ�մϴ�.");
         }
      });
   }); 

	</script>		
    
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="/index.jsp">Nonstop</a>
   		</div>
   	</div>
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="bg-primary text-center">�� �� ȸ �� �� ��</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		<div class="form-group">
                  <label class="col-md-4 control-label" for="userId">���̵�</label>      
                  <div class="col-md-4">      
                     <input class="form-control input-md" type="text" id="userId" name="userId">
                        <div id="checkId" style="color:red; font-size:12px;">���̵� �Է����ּ���.</div>
                  </div>
               </div>
		  
		  <div class="form-group">
                  <label class="col-md-4 control-label" for="password2">��й�ȣ</label>   
                  <div class="col-md-4">            
                     <input class="form-control input-md" type="password" id="password" name="password">
                  </div>
               </div>      
               
               <div class="form-group">
                  <label class="col-md-4 control-label" for="password2">��й�ȣȮ��</label>   
                  <div class="col-md-4">            
                     <input class="form-control input-md" type="password" id="password2" name="password2">
                        <div id="checkpw" style="color:red; font-size:12px;"></div>
                  </div>
               </div>
		
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">�̸�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userName" name="userName" placeholder="ȸ���̸�">
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <label for="tel" class="col-sm-offset-1 col-sm-3 control-label">����ó</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="tel" name="tel" placeholder="����ó">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="addr" class="col-sm-offset-1 col-sm-3 control-label">�ּ�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="addr" name="addr" placeholder="�ּ�">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="companyName" class="col-sm-offset-1 col-sm-3 control-label">�����</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="companyName" name="companyName" placeholder="�����">
		    </div>
		  </div>
		  
		  
		  
		   <div class="form-group">
		    <label for="empNum" class="col-sm-offset-1 col-sm-3 control-label">������</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="empNum" name="empNum" placeholder="������">
		    </div>
		  </div>
		  
		 <div class="form-group">
		    <label for="pubDate" class="col-sm-offset-1 col-sm-3 control-label">������</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control"  id="datepicker" name="pubDate" placeholder="�̰��� Ŭ���Ͽ� �������� ������ �ּ���"  readonly>
		       <span id="helpBlock" class="help-block">
		      	<strong class="text-danger" >�������� �����ϼ���</strong>
		      </span>
		    </div>
		  </div>
		  
		  
		   <div class="form-group">
		    <label for="email" class="col-sm-offset-1 col-sm-3 control-label">�̸���</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="email" name="email" placeholder="�̸���">
		    </div>
		  </div>
		  
		  
		  
		  
		  <div class="form-group">
		    <label for="image" class="col-sm-offset-1 col-sm-3 control-label">������ ����</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="image" name="image" placeholder="����">
		    </div>
		  </div>
		  
		  
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primaryl"  >�� &nbsp;��</button>
			  <a class="btn btn-primary btn" href="#" role="button">��&nbsp;��</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->
	
</body>

</html>