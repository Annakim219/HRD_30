<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DM정보 목록</title>
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
	width: 980px;
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
				String sql = "select count(*) from dm0215";
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
		<h3>DM 발송 내역</h3>
		<div class="cnt">
			<span>총 <b><%=cnt%>건</b>의 발송내역이 있습니다.</span>
		</div>
		<table>
			<tr>
				<th width=50>no</th>
				<th width=105>DM발송번호</th>
				<th width=100>고객아이디</th>
				<th width=100>고객성명</th>
				<th width=120>발송일자</th>
				<th width=180>DM 내용</th>
				<th width=80>발송부서</th>
				<th width=80>고객등급</th>
				<th width=95>캠페인구분</th>
				<th width=60>구분</th>			
			</tr>
			<%
				int no = 0;
				try{
					String sql = "select a.dmno, a.custid, b.author, to_char(a.maildate,'yyyy-mm-dd'),a.contents, a.dept, a.grade, a.campain from dm0215 a, customer0215 b where a.custid=b.custid order by a.dmno";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()){
						String dmno = rs.getString(1);
						String custid = rs.getString(2);
						String author = rs.getString(3);
						String maildate = rs.getString(4);
						String contents = rs.getString(5);
						String dept = rs.getString(6);
						String grade = rs.getString(7);
						String campain = rs.getString(8);
						no++;
			%>
			<tr>
				<td><%=no %></td>
				<td><a href="/HRD_0215/dm0215/update_dm.jsp?dmno=<%=dmno %>"><%=dmno %></a></td>
				<td><%=custid %></td>
				<td><%=author %></td>
				<td><%=maildate %></td>
				<td><p id="p1"><%=contents %></p></td>
				<td><%=dept %></td>
				<td><%=grade %></td>
				<td><%=campain %></td>
				<td><a href="/HRD_0215/dm0215/delete_dm.jsp?dmno=<%=dmno %>" onclick="if(!confirm('정말로 삭제하시겠습니까?')){return false}">삭제</a></td>
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
			<input id="btn1" type="button" value="작 성" onclick="location.href='/HRD_0215/dm0215/add_dm.jsp'">
		</div>
	</section>
	<%@ include file="/footer.jsp"%>
</body>
</html>