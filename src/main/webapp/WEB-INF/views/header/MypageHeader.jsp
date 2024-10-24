<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Shopang</title>
    <style>
        header {
            background-color: #333 !important; /* 배경색 */
            color: white !important; /* 글씨 색 */
            display: flex !important;
            justify-content: center !important; /* 헤더 중앙 정렬 */
            align-items: center !important; /* 세로 가운데 정렬 */
            height: 130px !important; /* 높이 설정 */
            width: 100% !important;
            position: relative; /* state 위치 조정을 위해 relative로 설정 */
        }

        header a {
            color: white !important;
            text-decoration: none !important; /* 밑줄 제거 */
        }

        .state {
            position: absolute;
            bottom: 0px; /* 하단에서 10px 위 */
            right: 100px; /* 오른쪽에서 20px 왼쪽으로 */
            color: white !important;
        }

        .state a {
            margin-left: 20px; /* 버튼 사이 간격 */
            font-weight:700;
            font-size: 20px;
        }
        
     
	
	.menu_navi {
 	   	margin-top:0px; /* header의 height만큼 여백 추가 */
 	   	height: 80px;
 	   	width: 100%;
    	display: flex;
    	align-items: center; /* 수직으로 중앙 정렬 */
    	justify-content: center; /* 수평 중앙 정렬 */
    	background-color: #fefefe; /* 거의 흰색에 가까운 매우 연한 회색 */ 
    	border-bottom: 1px solid #d0d0d0; /* 연한 회색 밑에 선 추가 */
	}
	.menu_navi ul {
    	display: flex; /* 수평 정렬을 위해 flex 사용 */
    	list-style-type: none; /* 점 제거 */
    	
	}

	.menu_navi li {
    	margin: 0 20px; /* 각 항목 사이의 간격 */
	}

	.menu_navi a {
    	text-decoration: none; /* 링크의 기본 밑줄 제거 */
    	color: #000; /* 기본 링크 색상 설정 */
    	font-weight: normal; /* 기본 글자 굵기 설정 (기본값) */
	}

	.menu_navi a:hover {
    	color: #333; /* 마우스를 올렸을 때 링크 색상 변경 */
    	font-weight: bold; /* 마우스를 올렸을 때 글자 굵기 변경 */
	}
        
    </style>
</head>
<body>
    
    <header>
        <h1><a href="/ex/">Shopang</a></h1>
        <div class="state">
            <c:choose>
                <c:when test="${empty dto}">
                    <!-- <a href="/ex/user/menu">로그인</a> -->
                </c:when>
                <c:otherwise>
                    <p>
                        <a href="/ex/user/myPage"><c:out value="${dto.u_nickname }" />님</a>
                    </p>
                </c:otherwise>
            </c:choose>
        </div>
    </header>
    <div class="menu_navi">
		<ul>
			<li><a href="#" onclick="reg_type_select('1'); return false;" id="myInfo">내 정보</a></li>
			<li><a href="#" onclick="reg_type_select('2'); return false;" id="changePass">정보수정</a></li>
			<li><a href="#" onclick="reg_type_select('3'); return false;" id="profile-link">회원탈퇴</a></li>
			<li><a href="#" onclick="reg_type_select('4'); return false;" id="profile-link">정보찾기</a></li>
		</ul>
	</div>
    <div class="my_info type_1" style="display: none;">
					<h2 class="profile-title">내 프로필</h2>
					<p><img src="${pageContext.request.contextPath}/resources/img/user.png">${dto.u_name}</p>
					<p><img src="${pageContext.request.contextPath}/resources/img/free-icon-phone.png">${dto.u_phoneNumber}</p>
					<p><img src="${pageContext.request.contextPath}/resources/img/free-icon-email.png">${dto.u_email}</p>
					<p><img src="${pageContext.request.contextPath}/resources/img/cake.png">${dto.u_birthday}</p>
				</div>
</body>
</html>
