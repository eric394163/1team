<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>PlayGround - 관리자페이지 - 운영자 관리</title>
    <link rel="shortcut icon" href="/team1/images/favicon.png" type="image/png">
	<!-- 부트스트랩5 css/js -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="/team1/css/common.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  </head>
  <body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="main-wrap">
		<div class="inner-wrap">
			<jsp:include page="/WEB-INF/views/admin/aside.jsp" />
			<div class="main-contents">
				<div class="h2_title_wrap">
	        		<h2>관리자페이지 - 운영자 관리</h2>
	        	</div>
	        	<c:choose>
	        		<c:when test="${user.user_role == '관리자'}">
			        	<!-- <input type='checkbox' name='authory' value='selectall' onclick='selectAll(this)'/> 전체 선택 -->
							<button type="submit" class="btn btn-dark" id="operator-select-box">운영자 선정</button>
							<button type="submit" class="btn btn-dark" id ="operator-release-box">운영자 해제</button>
		
							<table class="table table hover">
								<thead>
									<tr>
										<th><input type="checkbox" id="all-chk" /></th>
										<th>권한</th>
										<th>아이디</th>
										<th>닉네임</th>
										<th>이메일</th>
										<th>생년월일</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list}" var="user">
										<tr>
											<td><input type='checkbox' class="block-chk" data-id='${user.user_id}' data-state="${user.user_role }"></td>
											<td>${user.user_role}</td>
											<td>${user.user_id}</td>
											<td>${user.user_nickname}</td>
											<td>${user.user_email}</td>
											<td><fmt:formatDate value="${user.user_birth}" pattern="yyyy-MM-dd" /></td>
										</tr>
									</c:forEach>
									<c:if test="${list.size() == 0 }">
										<tr>
											<th colspan="5">
												<h4 class="text-center">등록된 사용자가 없습니다.</h4>
											</th>
										</tr>
									</c:if>
								</tbody>
							</table>
						<ul class="pagination justify-content-center">
							<c:if test="${pm.prev}">
								<li class="page-item">
									<c:url var="prevUrl" value="/admin/usermanager">
										<c:param name="type" value="${pm.cri.type}" />
										<c:param name="search" value="${pm.cri.search}" />
										<c:param name="page" value="${pm.startPage-1}" />
									</c:url>
									<a class="page-link" href="${prevUrl}">이전</a>
								</li>
							</c:if>
							<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
								<li class="page-item <c:if test="${pm.cri.page == i}">active</c:if>">
									<c:url var="page" value="/admin/usermanager">
										<c:param name="type" value="${pm.cri.type}" />
										<c:param name="search" value="${pm.cri.search}" />
										<c:param name="page" value="${i}" />
									</c:url>
									<a class="page-link" href="${page }">${i}</a>
								</li>
							</c:forEach>
							<c:if test="${pm.next}">
								<li class="page-item">
									<c:url var="nextUrl" value="/admin/usermanager">
										<c:param name="type" value="${pm.cri.type}" />
										<c:param name="search" value="${pm.cri.search}" />
										<c:param name="page" value="${pm.endPage+1}" />
									</c:url>
									<a class="page-link" href="${nextUrl}">다음</a>
								</li>
							</c:if>
						</ul>
						<form action="<c:url value="/admin/usermanage"/>" class="mb-3 mt-3" id="seachbox">
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
	
	<!-- 운영자 선정 -->
	<script type="text/javascript">
		$("#operator-select-box").click(function() {
			// 체크된 모든 사용자의 id를 저장하는 배열
			var userIds = [];
			
			// 체크된 사용자의 권한을 저장하는 배열
			var userRole = [];
			
			// 체크된 모든 사용자의 ID와 상태 수집
			$(".block-chk:checked").each(function() {
				var userId = $(this).data("id");
				userIds.push(userId);
				
				var userNowRole = $(this).data("state");
				userRole.push(userNowRole);
			});
			
            // 아무것도 선택 안 함
            if (userIds.length === 0) {
              alert("선택된 사용자가 없습니다.");
              return;
            }
            
            var operatorCount = 0;
            var manageCount = 0;
            
            // 체크한 사람중 운영자나 관리자가 있다면
            userRole.forEach(function(userNowRole){
            	if(userNowRole == "운영자") {
            		operatorCount++;
            	}
            	if(userNowRole == "관리자") {
            		manageCount++;
            	}
            });
            
            // 운영자는 다시 운영자로 선정할 수 없음
            if(operatorCount > 0) {
            	alert("이미 운영자입니다.");
            	return;
            }
            
            // 관리자는 운영자로 변경할 수 없음
            if(manageCount > 0) {
            	alert("관리자는 운영자로 변경할 수 없습니다.");
            	return;
            }
            
            // 체크된 모든 사용자 권한을 운영자로 변경
            userIds.forEach(function(userId) {
            	$.ajax({
            		 url: "<c:url value='/admin/changeoperator' />", 
                     type: "POST",
                     data: { changeOperator: userId },
                     success: function (response) {
                   
                     },
                     error: function (xhr, status, error) {
                       
                     },
            	});
            });
            
            alert("선택된 사용자들의 권한을 운영자로 변경합니다.");
            location.reload();
		});
	</script>
	
	<!-- 운영자 해제 -->
	<script type="text/javascript">
	$("#operator-release-box").click(function() {
		// 체크된 모든 사용자의 id를 저장하는 배열
		var userIds = [];
		
		// 체크된 사용자의 권한을 저장하는 배열
		var userRole = [];
		
		// 체크된 모든 사용자의 ID와 상태 수집
		$(".block-chk:checked").each(function() {
			var userId = $(this).data("id");
			userIds.push(userId);
			
			var userNowRole = $(this).data("state");
			userRole.push(userNowRole);
		});

        // 아무것도 선택 안 함
        if (userIds.length === 0) {
          alert("선택된 사용자가 없습니다.");
          return;
        }
        
        var userCount = 0;
        var manageCount = 0;
        
        // 체크한 사람중 사용자나 관리자가 있다면
        userRole.forEach(function(userNowRole){
        	if(userNowRole == "사용자") {
        		userCount++;
        	}
        	if(userNowRole == "관리자") {
        		manageCount++;
        	}
        });
        
        // 사용자는 운영자 해제를 할 수 없음
        if(userCount > 0) {
        	alert("이미 사용자입니다.");
        	return;
        }
        
        // 관리자는 사용자로 변경할 수 없음
        if(manageCount > 0) {
        	alert("관리자는 사용자로 변경할 수 없습니다.");
        	return;
        }
        
        // 체크된 모든 운영자 권한을 사용자로 변경
        userIds.forEach(function(userId) {
        	$.ajax({
        		 url: "<c:url value='/admin/changeuser' />", 
                 type: "POST",
                 data: { changeUser: userId },
                 success: function (response) {
               
                 },
                 error: function (xhr, status, error) {
                   
                 },
        	});
        });
        
        alert("선택된 운영자들의 권한을 사용자로 변경합니다.");
        location.reload();
        
	});
	</script>
  </body>
</html>