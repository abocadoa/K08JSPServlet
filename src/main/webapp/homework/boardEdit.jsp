<%@page import="model1.board.BoardDTO"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./IsLoggedIn.jsp" %>
<%
/* 수정할 게시물의 일련번호를 파라미터로 받아온다. */
String num=request.getParameter("num");
/* DAO객체 생성 */
BoardDAO dao=new BoardDAO(application);
/* 기존 게시물의 내용을 읽어온다. */
BoardDTO dto=dao.selectView(num);
/* 세션영역에 저장된 회원 아이디를 가져와서 문자열로 변환한다. */
String sessionId=session.getAttribute("UserId").toString();
/* 로그인한 회원이 작성자인지 판단한다. */
if(!sessionId.equals(dto.getId())){
	/* 작성자가 아니라면 진입할 수 없도록 뒤로 이동한다. */
	JSFunction.alertBack("작성자 본인만 수정할 수 있습니다.", out);
	return;
}
/* 
URL의 패턴을 파악하면 내가 작성한 게시물이 아니어도 얼마든지
수정페이지로 진입할 수 있다.
따라서 수정페이지 자체에서도 작성자 본인이 맞는지 확인하는 절차가
필요하다.
*/
/* 자원해제 */
dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script type="text/javascript">
function validateForm(form){
	if(form.title.value==""){
		alert("제목을 입력하세요.");
		form.title.focus();
		return false;
	}
	if(form.content.value==""){
		alert("내용을 입력하세요.");
		form.content.focus();
		return false;
	}
}
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<%@ include file="./inc/top.jsp"%>

		</div>
		<div class="row">
			<%@ include file="./inc/left.jsp"%>

			<div class="col-9 pt-3">
				<h3>
					게시판 작성 - <small>자유게시판</small>
				</h3>
				<form name="writeFrm" method="post" action="EditProcess.jsp"
					onsubmit="return validateForm(this);">
					<input type="hid-den" name="num" value="<%= dto.getNum() %>" />
					<table class="table table-bordered">
						<colgroup>
							<col width="20%" />
							<col width="*" />
						</colgroup>
						<tbody>
							<tr>
								<td>제목</td>
								<td><input type="text" name="title" style="width: 90%;"
									value="<%=dto.getTitle()%>" /></td>
							</tr>
							<tr>
								<td>내용</td>
								<td><textarea name="content"
										style="width: 90%; height: 100px;"><%=dto.getContent()%></textarea>
								</td>
							</tr>
							<tr>
								<td colspan="2" align="center">
									<button type="submit">작성 완료</button>
									<button type="reset">다시 입력</button>
									<button type="button" onclick="location.href='boardList.jsp';">
										목록 보기</button>
								</td>
							</tr>
						</tbody>
					</table>

					<div class="row">
						<div class="col text-right mb-4">
							<!-- 각종 버튼 부분 -->
							<button type="button" class="btn btn-warning"
								onclick="location.href='boardList.jsp';">리스트보기</button>
							<button type="submit" class="btn btn-danger">전송하기</button>
							<button type="button" class="btn btn-dark">Reset</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div
			class="row border border-dark border-bottom-0 border-right-0 border-left-0"></div>
		<div class="row mb-5 mt-3">
			<%@ include file="./inc/copyright.jsp"%>
		</div>
	</div>
</body>
</html>