<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DM내역 수정</title>
<style>
tr{
	height: 30px;
}
th{
	width: 150px;
	background: whitesmoke;
}
td{
	width: 150px;
}
#in1{
	width: 95%;
	height: 22px;
	margin-left: 2px;
}
#in2{
	width: 15%;
	height: 22px;
	margin-left: 2px;
}
#in3{
	width: 70%;
	height: 22px;
	margin-left: 2px;
}
span{
	font-size: 0.9em;
}
</style>
<script>
	function check() {
			form.action = 'update_dm_p.jsp'
			document.form.submit();
		}
	
	function changesubmit() {
		document.form.submit();
	}
	

</script>
</head>
<body>
<%@ include file="/header.jsp" %>
<%@ include file="/nav.jsp" %>
<%@ include file="/DBconn.jsp" %>
	<section>
<%
	String send_dmno = request.getParameter("dmno");

	String Custid = request.getParameter("custid");
	String Maildate = request.getParameter("maildate");
	String Contents = request.getParameter("contents");
	String Dept = request.getParameter("dept");
	String Grade = request.getParameter("grade");
	String Campain = request.getParameter("campain");

	String author = "";
	
	try{
		String sql= "select dmno, custid, to_char(maildate,'yyyy-mm-dd'), contents, dept, grade, campain from dm0215 where dmno=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, send_dmno);
		rs = pstmt.executeQuery();
		if(rs.next()){
			String dmno = rs.getString(1);
			String custid = rs.getString(2);
			String maildate = rs.getString(3);
			String contents = rs.getString(4);
			String dept = rs.getString(5);
			String grade = rs.getString(6);
			String campain = rs.getString(7);
			
			if(Custid==null){
			}else{
				if(Custid.equals(custid)){					
				}else{
					custid=Custid;
					maildate=Maildate;
					contents=Contents;
					dept=Dept;
					grade=Grade;
					campain=Campain;
				}
			}
				
		sql = "select custid, author from customer0215 where custid=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, custid);
		rs = pstmt.executeQuery();
		if(rs.next()){
			custid = rs.getString(1);
			author = rs.getString(2);
			}else if(custid !=""){
				%>
				<script>
					alert('등록되어 있지 않은 고객ID입니다.');
				</script>
				<%
			}		
				%>

		
	<h2>DM 정보 수정</h2>
	<form name="form" method="post" action="update_dm.jsp">
	<table>
		<tr>
			<th>DM 발송번호</th>
			<td colspan=3><input id="in3" type="text" name="dmno" value="<%=dmno%>" readonly>
			<span>마지막번호+1</span></td>
		</tr>
		
		<tr>
			<th>고객아이디</th>
			<td><input id="in1" type="text" name="custid" value="<%=custid%>" onchange="changesubmit()"></td>
			<th>고객명</th>
			<td><input id="in1" type="text" name="author" value="<%=author%>" readonly></td>
		</tr>
		
		<tr>
			<th>발송일자</th>
			<td><input id="in1" type="text" name="maildate" value="<%=maildate%>"></td>
			<th>DM내용</th>
			<td><input id="in1" type="text" name="contents" value="<%=contents%>"></td>
		</tr>

		<tr>
			<th>발송부서</th>
			<td><input id="in1" type="text" name="dept" value="<%=dept%>"></td>
			<th>고객등급</th>
			<td><select id="sel1" name="grade">
				<option value="1" <%if(grade.equals("1")){%>selected<%}%>>1</option>
				<option value="2" <%if(grade.equals("2")){%>selected<%}%>>2</option>
				<option value="3" <%if(grade.equals("3")){%>selected<%}%>>3</option>
				<option value="4" <%if(grade.equals("4")){%>selected<%}%>>4</option>
				<option value="5" <%if(grade.equals("5")){%>selected<%}%>>5</option>
				<option value="V" <%if(grade.equals("V")){%>selected<%}%>>V</option>
				<option value="W" <%if(grade.equals("W")){%>selected<%}%>>W</option>		
			</select></td>
		</tr>
		
		<tr>
			<th>캠페인 구분</th>
			<td colspan=3><input id="in3" type="text" name="campain" value="<%=campain%>">
		</tr>
		<tr>
			<td colspan=4 align="center">
				<input id="btn2" type="button" value="목록" onclick="location.href='/HRD_0215/dm0215/select_dm.jsp'">
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