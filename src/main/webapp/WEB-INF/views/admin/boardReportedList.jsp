<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%> <%@ page isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<meta charset="UTF-8">
	<title>PlayGround - 상세게시글보기</title>
	<link rel="shortcut icon" href="/team1/images/favicon.png" type="image/png">
	<!-- 부트스트랩5 css/js -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.css" rel="stylesheet">
	<link rel="stylesheet" href="/team1/css/common.css">
	<link rel="stylesheet" href="/team1/css/boardStyle.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.js"></script>
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
								<div class="detail-box">
									<div class="form-row">
										<p class="board-name">${post.board.board_name}</p>
									</div>
									<div class="form-row  first-line">
										<div class="left-box">
											<c:if test="${writer != null && writer.user_role == '사용자'}">
									    		<img src="<c:url value="/images/face_login.svg" />" alt="얼굴아이콘" width="30" class="face-icon">
									    	</c:if>
									    	<c:if test="${writer != null && (writer.user_role == '관리자' || writer.user_role == '운영자')}">
									    		<img src="<c:url value="/images/face_login_admin.svg" />" alt="얼굴아이콘" width="30" class="face-icon">
									    	</c:if>
									    	<p>${writer.user_nickname}</p>
										</div>
										<div class="right-box">
											<img src="<c:url value="/images/calender_icon.svg" />" alt="달력아이콘" width="24" class="calender-icon">
									 		<fmt:formatDate value="${post.post_date}" pattern="yyyy-MM-dd" /> 
									 		<img src="<c:url value="/images/eye_icon.svg" />" alt="눈아이콘" width="24" class="eye-icon">
									 		<span>${post.post_view}</span>
										</div>
									</div>	
									<div class="form-row second-line">
										<div class="left-box">
									 		<span class="board-title">${post.post_title}</span>
									 	</div>
									    <div class="right-box">
									 		<img src="<c:url value="/images/siren_icon.svg" />" alt="사이렌아이콘" width="24" class="siren-icon">
									 		<span>${post.post_reported}</span> 
									 		<img src="<c:url value="/images/like_icon.svg" />" alt="라이크아이콘" width="24" class="like-icon">
									 		<span>${post.post_upvotes}</span>
									 	</div>
									</div>
									<c:if test="${link != null && link != ''}">
									 	<c:if test="${link.attach_link_check == 1}">
											 <div class="form-row link-box">
											    <label for="link">첨부링크 : </label>
								    			<a href="<c:url value="${link.attach_path}" />" target="_blank">${link.attach_path}</a>
											 </div>
										 </c:if>
									 </c:if>
									 <c:if test="${fileList != null && fileList.size() != 0}">
									 	 <div class="form-row file-box-wrap">
									 		 <label for="file"><img src="<c:url value="/images/save_icon.svg" />" alt="파일아이콘" width="24" class="save-icon">첨부파일 : </label>
									 		 <div class="file-box">
									 			 <c:forEach items="${fileList}" var="file" begin="0" varStatus="status">
											 		 <c:if test="${file.attach_link_check == 0}">
									 					 <a href="<c:url value="/download?filename=${file.attach_path}" />" title="${file.attach_path}" download="${file.attach_path}">첨부파일${status.index + 1}</a>
											 		 </c:if>
									 			 </c:forEach>
								 			 </div>
									 	 </div>
									 </c:if>
									 <div class="form-row content">
									    <div class="form-control second-box">${post.post_content}</div>
									 </div>
	                				 <div class="form-row btn-last-box">
										<a href="<c:url value="/post/delete?num=${post.post_id}"/>" class="btn btn-outline-danger">삭제</a>
										<a href="<c:url value="/admin/boardReport" />" class="btn btn-outline-dark">목록으로</a>
								  	 </div>
	                 			</div>
	                 		</c:if>


				            <table class="table repoart-list-table">
				              <thead class="table-dark">
				                <tr>
				                  <th>번호</th>
				                  <th>신고자</th>
				                  <th>신고종류</th>
				                  <th>신고내용</th>
				                </tr>
				              </thead>
				              <tbody>
				                <c:if test="${reportedList.size() != 0}">
				                  <c:forEach items="${reportedList}" var="report">
				                    <tr>
				                      <td>${report.report_id}</td>
				                      <td>${report.report_user_id}</td>
				                      <td>${report.report_reason}</td>
				                      <td>
				                        <button type="button" class="btn btn-outline-dark report-btn" 
				                          data-bs-toggle="modal" 
				                          data-id="${report.report_user_id}" 
				                          data-reason="${report.report_reason}"
				                          data-content="${report.report_content}">
				                          신고내용 자세히보기
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

        </div>
      </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    
    <div class="report-list-box">
  		<div class="report-list">
  			<h2>신고 내용</h2>
  			<p id="reportId"></p>
            <p id="reportReason"></p>
            <p id="reportContent"></p>
  			<a href="#close" class="close_btn"><img src="<c:url value="/images/close_icon.svg" />" alt="닫기아이콘" width="30"></a>
  			<button class="btn btn-dark">확인</button>
  		</div>
  	</div>

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
          $('.report-list-box').show();
        });
        
     	//닫기 아이콘 클릭
		$('.close_btn, .report-list-box button').click(function(){
			// Modal 닫기
            $('.report-list-box').hide();
		});
      });

    </script>  
  </body>
</html>


