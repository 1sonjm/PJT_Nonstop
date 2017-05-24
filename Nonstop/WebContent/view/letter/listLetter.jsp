<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
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
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
/* 
function fncGetAllList(currentPage){

	$("#currentPage").val(currentPage)

	console.log( "/product/listProduct?menu=${param.menu}");
	$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=${param.menu}").submit();
}
$(function() {
	
	 $( "button.btn.btn-default" ).on("click" , function() {
		 
		fncGetAllList(1);
	});
	//update
	 $("td span.getProduct").on("click", function(){
			//salert("detail");
			var prodNo=$(this).attr('prodNo').trim();
			var menu=$(this).attr('menu').trim();
			self.location="/product/getProduct?prodNo="+prodNo+"&menu="+menu;
			});
	 
	$("td span i").hover( function() {
		
		var prodNo=$(this).attr('prodNo');
		var menu=$(this).attr('menu');
		$.ajax( 
			{
				url : "/product/getJsonProduct/"+prodNo+"/"+menu,
				method : "GET" ,
				dataType : "json" ,
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData , status) {
					$(document).on("click", '#update', function(){
					//	alert("update");

						var prodNo=JSONData.product.prodNo;
						self.location="/product/updateProduct?prodNo="+prodNo;
						});
						//�󼼺���
						$(document).on("click", '#detail', function(){
							//alert("detail");
							var prodNo=JSONData.product.prodNo;
							var menu=$(".ct_list_pop td:nth-child(3) span").attr('sendValue2').trim();
							self.location="/product/getProduct?prodNo="+prodNo+"&menu="+menu;
							});
					
					var displayValue = "<h3>"
								+"��ǰ��ȣ : "+JSONData.product.prodNo+"<br/>"
								+"��ǰ��: "+JSONData.product.prodName+"<br/>"
								+"��ǰ�̹��� : "+JSONData.product.fileName+"<br/>"
								+"��ǰ������ : "+JSONData.product.prodDetail+"<br/>"
								+"�������� :"+JSONData.product.manuDate+"<br/>"
								+"���� :"+JSONData.product.price+"<br/>"
								+"������� :"+JSONData.product.regDate+"<br/>";
								if (menu=="manage"){
								displayValue+="<input id='update' type='button' value='����'/>";
								}
								if (menu=="search"){
									displayValue+="<input id='detail' type='button' value='�󼼺���'/>";
									}
								
								displayValue+="</h3>";
								
				
				$("h3").remove();
				$( "#"+prodNo+"" ).html(displayValue);
				}
		
			});
		
	});
	
	 $( "td span:contains('����ϱ�')" ).css("color","orange");
	
	$( "td span:contains('����ϱ�')" ).on("click" , function() {
		//Debug..
		//alert(  $(this).attr('prodNo') );
		//alert(  $(this).attr('proTranCode') );
		
		self.location ="/purchase/updateTranCodeByProd?prodNo="+$(this).attr('prodNo')+"&tranCode="+$(this).attr('proTranCode');
	});
	
		//==> UI ���� �߰��κ�  :  userId LINK Event End User ���� ���ϼ� �ֵ��� 
	$( "td span.getProduct" ).css("color" , "blue");
				
	$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
	
});	 */

</script>
</head>

<body>
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		
	       <h3>���� ���</h3>
	  
	    </div>
	    
	    <!-- table ���� �˻� Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
	  
		<div class="form-group">
		   <label class="sr-only" for="searchKeyword">�˻���</label>
		   <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="�˻���"
		   			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
		</div>
				  
		  <button type="button" class="btn btn-default">�˻�</button>
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>

      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >�߽���</th>
            <th align="left">������</th>
            <th align="left">��������</th>
            <th align="left">���� ����</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="product" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			<td align="center">${ i }</td>
			
			 <td align="left">

				 ${letter.sendId}
          		
			 </td>
		
			  <td align="left">${letter.receiveId}</td>
			  <td align="left">${letter.letterDetail}</td>
			  <td align="left">
			  
				-
				
			  </td>
			 
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	
 	

	<!-- PageNavigation End... -->
	
</body>

</html>