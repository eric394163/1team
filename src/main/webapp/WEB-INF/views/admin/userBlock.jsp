<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>PlayGround - 관리자페이지 - 회원 탈퇴</title>
    <link rel="shortcut icon" href="/team1/images/favicon.png" type="image/png">
	<!-- 부트스트랩5 css/js -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="/team1/css/common.css">
	<link rel="stylesheet" href="/team1/css/boardStyle.css" />
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
				<div class="h2_title_wrap"><!-- 타이틀영역 -->
	        		<h2>관리자페이지 - 회원 탈퇴</h2>
	        	</div>
	        	<c:choose>
	        		<c:when test="${user.user_role == '관리자'}">
		        		<div class="all-check-area">
				            <button type="button" class="btn btn-outline-dark" id="pause-btn">이용 정지</button>
				            <button type="button" class="btn btn-outline-dark" id="play-btn">정지 해제</button>
				            <button type="button" class="btn btn-outline-dark" id="user-drop">회원 강퇴</button>
				        </div>
						<table class="table member-table">
							<thead class="table-dark">
								<tr>
									<th><input type="checkbox" id="all-chk" /></th>
									<th>권한</th>
									<th>아이디</th>
									<th>닉네임</th>
									<th>이메일</th>
									<th>생년월일</th>
									<th>상태</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${userList }" var="user">
									<tr>
										<td><input type="checkbox" class="block-chk" data-id="${user.user_id }" data-state="${user.user_state }" /></td>
										<td>${user.user_role }</td>
										<td>${user.user_id }</td>
										<td>${user.user_nickname }</td>
										<td>${user.user_email }</td>
										<td><fmt:formatDate value="${user.user_birth}" pattern="yyyy-MM-dd" /></td>
										<td>${user.user_state }</td>
									</tr>
								</c:forEach>
								<c:if test="${userList.size() == 0 }">
									<tr>
										<th colspan="7">등록된 회원이 없습니다.</th>
									</tr>
								</c:if>
							</tbody>
						</table>
						<ul class="pagination justify-content-center">
							<c:if test="${pm.prev }">
								<li class="page-item">
									<c:url var="prevUrl" value="/admin/userblock">
										<c:param name="type" value="${pm.cri.type}" />
										<c:param name="search" value="${pm.cri.search}" />
										<c:param name="page" value="${pm.startPage-1}" />
									</c:url>
								<a class="page-link" href="${prevUrl}">이전</a>
								</li>
							</c:if>
							<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
								<li class="page-item <c:if test="${pm.cri.page == i}">active</c:if>">
									<c:url var="page" value="/admin/userblock">
										<c:param name="type" value="${pm.cri.type}" />
										<c:param name="search" value="${pm.cri.search}" />
										<c:param name="page" value="${i}" />
									</c:url>
									<a class="page-link" href="${page }">${i}</a>
								</li>
							</c:forEach>
							<c:if test="${pm.next }">
								<li class="page-item">
									<c:url var="nextUrl" value="/admin/userblock">
										<c:param name="type" value="${pm.cri.type}" />
										<c:param name="search" value="${pm.cri.search}" />
										<c:param name="page" value="${pm.endPage+1}" />
									</c:url>
									<a class="page-link" href="${nextUrl}">다음</a>
								</li>
							</c:if>
						</ul>
						<form action="<c:url value="/admin/userblock"/>" class="mb-3 mt-3" id="seachbox">
							<div class="input-group">
								<input type="hidden" name="page" value="1">
								<select name="type" class="form-control" id="search-select">
									<option value="nickname" <c:if test='${pm.cri.type == "nickname" }'>selected</c:if>>닉네임</option>
									<option value="id" <c:if test='${pm.cri.type == "id" }'>selected</c:if>>아이디</option>
								</select>
								<input type="text" class="form-control" id="search-input" placeholder="검색어" name="search" value="${pm.cri.search}">
								<button class="btn btn-dark col-2" id="search-btn">검색</button>
							</div>
						</form>
					</c:when>
					<c:otherwise>
						<p>관리자만 볼 수 있는 페이지입니다. 관리자에게 문의하세요.</p>
					</c:otherwise>
	        	</c:choose>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<!-- 체크처리 -->
	<script type="text/javascript">
      //모두체크를 체크하면, 클래스가 block-chk가 모두 체크, 그렇지 않으면 미체크
      $("#all-chk").change(function () {
        //prop() : 태그의 속성을 컨트롤하는 메서드
        //게터 - prop('checked') : true/false로 얻어오는 게터
        let allChk = $(this).prop("checked");

        if (allChk) {
          //모두체크
          //세터 - prop('checked', true/false) : true/false로 변경하는 세터
          $(".block-chk").prop("checked", true);
        } else {
          //모두미체크
          $(".block-chk").prop("checked", false);
        }
      });

      //일반체크가 하나라도 체크가 안되어 있다면 모두체크도 해제, 다체크되었다면 체크
      $(".block-chk").change(function () {
        //일반체크 체크안된 숫자 담는 변수
        let noneChkCount = 0;

        //전부 확인
        $(".block-chk").each(function (index) {
          //각각 확인
          let chk = $(this).prop("checked");

          if (!chk) {
            //체크되었지 않다면?
            noneChkCount++; //숫자 1증가
          }
        });

        //하나라도 체크가 안되어 있다면
        if (noneChkCount > 0) {
          //모두체크 미체크
          $("#all-chk").prop("checked", false);
        } else {
          //다 체크되어 있다면
          //모두체크 체크
          $("#all-chk").prop("checked", true);
        }
      });
    </script>
    
    <!-- 이용 정지 -->
    <script type="text/javascript">
    	$('#pause-btn').click(function(){
    		// 체크된 모든 사용자의 ID를 저장할 배열
            var userIds = [];
    		
    		//체크된 사용자의 상태를 저장할 배열
            var userStates = [];

            // 체크된 모든 사용자의 ID 수집 & 상태도 수집
            $(".block-chk:checked").each(function () {
              var userId = $(this).data("id");
              userIds.push(userId);
              
              var userState = $(this).data("state");
              userStates.push(userState);
            });

            // 아무것도 선택 안 함
            if (userIds.length === 0) {
              alert("선택된 사용자가 없습니다.");
              return;
            }
            
            var dropCount = 0;
            var pauseCount = 0;
            
            //만약 체크한 사람 중 탈퇴중/정지중이 있다면
            userStates.forEach(function(userState){
            	if(userState == "탈퇴중"){
            		dropCount++;
                }
            	if(userState == "정지중"){
            		pauseCount++;
                }
            });
            
         	// 탈퇴중 / 정지중은 정지 못함
            if (dropCount > 0 || pauseCount > 0) {
              alert("탈퇴/정지 중인 회원은 이용정지 시킬 수 없습니다.");
              return;
            }

            // 체크된 모든 사용자 상태를 정지중으로 변경
            userIds.forEach(function (userId) {
              $.ajax({
                url: "<c:url value='/admin/userpause' />", 
                type: "POST",
                data: { pausedUserId: userId },
                success: function (response) {
              
                },
                error: function (xhr, status, error) {
                  
                },
              });
            });

            alert("선택된 사용자들의 사이트 이용을 정지합니다.");
            location.reload();
    	});
    </script>
    
    <!-- 정지 해제 -->
    <script type="text/javascript">
    	$('#play-btn').click(function(){
    		// 체크된 모든 사용자의 ID를 저장할 배열
            var userIds = [];
    		
    		//체크된 사용자의 상태를 저장할 배열
            var userStates = [];

            // 체크된 모든 사용자의 ID 수집 & 상태도 수집
            $(".block-chk:checked").each(function () {
              var userId = $(this).data("id");
              userIds.push(userId);
              
              var userState = $(this).data("state");
              userStates.push(userState);
            });

            // 아무것도 선택 안 함
            if (userIds.length === 0) {
              alert("선택된 사용자가 없습니다.");
              return;
            }
            
            var dropCount = 0;
            var useCount = 0;
            
            //만약 체크한 사람 중 탈퇴중/이용중이 있다면
            userStates.forEach(function(userState){
            	if(userState == "탈퇴중"){
            		dropCount++;
                }
            	if(userState == "이용중"){
            		useCount++;
                }
            });
            
         	// 탈퇴중 / 정지중은 정지 못함
            if (dropCount > 0 || useCount > 0) {
              alert("탈퇴/이용 중인 회원은 정지해제 시킬 수 없습니다.");
              return;
            }

            // 체크된 모든 사용자 상태를 사용중으로 변경
            userIds.forEach(function (userId) {
              $.ajax({
                url: "<c:url value='/admin/userplay' />", 
                type: "POST",
                data: { playdUserId: userId },
                success: function (response) {
              
                },
                error: function (xhr, status, error) {
                  
                },
              });
            });

            alert("선택된 사용자들의 사이트 이용정지를 해제합니다.");
            location.reload();
    	});
    </script>
    
    <!-- 회원 강퇴 -->
    <script type="text/javascript">
    	$('#user-drop').click(function(){
    		// 체크된 모든 사용자의 ID를 저장할 배열
            var userIds = [];
    		
    		//체크된 사용자의 상태를 저장할 배열
            var userStates = [];

            // 체크된 모든 사용자의 ID 수집 & 상태도 수집
            $(".block-chk:checked").each(function () {
              var userId = $(this).data("id");
              userIds.push(userId);
              
              var userState = $(this).data("state");
              userStates.push(userState);
            });

            // 아무것도 선택 안 함
            if (userIds.length === 0) {
              alert("선택된 사용자가 없습니다.");
              return;
            }
            
            var dropCount = 0;
            
            //만약 체크한 사람 중 탈퇴중/이용중이 있다면
            userStates.forEach(function(userState){
            	if(userState == "탈퇴중"){
            		dropCount++;
                }
            });
            
         	// 탈퇴중 / 정지중은 정지 못함
            if (dropCount > 0) {
              alert("탈퇴 중인 회원은 탈퇴 시킬 수 없습니다.");
              return;
            }

            // 체크된 모든 사용자 상태를 사용중으로 변경
            userIds.forEach(function (userId) {
              $.ajax({
                url: "<c:url value='/admin/userdrop' />", 
                type: "POST",
                data: { userDropId: userId },
                success: function (response) {
              
                },
                error: function (xhr, status, error) {
                  
                },
              });
            });

            alert("선택된 사용자들은 사이트에서 강퇴시킵니다.");
            location.reload();
    	});
    </script>
  </body>
</html>