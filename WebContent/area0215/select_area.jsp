<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>거주지 목록</title>
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
	width: 480px;
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
				String sql = "select count(*) from area0215";
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
		<h3>거주지 정보 목록</h3>
		<div class="cnt">
			<span>총 <b><%=cnt%>개</b>의 거주지가 있습니다.</span>
		</div>
		<table>
			<tr>
				<th width=60>no</th>
				<th width=100>거주지 코드</th>
				<th width=200>거주지 이름</th>
				<th width=120>구분</th>			
			</tr>
			<%
				int no = 0;
				try{
					String sql = "select * from area0215 order by areacode";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()){
						String areacode = rs.getString(1);
						String areaname = rs.getString(2);
						no++;
			%>
			<tr>
				<td><%=no %></td>
				<td><%=areacode %></td>
				<td><%=areaname %></td>
				<td><a href="/HRD_0215/area0215/update_area.jsp?areacode=<%=areacode %>">수정</a>
				<span>/</span>
				<a href="/HRD_0215/area0215/delete_area.jsp?areacode=<%=areacode %>" onclick="if(!confirm('정말로 삭제하시겠습니까?')){return false}">삭제</a>
				</td>
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
			<input id="btn1" type="button" value="작 성" onclick="location.href='/HRD_0215/area0215/add_area.jsp'">
		</div>
	</section>
	<%@ include file="/footer.jsp"%>
</body>
</html>