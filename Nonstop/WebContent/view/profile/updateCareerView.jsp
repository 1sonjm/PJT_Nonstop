
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


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
	function fncUpdateProduct(){
		//Form ��ȿ�� ����
	 	var name = $("input[name='prodName']").val();
		var detail=$("input[name='prodDetail']").val();
		var manuDate=$("input[name='manuDate']").val();
		var price=$("input[name='price']").val();

		if(name == null || name.length<1){
			alert("��ǰ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
		if(detail == null || detail.length<1){
			alert("��ǰ�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
		if(manuDate == null || manuDate.length<1){
			alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}
		if(price == null || price.length<1){
			alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}
			
		$("form").attr("method" , "POST").attr("action" , "/product/updateProduct").submit();
	}
	$(function(){
		$("#datepicker").datepicker(
				
			{dateFormat:"yy-mm-dd", 
			dayNamesMin: ['��', 'ȭ', '��', '��', '��', '��', '��'], 
			  monthNames : ['1��', '2��', '3��', '4��', '5��', '6��', '7��', '8��', '9��', '10��', '11��', '12��']
					
		});
		
	});
	$(function() {
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
		 $( "#update" ).on("click" , function() {
			//Debug..
			//alert("d");
			fncUpdateProduct();
		});
		
		 $( "#back" ).bind("click" , function() {
				//Debug..
				//alert("d");
				self.location="/product/listProduct?menu=manage";	
		});
		 
	});	
	
	</script>

</head>

<body>

	<div class="container">
	
		<div class="page-header text-center">
	       <h3 class=" text-info">���α������</h3>
	    </div>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		  <div class="form-group">
		    <label for="techName" class="col-sm-offset-1 col-sm-3 control-label">�����</label>
		    <div class="col-sm-2">
		      <input type="text" class="form-control" id="techName" name="techName" value="${career.techName}">
		      
		    </div>
		  </div>
		
		 <div class="form-group">
		    <label for="careerUseTerm" class="col-sm-offset-1 col-sm-3 control-label">��� ���Ⱓ</label>
		    <div class="col-sm-2">
		      <input type="text" class="form-control" id="careerUseTerm" name="careerUseTerm" value="${career.careerUseTerm}" >
		    </div>
		  </div> 
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary" id="update" >�� &nbsp;��</button>
			  <a class="btn btn-primary btn" href="#" role="button" id="back">�� &nbsp;��</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
	    
 	</div>
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
 	
</body>

</html>