<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고객정보 등록</title>
<style>
tr{
	height: 30px;
}
th{
	width: 120px;
	background: whitesmoke;
}
td{
	width: 600px;
}
#in1{
	width: 50%;
	height: 22px;
	margin-left: 2px;
}
#in2{
	width: 15%;
	height: 22px;
	margin-left: 2px;
}
#in3{
	width: 30%;
	height: 22px;
	margin-left: 2px;
}
</style>
<script>
	function check() {
		if(document.form.custid.value==""){
			alert('고객아이디를 입력하세요.');
			document.form.custid.focus();
		}else if(document.form.author.value==""){
			alert('고객이름을 입력하세요.');
			document.form.author.focus();
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
	<h2>고객 정보 등록 화면</h2>
	<form name="form" method="post" action="add_cust_p.jsp">
	<table>
		<tr>
			<th>고객 아이디</th>
			<td><input id="in1" type="text" name="custid"></td>
		</tr>
		
		<tr>
			<th>고객 성명</th>
			<td><input id="in1" type="text" name="author"></td>
		</tr>
		
		<tr>
			<th>관심상품</th>
			<td>
				<label><input id="chk1" type="checkbox" name="goods" value="의료">의료</label>
				<label><input id="chk1" type="checkbox" name="goods" value="식료품">식료품</label>
				<label><input id="chk1" type="checkbox" name="goods" value="컴퓨터">컴퓨터</label>
				<label><input id="chk1" type="checkbox" name="goods" value="공산품">공산품</label>
				<label><input id="chk1" type="checkbox" name="goods" value="관광">관광</label>
				<label><input id="chk1" type="checkbox" name="goods" value="전자제품">전자제품</label>
				<label><input id="chk1" type="checkbox" name="goods" value="건강제품">건강제품</label>
				<label><input id="chk1" type="checkbox" name="goods" value="운동기구">운동기구</label>
			</td>
		</tr>

		<tr>
			<th>전 화</th>
			<td>
				<input id="in2" type="text" name="phone1">
				<span>-</span>
				<input id="in2" type="text" name="phone2">
				<span>-</span>
				<input id="in2" type="text" name="phone3">
			</td>
		</tr>
		
		<tr>
			<th>이메일</th>
			<td>
				<input id="in3" type="text" name="email1">
				<span>@</span>
				<input id="in3" type="text" name="email2">
			</td>
		</tr>
		
		<tr>
			<th>거주지</th>
			<td><select id="sel1" name="areacode">
				<option value="101" selected>서울</option>
				<option value="102">경기</option>
				<option value="103">대전</option>
				<option value="104">부산</option>
				<option value="105">광주</option>
				<option value="106">울산</option>
				<option value="107">대구</option>
				<option value="108">강원</option>
				<option value="109">경상</option>
				<option value="110">충청</option>
				<option value="111">제주</option>			
			</select></td>
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