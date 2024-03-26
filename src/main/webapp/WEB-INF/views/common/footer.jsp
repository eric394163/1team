<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
   footer p {
      font-size : 12px;
      color : #999;
   }
   footer .boss {
      color: #fff;
      font-weight : bold;
      font-size : 30px;
   }
</style>
</head>
<body>
   <footer>
      <div class="p-4 bg-dark text-white text-center">
          <div class="p-4 bg-dark text-white text-center">
			<h1>
				<a class="navbar-brand" href="<c:url value="/"/>"> <img
					alt="LOGO"
					src="/team1/images/logo_blackversion.svg">
				</a>
			</h1>
			<p>
				대표이사/사장 유OO | 사업자등록번호 104-81-000000 | 판매허가번호 중구 00000호 <br>
				서울특별시 중구 을지로 00 Copyright PLAYGROUND Corp. All rights reserved
			</p>
		</div>
      </div>
   </footer>
</body>
</html>