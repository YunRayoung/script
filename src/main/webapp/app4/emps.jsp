<%@page import="com.google.gson.Gson"%>
<%@page import="dao.HrDao"%>
<%@page import="vo.Emp"%>
<%@page import="java.util.List"%>
<%@page contentType="application/json; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%
	
	// 요청 파라미터값 조회
	int deptId = Integer.parseInt(request.getParameter("id"));

	// 직원정보 조회하기
	HrDao dao = new HrDao();
	List<Emp> empList = dao.getEmpsByDeptId(deptId);
	
	// json 형식의 텍스트로 변환하기
	Gson gson = new Gson();
	String text = gson.toJson(empList);
	
	// 텍스트를 응답으로 보내기
	out.write(text);
	
	
%>