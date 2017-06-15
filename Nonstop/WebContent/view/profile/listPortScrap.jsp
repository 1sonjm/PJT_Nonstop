<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="ko">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<script src="../../resources/javascript/jquery.js"></script>
<title>List_Portfolio</title>


<script type="text/javascript">
	$(function() {
		//포트폴리오 상세보기
		$(".getScrapPort").on("click",
				function() {
					self.location = "/portfolio/getPortfolio?portNo="+$(this).find('input').val();
				});
	});

	$(function() {
		/* 스크랩추가 */
		$(".portScrap").on("click", function() {

			var flag = $(this).text().trim();
			var requestTarget;
			if (flag == "add to scrap") {
				requestTarget = "addJsonPortScrap";
			} else {
				requestTarget = "deleteJsonPortScrap";
			}
			var portNo = $(this).attr('portNo');
			$.ajax({
				url : "/profile/" + requestTarget + "/" + portNo,
				method : "GET",
				dateType : "json",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				context : this,
				success : function(JSONData, status) {

					if (flag == "add to scrap") {
						 $(this).html("delete to scrap");
						 return false;
					} else {
						 $(this).html("add to scrap"); 
						 return false;
					}

				}
			});
			 return false;
		});
	});
</script>
<style>
 
</style>

</head>

<body>



	<!-- Ranking contents -->
	<div class="container"></div>

	<div class="margin-bottom-50">
		<div class="container">
			<div class="row">
				<!-- Page Content -->
				<c:set var="i" value="0" />
				<c:forEach var="portfolio" items="${scrap}">
					<c:set var="i" value="${i+1}" />

					<c:if test="${portfolio.scrapNo != 0 }">
						<div class="col-md-3 col-sm-3 hero-feature" style="margin-top: 30px; margin-bottom: 20px;">
							<div class="getScrapPort">
								<figure class="effect-sadie">
									<input type="hidden" id="portNo" name="portNo"
										value="${portfolio.portNo}" />

									<div class="thumbnail-portImage">
										<img src="../../resources/images/upload/${portfolio.portFile}" width="400px" height="300px" id="aaaa">
									</div>
									<div class="caption">

										<blockquote>
											<div class="row">
												<div class="col-sm-3 text-center">
													<img class="img-circle" src="/resources/images/upload/${portfolio.portUserImg}" id="aaa" width="50px" height="50px" style="height:50px">
													 <input type="hidden" id="portUserId" name="portUserId" value="${portfolio.portUserId}" />
												</div>
												<div class="col-sm-9">
													<h6>${portfolio.portTitle}</h6>
													<small>${portfolio.portUserId}</small>
												</div>
												<figcaption>
													<p class="hover__active">
														<span class="glyphicon glyphicon-search"
															aria-hidden="false"></span> view portfolio<br />
														<c:if test="${portfolio.scrapNo != 0}">
															<button type="button" class="portScrap"
																portNo="${portfolio.portNo}">delete to scrap</button>
														</c:if>

														<c:if test="${portfolio.scrapNo ==0}">
															<button type="button" class="portScrap"
																portNo="${portfolio.portNo}">add to scrap</button>
														</c:if>


													</p>
													<p class="text-center">
														<span class="glyphicon glyphicon-eye-open"
															aria-hidden="true"></span> ${portfolio.totalPortView}
														&ensp;&ensp;&ensp;&ensp;&ensp; <span
															class="glyphicon glyphicon-heart" aria-hidden="true"></span>
														${portfolio.totalPortLike} &ensp;&ensp;&ensp;&ensp;&ensp;
														<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
														${portfolio.totalPortComment}
													</p>
												</figcaption>
											</div>

										</blockquote>

									</div>
								</figure>
							</div>
						</div>
				</c:if>

				</c:forEach>
				<c:forEach var="portfolio" items="${list5}">
					<c:set var="i" value="${i+1}" />

					<c:if test="${portfolio.scrapNo != 0 }">
						<div class="col-md-3 col-sm-3 hero-feature" style="margin-top: 30px; margin-bottom: 20px;">
							<div class="getScrapPort">
								<figure class="effect-sadie">
									<input type="hidden" id="portNo" name="portNo"
										value="${portfolio.portNo}" />

									<div class="thumbnail-portImage">
										<img src="../../resources/images/upload/${portfolio.portFile}" width="400px" height="300px" id="aaaa">
									</div>
									<div class="caption">

										<blockquote>
											<div class="row">
												<div class="col-sm-3 text-center">
													<img class="img-circle" src="/resources/images/upload/${portfolio.portUserImg}" id="aaa" width="50px" height="50px" style="height:50px">
													 <input type="hidden" id="portUserId" name="portUserId" value="${portfolio.portUserId}" />
												</div>
												<div class="col-sm-9">
													<h6>${portfolio.portTitle}</h6>
													<small>${portfolio.portUserId}</small>
												</div>
												<figcaption>
													<p class="hover__active">
														<span class="glyphicon glyphicon-search"
															aria-hidden="false"></span> view portfolio<br />
														<c:if test="${portfolio.scrapNo != 0}">
															<button type="button" class="portScrap"
																portNo="${portfolio.portNo}">delete to scrap</button>
														</c:if>

														<c:if test="${portfolio.scrapNo ==0}">
															<button type="button" class="portScrap"
																portNo="${portfolio.portNo}">add to scrap</button>
														</c:if>


													</p>
													<p class="text-center">
														<span class="glyphicon glyphicon-eye-open"
															aria-hidden="true"></span> ${portfolio.totalPortView}
														&ensp;&ensp;&ensp;&ensp;&ensp; <span
															class="glyphicon glyphicon-heart" aria-hidden="true"></span>
														${portfolio.totalPortLike} &ensp;&ensp;&ensp;&ensp;&ensp;
														<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
														${portfolio.totalPortComment}
													</p>
												</figcaption>
											</div>

										</blockquote>

									</div>
								</figure>
							</div>
						</div>
				</c:if>

				</c:forEach>
			</div>


		</div>
	</div>

	<!-- pagination -->
	<nav align="center">
		<ul class="pagination">
			<li><a href="#" aria-label="Previous"> <span
					aria-hidden="true">&laquo;</span>
			</a></li>
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
			<li><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
			</a></li>
		</ul>
	</nav>





</body>

</html>
