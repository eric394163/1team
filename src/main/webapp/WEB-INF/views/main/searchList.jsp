<!-- 사이트 상단 검색에서 검색시 검색 결과 페이지 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>PlayGround - 뮤직 커뮤니티</title>
    <link
      rel="shortcut icon"
      href="/team1/images/favicon.png"
      type="image/png"
    />
    <!-- 부트스트랩5 css/js -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="/team1/css/common.css" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  </head>
  <body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
    <div class="main-wrap">
      <div class="inner-wrap">
        <jsp:include page="/WEB-INF/views/common/aside.jsp" />
        <div class="main-contents">
          <!-- 메인페이지에서만 보이는 것 인클루드 -->
          <table class="table table-hover">
            <thead>
              <tr>
                <th>번호</th>
                <th>게시판</th>
                <th>제목</th>
                <th>작성자</th>
                <th>조회수</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach items="${list}" var="board">
                <tr>
                  <td>${board.bo_num }</td>
                  <td>${board.community.co_name}</td>
                  <td>
                    <a href="">${board.bo_title}</a>
                  </td>
                  <td>
                    <a href="">${board.bo_me_id}</a>
                  </td>
                  <td>${board.bo_view }</td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
      </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
  </body>
</html>
