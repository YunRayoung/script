<%@page import="dao.HrDao"%>
<%@page import="vo.Location"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	HrDao dao = new HrDao();

	// 모든 도시정보를 조회한다.
	List<Location> locList = dao.getLocations();
%>
<!doctype html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
	<h1>ajax 실습</h1>
	
	<h3>부서 조회</h3>
	<div>
		<label>도시명</label>
		<select id="city" onchange="refreshDepts();">
			<option value="" selected disabled>--선택하세요--</option>
<%
	for (Location loc : locList) {
%>
		<option value="<%=loc.getId()%>"><%=loc.getCity() %></option>
<%		
	}
%>
		</select>
	</div>
	<div>
		<label>부서명</label>
		<select id="dept" onchange="refreshEmps()">
			<option>--선택하세요--</option>
		</select>
	</div>
	
	<div>
		<h3>직원리스트</h3>
		<table class="table" id="table-employees">
			<thead>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>이메일</th>
				<th>전화번호</th>
				<th>직종아이디</th>
				<th>급여</th>
			</tr>
			</thead>
			<tbody></tbody>
		</table>
		
		
	</div>
<script type="text/javascript">
	function refreshEmps() {
		// select 박스에서 선택된 값 조회하기
		let empId = document.getElementById("dept").value;
		
		// ajax요청
		let xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if(xhr.readyState === 4) {
				let text = xhr.responseText;
				let arr = JSON.parse(text);
				
				let htmlContents = "";
				arr.forEach(function(item, index) {
					htmlContents += `
						<tr>
							<td>\${item.id}</td>
							<td>\${item.firstName} \${item.lastName}</td>
							<td>\${item.email}</td>
							<td>\${item.phoneNumber}</td>
							<td>\${item.jobId}</td>
							<td>\${item.salary}</td>
						</tr>
					`;
				});
				
				document.querySelector("#table-employees tbody").innerHTML = htmlContents;
			}
			
		};
		// post일때 null자리에 데이터를  넣는다.
		xhr.open("GET", "emps.jsp?id=" + deptId);
		xhr.send(null);
	}

	function refreshDepts() {
		// select 박스의 현재 선택된 값을 조회한다.
		let locId = document.getElementById("city").value;
		//alert(locId);
		
		// ajax통신하기
		// 1. XMLHttpRequest 객체 생성하기
		let xhr = new XMLHttpRequest();
		
		// 2. XMLHttpRequest 객체에서 onreadystatechange 이벤트가 발생할때 마다 실행할 함수 지정
		xhr.onreadystatechange = function() {
			// console.log("readyState", xhr.readyState)
			if (xhr.readyState === 4) {
				// 1.응답데이터 조회
				let data = xhr.responseText;
				//console.log(data);
				//data -> '[[{"id"=100, "name":"기술부"}, {"id":101, "name":"영업부"}]'
				
				// 2.응답데이터(텍스트)를 객체(자바스크립트 객체 혹은 배열객체)로 변환하기
				let arr = JSON.parse(data);	// arr -> [{id=100, name:"기술부"}, {id:101, name:"영업부"}]
				// 3. 응답데이터로 html컨텐츠 생성하기
				let htmlContent = "<option value='' selected disabled>--선택하세요--</option>";
				//console.log(arr);
				arr.forEach(function(item, index) {
					// item -> {id:100, name:"기술부"};
					let deptId = item.id;
					let deptName = item.name;
					
					htmlContent += `<option value="\${deptId}"> \${deptName}</option>`;
					//console.log(option);
				});
				// 4. 화면에 html 컨텐츠 반영시키기
				document.getElementById("dept").innerHTML = htmlContent;
			}
		}
		// 3. XMLhttpRequest 객체 초기화하기(요청방식, 요청URL 지정)
		xhr.open("GET", "depts.jsp?id=" + locId);
		// 4. 서버로 요청 보내기
		xhr.send(null);
	}
</script>
</body>
</html>

