<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>거주지 등록</title>
<style>
tr{
	height: 30px;
}
th{
	width: 120px;
	background: whitesmoke;
}
td{
	width: 250px;
}
#in1{
	width: 50%;
	height: 22px;
	margin-left: 2px;
}
#in2{
	width: 90%;
	height: 22px;
	margin-left: 2px;
}

</style>
<script>
	function check() {
		if(document.form.areacode.value==""){
			alert('거주지코드를 입력하세요.');
			document.form.areacode.focus();
		}else if(document.form.areaname.value==""){
			alert('거주지이름을 입력하세요.');
			document.form.areaname.focus();
		}else{
			document.form.submit();
		}
	}

</script>
</head>
<body>
<%@ include file="/header.jsp" %>
<%@ include file="/nav.jsp" %>
	<section>
	<h2>거주지 정보 등록 화면</h2>
	<form name="form" method="post" action="add_area_p.jsp">
	<table>
		<tr>
			<th>거주지 코드</th>
			<td><input id="in1" type="text" name="areacode"></td>
		</tr>
		
		<tr>
			<th>거주지 이름</th>
			<td><input id="in2" type="text" name="areaname"></td>
		</tr>
		
		<tr id="tr_btn">
			<td colspan=2 align="center">
				<input id="btn2" type="button" value="등록" onclick="check()">
				<input id="btn2" type="button" value="취소" onclick="location.href='/HRD_0215/index.jsp'">
			</td>
		</tr>		
	</table>	
	</form>	
	</section>
<%@ include file="/footer.jsp" %>
</body>
</html>