<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>post update</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.css" rel="stylesheet">
<link rel="stylesheet" href="/team1/css/common.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		<div class="main-wrap">
			<div class="inner-wrap">
			<jsp:include page="/WEB-INF/views/common/aside.jsp" />
			<div class="main-contents">
				<form action="<c:url value="/post/update"/>" method = "post" enctype ="multipart/form-data">
					<h3>게시글 수정</h3> 
					<hr>
					<div class="mb-3 mt-3">
					    <label for="board" class="form-label">게시판 선택</label>
					    <select class="form-control" id="board" name="board" required="required">
					    	<c:forEach items="${list}" var="board">
								<option value="${{board.board_id}}">${post.board.board_name}</option>
					    	</c:forEach>
					    </select>
					</div>
					<div class="mb-3 mt-3">
					    <label for="title" class="form-label">제목</label>
					    <input type="text" class="form-control" id="title" placeholder="제목을 입력하세요" name="title" value="${post.post_title}">
					 </div>
					 <div class="mb-3 mt-3">
					    <label for="content" class="form-label">내용</label>
					    <textarea rows="10" class="form-control" id="content" placeholder="내용을 입력하세요" name="content" >${post.post_content}</textarea>
					 </div>
					<div class="mb-3 mt-3">
					    <label for="file" class="form-label" id="attachment">첨부파일</label>
					    <c:forEach items="${fileList}" var="file">
					    	<c:if test="${file.attach_link_check == 0}">
			 					 <a href="<c:url value="/download?filename=${file.attach_path}" />" id="btnDel" class="form-control btn-del" data-target="${file.attach_path}">X</a>
					 		 </c:if>
					    </c:forEach>
					    <c:forEach begin="1" end="${3 - fileList.size()}">
							<input type="file" name="file" class="form-control">
						</c:forEach>
					 </div>
					 
					 <div class="mb-3 mt-6">
					    <label for="youtube" class="form-label">링크</label>
					    	<c:forEach items="${fileList}" var="file">
					    		<c:if test="${file.attach_link_check == 1}">
								    <input type="text" class="form-control" name="youtube" value="${file.attach_path }">
					    		</c:if>
				    		</c:forEach>
					 </div>					 
					 <button class="btn btn-outline-warning col-12 mb-3">게시글 수정</button>
				</form>				
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script>
		let btnDel = document.querySelectorAll(".btn-del");
		let attachment = document.querySelector("#attachment");
		
		btnDel.forEach((element) => {
			element.onclick = function(e) {
				e.preventDefault();
				
				// input hidden 으로 삭제할 첨부파일 번호를 추가
				let num = this.getAttribute("data-target");
				let str = `<input type="hidden" name="fi_num" value="\${num}">`;
				let inputHidden = createElement('input', null, {
					'type' : 'hidden',
					'name' : 'fi_num',
					'value' : `\${num}`
				})
				attachment.prepend(inputHidden);
				
				// span 태그를 삭제
				this.parentElement.remove();
				
				// input file 추가
				let inputFile = createElement('input', null, {
					'type' : 'file',
					'name' : 'file',
					'class' : 'form-control'
				});
				attachment.append(inputFile);
			}
		});
		
		function createElement(tagName, text, attrs) {
			let element = document.createElement(tagName);
			if(text) {
				let textNode = document.createTextNode(text);
				element.append(textNode);
			}
			if(!attrs) {
				return element;
			}
			for (key in attrs) {
				let attr = document.createAttribute(key);
				attr.value= attrs[key];
				element.setAttributeNode(attr);
			}
			return element;
		}
		
		$('#content').summernote({
		  placeholder: 'Hello Bootstrap 4',
		  tabsize: 2,
		  height: 400
		});
	</script>
</body>
</html>