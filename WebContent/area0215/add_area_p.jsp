<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/DBconn.jsp" %>

<%
	String areacode = request.getParameter("areacode");
	String areaname = request.getParameter("areaname");
	
	try{
		String sql = "insert into area0215 values(?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, areacode);
		pstmt.setString(2, areaname);
		pstmt.executeUpdate();
		System.out.println("거주지 테이블 등록 성공");
		%>
		<script>
			alert('등록이 완료되었습니다!');
			location.href='/HRD_0215/area0215/select_area.jsp';
		</script>
		<%	
		
	}catch(SQLException e){
		System.out.println("등록 실패");
		%>
		<script>
			alert('등록 실패');
		</script>
		<%
		e.printStackTrace();
	}
%>