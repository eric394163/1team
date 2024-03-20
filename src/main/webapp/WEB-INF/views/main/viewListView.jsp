<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>PlayGround - 뮤직 커뮤니티</title>
  </head>
  <body>
    <h1>조회수 순으로 게시글 정렬</h1>
    <c:forEach items="${popularViewPostList}" var="post">  
    <!--"${posts}" 는 컨트롤러에서 보낸 값을 post로 받아오고 post. 으로 컨트롤러에서 보낸 값 사용  -->
        <li class="post-item">
            <span> 게시글 제목: ${post.post_title}</span>,
            <span> 조회수: ${post.post_view}</span>
        </li>
    </c:forEach>
  </body>
</html>
