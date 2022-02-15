<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/DBconn.jsp" %>

<%
	String areacode = request.getParameter("areacode");
	String areaname = request.getParameter("areaname");
	
	try{
		String sql = "update area0215 set areaname=? where areacode=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, areaname);
		pstmt.setString(2, areacode);
		pstmt.executeUpdate();
		System.out.println("거주지 테이블 수정 성공");
		%>
		<script>
			alert('수정이 완료되었습니다!');
			location.href='/HRD_0215/area0215/select_area.jsp';
		</script>
		<%	
		
	}catch(SQLException e){
		System.out.println("수정 실패");
		%>
		<script>
			alert('수정 실패');
		</script>
		<%
		e.printStackTrace();
	}
%>