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
    <ul class="list-box">
	    <c:forEach items="${popularLikePostList}" var="post" begin="0" end="10" varStatus="status">  
	    <!--"${posts}" 는 컨트롤러에서 보낸 값을 post로 받아오고 post. 으로 컨트롤러에서 보낸 값 사용  -->
	        <li>
	        	<span>${status.index + 1}</span>
	            <span><a href="<c:url value="/post/detail?num=${post.post_id}" />">${post.post_title}</a></span>
	            <span><img src="/team1/images/like_icon.svg" alt="조회수" width="20" class="like">${post.post_upvotes}</span>
	        </li>
	    </c:forEach>
    </ul>
  </body>
</html>
