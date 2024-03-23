<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%> <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>PlayGround - 관리자페이지 - 신고게시판</title>
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
        <jsp:include page="/WEB-INF/views/admin/aside.jsp" />
        <div class="main-contents">
          <!-- 내용채우기 -->
          <div class="h2_title_wrap">
            <!-- 타이틀영역 -->
            <h2>관리자페이지 - 신고게시판</h2>
          </div>
            <c:if test="${post != null }">
              <div>
                <div class="mb-3 mt-3">
                    <label for="community" class="form-label">게시판</label>
                    <input type="text" class="form-control" id="community" name="community" readonly value="${post.board.board_name}">
                </div>	
                 <div class="mb-3 mt-3">
                    <label for="writer" class="form-label">작성자</label>
                    <input type="text" class="form-control" id="writer" name="writer" value = "${post.post_user_id}" readonly>
                    <!-- <div id="writer" name="writer" value = "${post.post_user_id}" readonly>작성자 ${post.post_user_id}</div> -->
                 </div>
                 <div class="mb-3 mt-3">
                    <label for="date" class="form-label">작성일</label>
                    <fmt:formatDate value="${post.post_date}" pattern="yyyy-MM-dd" /> 
                 </div>
                 <div class="mb-3 mt-3">
                    <label for="view" class="form-label">조회수 </label>
                    <input type="text" class="form-control" id="view" name="view" value = "${post.post_view}" readonly>
                    <!--<div type="text" id="view" name="view" value = "${post.post_view}" readonly>조회수 ${post.post_view}</div>-->
                 </div>
                <div class="mb-3 mt-3">
                    <label for="title" class="form-label">제목</label>
                    <input type="text" class="form-control" id="title" name="title" readonly value="${post.post_title}">
                 </div>
                 <div class="mb-3 mt-3">
                    <div>신고 수 ${post.post_reported}</div>
                 </div>
                 <div class="mb-3 mt-3">
                    <div>좋아요 수 ${post.post_upvotes}</div>
                 </div>
                 <div class="mb-3 mt-3">
                    <label for="content" class="form-label">내용</label>
                    <div class="form-control" style="min-height : 300px;">${post.post_content}</div>
                 </div>

                 <c:url value="/admin/boardReport" var="url"></c:url>
                 <a href="${url}" class="btn btn-outline-dark">목록으로</a>

                 <c:url value="/post/delete" var="url2">
                  <c:param name="num" value="${post.post_id}" />
                </c:url>
                <a href="${url2}" class="btn btn-outline-dark">삭제</a>

                 <hr>

              </div>
            </c:if>


            <table class="table">
              <thead class="table-dark">
                <tr>
                  <th>신고자</th>
                  <th>신고종류</th>
                  <th>신고내용</th>
                </tr>
              </thead>
              <tbody>
                <c:if test="${reportedList.size() != 0}">
                  <c:forEach items="${reportedList}" var="report">
                    <tr>
                      <td>${report.report_user_id}</td>
                      <td>${report.report_reason}</td>
                      <td>
                        <button type="button" class="btn btn-outline-dark report-btn" 
                          data-bs-toggle="modal" 
                          data-id="${report.report_user_id}" 
                          data-reason="${report.report_reason}"
                          data-content="${report.report_content}">
                          신고 내용
                        </button>
                      
                      </td>
                    </tr>
                  </c:forEach>
                </c:if>
              </tbody>
            </table>

<!-- 부트스트랩을 이용하여 페이지네이션 링크를 중앙 정렬된 리스트로 만듭니다. -->
            <ul class="pagination justify-content-center">
              <!-- pm.prev의 값이 true일 경우에만 내부 코드를 실행합니다. 이는 "이전" 페이지 그룹으로 이동할 수 있는지 여부를 확인하는 조건입니다. -->
              <c:if test="${pm.prev}">
                <c:url value="/admin/boardReportedList" var="listurl">
                  <c:param name="page" value="${pm.startPage - 1}" />
                  <!-- <c:param name="totalsearch" value="${pm.cri.search}" /> -->
                  <!-- 만약에 검색어가 있으면 여기 추가하기 -->
                </c:url>
                <li class="page-item">
                  <a class="page-link" href="${listurl}">이전</a>
                </li>
              </c:if>

              <c:forEach begin="${pm.startPage }" end="${pm.endPage}" var="i">
                <c:url value="/admin/boardReportedList" var="listurl">
                  <c:param name="page" value="${i}" />
                  <!-- <c:param name="totalsearch" value="${pm.cri.search}" /> -->
                  <!-- 만약에 검색어가 있으면 여기 추가하기 -->
                </c:url>
                <li
                  class="page-item <c:if test='${pm.cri.page == i}'>active</c:if>"
                >
                  <a class="page-link" href="${listurl}">${i}</a>
                </li>
              </c:forEach>

              <c:if test="${pm.next}">
                <c:url value="/admin/boardReport" var="listurl">
                  <c:param name="page" value="${pm.endPage + 1}" />
                  <!-- <c:param name="totalsearch" value="${pm.cri.search}" /> -->
                  <!-- 만약에 검색어가 있으면 여기 추가하기 -->
                </c:url>
                <li class="page-item">
                  <a class="page-link" href="${listurl}">다음</a>
                </li>
              </c:if>
            </ul>


            <div class="modal fade" id="reportModal" tabindex="-1" aria-labelledby="reportModalLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="reportModalLabel">신고 내용</h5>
                    <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body">
                    <!-- 신고 정보가 여기에 들어갑니다. -->
                    <p id="reportId"></p>
                    <p id="reportReason"></p>
                    <p id="reportContent"></p>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                  </div>
                </div>
              </div>
            </div>
      
        </div>
      </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <script>
      $(document).ready(function() {
        $('.report-btn').click(function() {
          let id = $(this).data('id');
          let reason = $(this).data('reason');
          let content = $(this).data('content');

          // Modal 내의 요소에 값을 설정합니다.
          $('#reportId').text('신고자 ID: ' + id);
          $('#reportReason').text('신고 이유: ' + reason);
          $('#reportContent').text('신고 내용: ' + content);

          // Modal을 띄웁니다.
          $('#reportModal').modal('show');
        });
      });

    </script>  
  </body>
</html>


