<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고객 목록</title>
<style>
th {
	height: 35px;
	background: whitesmoke;
}

td {
	height: 25px;
	text-align: center;
}
.cnt{
	display: table;
	height: 25px;
	width: 1030px;
	font-size: 0.9em;
	text-align: left;
	margin: 0 auto;
}
</style>
</head>
<body>
	<%@ include file="/header.jsp"%>
	<%@ include file="/nav.jsp"%>
	<%@ include file="/DBconn.jsp"%>
	<section>
		<%
			int cnt = 0;
			try {
				String sql = "select count(*) from customer0215";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					cnt = rs.getInt(1);
				}

			} catch (SQLException e) {
				System.out.println("count 조회 실패");
				e.printStackTrace();
			}
		%>
		<h3>고객 정보 목록</h3>
		<div class="cnt">
			<span>총 <b><%=cnt%>명</b>의 고객이 있습니다.</span>
		</div>
		<table>
			<tr>
				<th width=50>no</th>
				<th width=100>고객아이디</th>
				<th width=100>고객성명</th>
				<th width=250>관심상품</th>
				<th width=120>전화</th>
				<th width=150>이메일</th>
				<th width=90>거주지코드</th>
				<th width=100>거주지</th>
				<th width=60>구분</th>			
			</tr>
			<%
				int no = 0;
				try{
					String sql = "select a.custid, a.author, a.goods, a.phone, a.email, a.areacode, b.areaname from customer0215 a, area0215 b where a.areacode=b.areacode order by a.areacode";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()){
						String custid = rs.getString(1);
						String author = rs.getString(2);
						String goods = rs.getString(3);
						String phone = rs.getString(4);
						String email = rs.getString(5);
						String areacode = rs.getString(6);
						String areaname = rs.getString(7);
						no++;
			%>
			<tr>
				<td><%=no %></td>
				<td><a href="/HRD_0215/cust0215/update_cust.jsp?custid=<%=custid %>"><%=custid %></a></td>
				<td><%=author %></td>
				<td><p id="p1"><%=goods %></p></td>
				<td><%=phone %></td>
				<td><p id="p1"><%=email %></p></td>
				<td><%=areacode %></td>
				<td><%=areaname %></td>
				<td><a href="/HRD_0215/cust0215/delete_cust.jsp?custid=<%=custid %>" onclick="if(!confirm('정말로 삭제하시겠습니까?')){return false}">삭제</a></td>
			</tr>
			<%
					}
					
				} catch (SQLException e) {
					System.out.println("테이블 조회 실패");
					e.printStackTrace();
				}
			%>
		</table>
		<div class="btn_group" align=center>
			<input id="btn1" type="button" value="작 성" onclick="location.href='/HRD_0215/cust0215/add_cust.jsp'">
		</div>
	</section>
	<%@ include file="/footer.jsp"%>
</body>
</html>