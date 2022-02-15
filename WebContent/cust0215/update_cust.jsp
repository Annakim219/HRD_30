<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고객정보 수정</title>
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
<%@ include file="/DBconn.jsp" %>
	<section>
<%
	String send_custid = request.getParameter("custid");

	try{
		String sql = "select * from customer0215 where custid=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, send_custid);
		rs = pstmt.executeQuery();
		if(rs.next()){
			String custid = rs.getString(1);
			String author = rs.getString(2);
			String goods = rs.getString(3);
			String phone = rs.getString(4);
			String email = rs.getString(5);
			String areacode = rs.getString(6);
			
			
			String arr_phone[] = phone.split("-");
			String arr_email[] = email.split("@");
			String arr_goods[] = goods.split(",");
		%>

	<h2>고객 정보 수정 화면</h2>
	<form name="form" method="post" action="update_cust_p.jsp">
	<table>
		<tr>
			<th>고객 아이디</th>
			<td><input id="in1" type="text" name="custid" value="<%=custid%>" readonly></td>
		</tr>
		
		<tr>
			<th>고객 성명</th>
			<td><input id="in1" type="text" name="author" value="<%=author%>"></td>
		</tr>
		
		<tr>
			<th>관심상품</th>
			<td>
				<label><input id="chk1" type="checkbox" name="goods" value="의료" <%for(int i=0;i<arr_goods.length;i++)if("의료".equals(arr_goods[i]))out.print("checked");%>>의류</label>
				<label><input id="chk1" type="checkbox" name="goods" value="식료품" <%for(int i=0;i<arr_goods.length;i++)if("식료품".equals(arr_goods[i]))out.print("checked"); %>>식료품</label>
				<label><input id="chk1" type="checkbox" name="goods" value="컴퓨터" <%for(int i=0;i<arr_goods.length;i++)if("컴퓨터".equals(arr_goods[i]))out.print("checked"); %>>컴퓨터</label>
				<label><input id="chk1" type="checkbox" name="goods" value="공산품" <%for(int i=0;i<arr_goods.length;i++)if("공산품".equals(arr_goods[i]))out.print("checked"); %>>공산품</label>
				<label><input id="chk1" type="checkbox" name="goods" value="관광" <%for(int i=0;i<arr_goods.length;i++)if("관광".equals(arr_goods[i]))out.print("checked"); %>>관광</label>
				<label><input id="chk1" type="checkbox" name="goods" value="전자제품" <%for(int i=0;i<arr_goods.length;i++)if("전자제품".equals(arr_goods[i]))out.print("checked"); %>>전자제품</label>
				<label><input id="chk1" type="checkbox" name="goods" value="건강제품" <%for(int i=0;i<arr_goods.length;i++)if("건강제품".equals(arr_goods[i]))out.print("checked"); %>>건강제품</label>
				<label><input id="chk1" type="checkbox" name="goods" value="운동기구" <%for(int i=0;i<arr_goods.length;i++)if("운동기구".equals(arr_goods[i]))out.print("checked"); %>>운동기구</label>
			</td>
		</tr>

		<tr>
			<th>전 화</th>
			<td>
				<input id="in2" type="text" name="phone1" value="<%=arr_phone[0] %>">
				<span>-</span>
				<input id="in2" type="text" name="phone2" value="<%=arr_phone[1] %>">
				<span>-</span>
				<input id="in2" type="text" name="phone3" value="<%=arr_phone[2] %>">
			</td>
		</tr>
		
		<tr>
			<th>이메일</th>
			<td>
				<input id="in3" type="text" name="email1" value="<%=arr_email[0] %>">
				<span>@</span>
				<input id="in3" type="text" name="email2" value="<%=arr_email[1] %>">
			</td>
		</tr>
		
		<tr>
			<th>거주지</th>
			<td><select id="sel1" name="areacode">
				<option value="101" <%if(areacode.equals("101")){%>selected<%}%>>서울</option>
				<option value="102" <%if(areacode.equals("102")){%>selected<%}%>>경기</option>
				<option value="103" <%if(areacode.equals("103")){%>selected<%}%>>대전</option>
				<option value="104" <%if(areacode.equals("104")){%>selected<%}%>>부산</option>
				<option value="105" <%if(areacode.equals("105")){%>selected<%}%>>광주</option>
				<option value="106" <%if(areacode.equals("106")){%>selected<%}%>>울산</option>
				<option value="107" <%if(areacode.equals("107")){%>selected<%}%>>대구</option>
				<option value="108" <%if(areacode.equals("108")){%>selected<%}%>>강원</option>
				<option value="109" <%if(areacode.equals("109")){%>selected<%}%>>경상</option>
				<option value="110" <%if(areacode.equals("110")){%>selected<%}%>>충청</option>
				<option value="111" <%if(areacode.equals("111")){%>selected<%}%>>제주</option>			
			</select></td>
		</tr>
		
		<tr id="tr_btn">
			<td colspan=2 align="center">
				<input id="btn2" type="button" value="목록" onclick="location.href='/HRD_0215/cust0215/select_cust.jsp'">
				<input id="btn2" type="button" value="수정" onclick="check()">				
			</td>
		</tr>		
	</table>	
	</form>	
			<%
		}
				
		
	}catch(SQLException e){
		System.out.println("테이블 조회 실패");
		e.printStackTrace();
	}
%>
	</section>
<%@ include file="/footer.jsp" %>
</body>
</html>