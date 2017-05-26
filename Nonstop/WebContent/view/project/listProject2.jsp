<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>

<html lang="ko">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Thumbnail Gallery - Start Bootstrap Template</title>

    <!-- Bootstrap Core CSS -->
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<link href="/css/animate.min.css" rel="stylesheet">
	<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
	<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link href="../../resources/css/bootstrap.min.css" rel="stylesheet">

    <link href="../../resources/css/full.css" rel="stylesheet">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    
	<link href='http://fonts.googleapis.com/css?family=Roboto:300italic' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/style.css">
	<script src="bower_components/jquery/dist/jquery.min.js"></script>
	<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	
	<style>
	
	    body{
    		font-family: 'Roboto', sans-serif;
		}
        .well{
            box-shadow: 0 0 0 0;
            border: 0px;
        }
        .base-padding{
            padding: 3% 0;
        }
        .well.pricing-table{
            background: #fff;
            transition:all 0.4s ease-in;
        }
        /* 테이블 쉐도우 */
        .well.pricing-table:hover{
            box-shadow:-22px 17px 6px rgba(178, 171, 171, 0.39);
            transition:all 1s ease-in;
        }
        
        .pricing-feature-list{
            padding: 10%;
            background: #444;
            color: #eee;
        }
        .pricing-feature-list .list-group-item {
			position: relative;
			display: block;
			padding: 13px 15px;
			margin-bottom: -1px;
			background-color: #444;
			font-size: 15px;
			           border: 1px solid #444;
			           color: #eee;
		
		}
        .pricing-table .pricing-table-holder{
            background: url('https://photos-1.dropbox.com/t/2/AACCPJ9m57rbGWc_MCafZdl_PJ_Obe5RT5h6vCC2AgVd_A/12/21457980/jpeg/32x32/3/_/1/2/cyan-pentagonal-background.jpg/CLzYnQogASACIAMoAQ/R7WUFO9GypFsA2Vky1-Q8oSfizbkYKau5N9LHpAUtq0?size=1280x960') center center ;
            background-size: cover;
            padding: 6%;
        }
		.pricing-table .pricing-table-holder h3,.pricing-table .pricing-table-holder p{
		    color: #eee;
		}
        .btn-info{
            color: #fff;
			background-color: #E57575;
			border-color: #F95353;
			padding: 3%;
			transition: all 0.6s ease-in;
        }
        .custom-button-group{
			background: #f9f9f9;
			padding: 0%;
        }
        .btn-royal-blue{
            color: #FFF;
			background-color: #23A4F2;
			border-color: #23A4F2;
            transition: all 0.4s ease-in;
        }
        .btn-royal-blue:hover{
            color: #eee;
            transition: all 0.5s ease-in;
        }
	
	</style>
	
	
	<script type="text/javascript">
	</script>


</head>

<body>
	<div class="container ">
	    <div class="row">
	        <div class="col-md-6 well pricing-table">
	            <div class="custom-button-group" style="">
                    <div class="col-md-1" style="padding:0;">
                        <button type="button" class="btn btn-royal-blue btn-block dropdown-toggle" style="border-radius:0;" data-toggle="dropdown" aria-expanded="false">
                          SELECT BUNDEL
                          <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="#">Dropdown link</a></li>
                          <li><a href="#">Dropdown link</a></li>
                        </ul>
                    </div>

                    <div class="col-md-9" style="padding:0;">
                        <button class="btn btn-primary  btn-block" style="border-radius:0;" >
                            Get It
                        </button>
                    </div>
                    
                    <div class="col-md-2" style="padding:0;">
                        <button class="btn btn-primary  btn-block" style="border-radius:0;" >
                            Get It
                        </button>
                    </div>

	            </div>
	            
	            <div class="pricing-feature-list">
	                <ul class="list-group">
                      <li class="list-group-item">Cras justo odio</li>
                      <li class="list-group-item">Dapibus ac facilisis in</li>
                      <hr>
                      <li class="list-group-item">Cras justo odio</li>
                      <li class="list-group-item">Dapibus ac facilisis in</li>
                    </ul>
	            </div>
	            
	            <div class="price-table-button-holder">
	            	<button class="btn btn-info btn-block">상세보기</button>
	            </div>
	        </div>
	        
	        
	        <div class="col-md-6 well pricing-table">
	            <div class="custom-button-group" style="">
                    <div class="col-md-1" style="padding:0;">
                        <button type="button" class="btn btn-royal-blue btn-block dropdown-toggle" style="border-radius:0;" data-toggle="dropdown" aria-expanded="false">
                          SELECT BUNDEL
                          <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="#">Dropdown link</a></li>
                          <li><a href="#">Dropdown link</a></li>
                        </ul>
                    </div>

                    <div class="col-md-9" style="padding:0;">
                        <button class="btn btn-primary  btn-block" style="border-radius:0;" >
                            Get It
                        </button>
                    </div>
                    
                    <div class="col-md-2" style="padding:0;">
                        <button class="btn btn-primary  btn-block" style="border-radius:0;" >
                            Get It
                        </button>
                    </div>

	            </div>
	            
	            <div class="pricing-feature-list">
	                <ul class="list-group">
                      <li class="list-group-item">Cras justo odio</li>
                      <li class="list-group-item">Dapibus ac facilisis in</li>
                      <hr>
                      <li class="list-group-item">Cras justo odio</li>
                      <li class="list-group-item">Dapibus ac facilisis in</li>
                    </ul>
	            </div>
	            
	            <div class="price-table-button-holder">
	            	<button class="btn btn-info btn-block">상세보기</button>
	            </div>
	        </div>
		</div>
	</div>
	
	
</body>
</html>


			  
