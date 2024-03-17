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
          <h1>"${pm.cri.search}" 의 검색 결과</h1>
          <c:if test="${empty list}">
            <p>검색 결과가 없습니다.</p>
          </c:if>

          <c:if test="${not empty list}">
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
                <c:forEach items="${list}" var="post">
                  <tr>
                    <td>${post.post_id }</td>
                    <td>${post.post_board_name}</td>
                    <td>
                      <c:url var="url" value="/post/detail">
                        <c:param name="num" value="${post.post_id}" />
                      </c:url>
                      <a href="${url}">${post.post_title}</a>
                    </td>
                    <td>
                      <a href="">${post.post_user_id}</a>
                    </td>
                    <td>${post.post_view }</td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>

            <!-- 부트스트랩을 이용하여 페이지네이션 링크를 중앙 정렬된 리스트로 만듭니다. -->
            <ul class="pagination justify-content-center">
              <!-- pm.prev의 값이 true일 경우에만 내부 코드를 실행합니다. 이는 "이전" 페이지 그룹으로 이동할 수 있는지 여부를 확인하는 조건입니다. -->
              <c:if test="${pm.prev}">
                <c:url value="/totalSearchList" var="searchListurl">
                  <c:param name="page" value="${pm.startPage - 1}" />
                  <c:param name="totalsearch" value="${pm.cri.search}" />
                </c:url>
                <li class="page-item">
                  <a class="page-link" href="${searchListurl}">이전</a>
                </li>
              </c:if>

              <c:forEach begin="${pm.startPage }" end="${pm.endPage}" var="i">
                <c:url value="/totalSearchList" var="searchListurl">
                  <c:param name="page" value="${i}" />
                  <c:param name="totalsearch" value="${pm.cri.search}" />
                </c:url>
                <li
                  class="page-item <c:if test='${pm.cri.page == i}'>active</c:if>"
                >
                  <a class="page-link" href="${searchListurl}">${i}</a>
                </li>
              </c:forEach>

              <c:if test="${pm.next}">
                <c:url value="/totalSearchList" var="searchListurl">
                  <c:param name="page" value="${pm.endPage + 1}" />
                  <c:param name="totalsearch" value="${pm.cri.search}" />
                </c:url>
                <li class="page-item">
                  <a class="page-link" href="${searchListurl}">다음</a>
                </li>
              </c:if>
            </ul>
          </c:if>
        </div>
      </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
  </body>
</html>
