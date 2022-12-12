<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현 언어(EL)-객체 매개변수</title>
</head>
<body>
	<h2>영역을 통해 전달된 객체 읽기</h2>
	<!-- 
	영역에 저장된 속성에 EL로 접근할때는 속성명이 중복되지 않는 경우라면
	EL내장객체없이 속성명으로 만으로 접근할 수 있다.
	즉, requestScope.personObj.name형태로 기술하지 않아도 된다.
	 -->
	<ul>
		<!-- 
		속송명.멤버변수"형태로 기술하면 객체에 선언된 getter()를 자동으로
		호출하여 값을 받아낸다.
		즉, 아래 문장은 getter()를 호출하므로 Person클래스에서 getName()을
		주석처리하면 에러가 발생한다.
		또한 출력시 형변환이 자동으로 되므로 더욱 편리하ㅏ.
		 -->
		<li>Person객체=>이름:${personObj.name },
			나이:${personObj.age }</li>
		<!-- 리퀘스트영역을 지정하는 requestScope는 생략할 수 있다. -->
		<li>String객체=>${requestScope.stringObj }</li>
		<li>Integer객체=>${integerObj }</li>
	</ul>
	
	<h2>JSP내장객체를 통해 영역의 값 읽어오기</h2>
	<%
	Object object=request.getAttribute("personObj");
	Person person=(Person)object;
	out.println("이름:"+ person.getName());
	%>
	<!-- 
	파라미터로 전달된 값을 일을때 아래 3가지 방법을 사용할 수 있다.
		param.파라미터명
		param['파라미터명']
		param["파라미터명"]
	 -->
	<h2>매개변수로 전달된 값 읽기</h2>
	<ul>
		<!-- EL에서는 산술연산이 가능하므로 아래에서는 30이 출력된다.
		또한 파라미터로 전달된 문자열을 정수로 자동변환 해준다. -->
		<li>${param.firstNum+param['secondNum'] }</li>
		<!-- 단순한 출력이므로 10~20이 출력된다. -->
		<li>${param.firstNum}+${param["secondNum"] }</li>
	</ul>
</body>
</html>