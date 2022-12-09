<%@page import="model1.board.BoardDTO"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/* 목록에서 제목을 클릭하면 게시물의 일련번호를 ?num=99와 같이
받아온다.
따라서 내용보기를 위해 해당 파라미터를 받아온다.*/
String num=request.getParameter("num");

/* DAO객체 생성을 통해 오라클에 연결한다. */
BoardDAO dao=new BoardDAO(application);
/* 게시물의 조회수 증가 */
dao.updateVisitCount(num);
/* 게시물의 내용을 인출하여 DTO로 반환받는다. */
BoardDTO dto=dao.selectView(num);
/* 자원해제 */
dao.close();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">    
</head>
<body>
<div class="container">
    <div class="row">
        <%@ include file="./inc/top.jsp"%>
    </div>
    <div class="row">
        <%@ include file="./inc/left.jsp"%>
        <div class="col-9 pt-3">
            <h3>게시판 내용보기 - <small>자유게시판</small></h3>

            <form>
            <table class="table table-bordered">
            <colgroup>
                <col width="20%"/>
                <col width="30%"/>
                <col width="20%"/>
                <col width="*"/>
            </colgroup>
            <tbody>
                <tr>
                    <th class="text-center" 
                        style="vertical-align:middle;">작성자</th>
                    <td>
                        <%= dto.getName() %>
                    </td>
                    <th class="text-center" 
                        style="vertical-align:middle;">작성일</th>
                    <td>
                        2018-01-05
                    </td>
                </tr>
                <tr>
                    <th class="text-center" 
                        style="vertical-align:middle;">이메일</th>
                    <td>
                        nakjasabal@naver.com
                    </td>
                    <th class="text-center" 
                        style="vertical-align:middle;">조회수</th>
                    <td>
                        100
                    </td>
                </tr>
                <tr>
                    <th class="text-center" 
                        style="vertical-align:middle;">제목</th>
                    <td colspan="3">
                        제목영역입니다.
                    </td>
                </tr>
                <tr>
                    <th class="text-center" 
                        style="vertical-align:middle;">내용</th>
                    <td colspan="3">
                        내용영역입니다<br/>
                        내용영역입니다<br/>
                        내용영역입니다<br/>
                        내용영역입니다<br/>
                        내용영역입니다<br/>
                    </td>
                </tr>
                <tr>
                    <th class="text-center" 
                        style="vertical-align:middle;">첨부파일</th>
                    <td colspan="3">
                        파일명.jpg
                    </td>
                </tr>
            </tbody>
            </table>
            
            <div class="row">
                <div class="col text-right mb-4">
                    <!-- 각종 버튼 부분 -->
                    <button type="button" class="btn">Basic</button>
                    <button type="button" class="btn btn-primary" onclick="location.href='boardWrite.jsp';">글쓰기</button>
                    <button type="button" class="btn btn-secondary">수정하기</button>
                    <button type="button" class="btn btn-success">삭제하기</button>
                    <button type="button" class="btn btn-info">답글쓰기</button>
                    <button type="button" class="btn btn-warning">리스트보기</button>
                    <button type="button" class="btn btn-danger">전송하기</button>
                    <button type="button" class="btn btn-dark">Reset</button>
                    <button type="button" class="btn btn-light">Light</button>
                    <button type="button" class="btn btn-link">Link</button>
                </div>
            </div>
            </form> 
        </div>
    </div>
    <div class="row border border-dark border-bottom-0 border-right-0 border-left-0"></div>
    <div class="row mb-5 mt-3">
       <%@ include file="./inc/copyright.jsp"%>
    </div>
</div>
</body>
</html>