<%@page import="com.google.gson.Gson"%>
<%@page import="vo.Dept"%>
<%@page import="java.util.List"%>
<%@page import="dao.HrDao"%>
<%@ page contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	// 1. 요청파라미터값 조회하기
	int locationId = Integer.parseInt(request.getParameter("id"));
	System.out.println("소재지 아이디 -> " + locationId);
	
	// 2. 부서목록 조회하기
	HrDao hrDao = new HrDao();
	List<Dept> depts = hrDao.getDeptsByLocId(locationId);
	
	// 3. 부서목록 정보를 json 형식의 텍스트로 변환한다.
	Gson gson = new Gson();
	String text = gson.toJson(depts);
	
	// 4. 응답으로 json 텍스트를 보낸다.
	out.write(text);
%>