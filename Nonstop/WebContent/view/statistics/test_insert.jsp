<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="UTF-8">
</head>
<body>
	
	<form action="/statistics/aaa">
		수요<input 	type="text" name="demand"><br/>
		공급<input 	type="text" name="supply"><br/>
		사용비율<input 	type="text" name="userRate"><br/>
		지역<input 	type="text" name="location"><br/>
		기술명<input 	type="text" name="techName"><br/>
		기술구분<input 	type="text" name="techClass"><br/>
		
		<input type="submit" value="전송">
	</form>

</body>

</html>