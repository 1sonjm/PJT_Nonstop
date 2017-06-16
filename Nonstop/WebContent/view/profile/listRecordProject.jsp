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




<!-- Bootstrap Dropdown Hover CSS -->

<style>
body {
	padding-top: 50px;
}
</style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">

</script>
</head>

<body>
	<div class="row">
		<!-- Column -->
		<div class="col-md-12">
			<div class="card">
				<div class="col-md-12">
					<div class="page-header text-center">
						<h5 class=" text-left" style="padding-left: 10px; font-size: 16px">프로젝트
							작업이력</h5>
					</div>

					<table class="table table-hover">
						<thead>
							<tr>
								<th>No</th>
								<th>기업명</th>
								<th>프로젝트 명</th>
								<th>프로젝트 기간</th>
							</tr>
						</thead>

						<tbody>

							<c:set var="i" value="0" />
							<c:forEach var="recordProject" items="${recordProject}">
								<c:set var="i" value="${ i+1 }" />
								<tr>
									<th scope="row">${ i }</th>

									<td>${recordProject.comName}</td>

									<td>${recordProject.proTitle}</td>

									<td>${recordProject.proStartDate}~
										${recordProject.proendDate}</td>


								</tr>
							</c:forEach>

						</tbody>

					</table>
					<!--  table End /////////////////////////////////////-->
				</div>
			</div>
		</div>
	</div>



</body>

</html>
