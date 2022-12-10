<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp"%>  
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
	<script type="text/javascript">
	function validateForm(form) {  // 폼 내용 검증
	    if (form.writer.value == "") {
	        alert("작성자를 입력하세요.");
	        form.writer.focus();
	        return false;
	    }
	    if (form.pass.value == "") {
	        alert("패스워드를 입력하세요.");
	        form.pass.focus();
	        return false;
	    }
	    if (form.title.value == "") {
	        alert("제목을 입력하세요.");
	        form.title.focus();
	        return false;
	    }
	    if (form.content.value == "") {
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
            <h3>게시판 작성 - <small>자유게시판</small></h3>

            <form  name="writeFrm" method="post" action="boardWriteProcess.jsp"
            	onsubmit="return validateForm(this);"
            	action="boardWriteProcess.jsp" method="post">
                <table class="table table-bordered">
                <colgroup>
                    <col width="20%"/>
                    <col width="*"/>
                </colgroup>
                <tbody>
                    <tr>
                        <th class="text-center" 
                            style="vertical-align:middle;">작성자</th>
                        <td>
                            <%=session.getAttribute("UserId")
                            .toString()%>
                        </td>
                    </tr>
                    <tr>
                        <th class="text-center" 
                            style="vertical-align:middle;">패스워드</th>
                        <td>
                            <input type="text" class="form-control" 
                                style="width:200px;" name="pass"/>
                        </td>
                    </tr>
                    <tr>
                        <th class="text-center" 
                            style="vertical-align:middle;">제목</th>
                        <td>
                            <input type="text" class="form-control" 
                            	name="title"/>
                        </td>
                    </tr>
                    <tr>
                        <th class="text-center" 
                            style="vertical-align:middle;">내용</th>
                        <td>
                            <textarea rows="5" class="form-control"
                            	name="content"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <th class="text-center" 
                            style="vertical-align:middle;">첨부파일</th>
                        <td>
                            <input type="file" class="form-control" />
                        </td>
                    </tr>
                    <tr>
                    	<th colspan="2" style="vertical-align:middle;"
                    		class="text-center">
			                <button type="reset">다시 입력</button>
                    	</th>
                    </tr>
                </tbody>
                </table>
                
                <div class="row">
                    <div class="col text-right mb-4">
                        <!-- 각종 버튼 부분 -->
                        <button type="button" class="btn btn-warning" onclick="location.href='boardList.jsp';">리스트보기</button>
                        <button type="submit" class="btn btn-danger">전송하기</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="row border border-dark border-bottom-0 border-right-0 border-left-0"></div>
    <div class="row mb-5 mt-3">
        <%@ include file="./inc/copyright.jsp" %>
    </div>
</div>
</body>
</html>