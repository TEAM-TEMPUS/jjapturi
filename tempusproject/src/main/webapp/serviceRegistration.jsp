<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>상품 등록 페이지</title>
<!--1번 cdn방법 slick에서 css링크가져옴-->
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />

<!--8번 xeicon을 가져온다 방법: xeicon사이트-> 메뉴바 get started -> 사이트 <head> 태그 안에 아래의 코드를 붙입니다 밑 코드 복사
       그다음 라이브러리를 들어가 원하는 아이콘을 가져온다-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">

<!--5번 제이쿼리 가져오기-->
<!--제이쿼리 다운방법: 제이쿼리 홈페이지->다운로드->맨아래 cdn링크클릭-> 맨위 minified클릭->코드 복사-->
<!--제이쿼리 스크립트 삽입 방법은 라이브러리 제일 맨위에 와야한다-->
<!--src남겨놓고 다 삭제-->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!--2번 cdn방법 slick에서 js링크가져옴-->
<!--1번 2번 실행 안될시 //cdn 앞에 http://넣어줘야 한다.-->
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

<link rel="stylesheet" type="text/css" href="css/styles.css" />
<link rel="stylesheet" type="text/css"
	href="css/screens/serviceRegistration.css" />
</head>

<body>
	<div id="wrap">
		<header></header>
		<!-- container -->
		<div id="container">
			<main class="container__inner">
				<article class="service-registration">
					<form action="crud/service/registration.jsp" method="post" enctype="multipart/form-data">
						<!--BEM중 block해당 헤더블럭-->
						<h2 class="service-registration__bigtitle">서비스 등록</h2>
						<h2 class="service-registration-info__imgetitle">이미지 등록(필수)</h2>
	
						<!--이미지 업로드를 위한 div부분-->
						<div class="service-registration__imagspace">
							<img alt="" src="img/gibon.png" class="service-registration__imge"
								id="service-registration__imge" />
						</div>
	
						<!-- 사진업로드 -->
						<p class="service-registration__imgselect">
							<!--이미지 다중 업로드를 위해 multiple작성 기본이미지에서 등록 이미지 변환하기 위해 onchange작성 -->
							<input type="file" id="uploadFileNames" name="uploadFileNames" multiple="multiple"
								accept="imge/*" style="display: none"
								onchange="setDetailImage(event);" /> <label
								for="uploadFileNames"> <i
								class="fa-solid fa-rectangle-history-circle-plus"></i> 사진선택
							</label>
						</p>
						<hr class="service-registration__line" />
	
						<!--상품정보입력-->
						<div class="service-registration-info">
							<!--작성부분 블럭줌-->
							<!--목록-->
							<ul class="service-registration-info__list">
								<!--나는 누구인가요? 개미/배짱이 라디오 버튼-->
								<li id="types" class="service-registration-who">
									<h2 class="service-registration-info__smalltitle">나는 누구인가요?</h2>
									<input type="radio" class="radio-select-ant" id="types" name="types"
									value="ant"> <span class="radio-select-antname">개미</span>
	
									<input type="radio" class="radio-select-grasshopper "
									id="types"
									name="types" value="grasshopper"> <span
									class="radio-select-grasshoppername">베짱이</span>
								</li>
	
								<li class="service-registration-title">
									<!--작성부분 블럭줌-->
									<h2 class="service-registration-info__smalltitle">제목</h2> <input
									type="text" id="title" name="title" class="service-registration-title__info"
									placeholder="제목" />
								</li>
	
								<li class="service-registration-category">
									<h2 class="service-registration-info__smalltitle">카테고리</h2> <select id="category"
									name="category"
									class="service-registration-category__info">
										<option>카테고리를 선택해주세요.</option>
										<option value="errand">심부름</option>
										<option value="walk">산책</option>
										<option value="install">설치</option>
										<option value="study">과외</option>
										<option value="clean">청소</option>
								</select>
								</li>
	
								<li class="service-registration-addr">
									<h2 class="service-registration-info__smalltitle">거래지역</h2> <input
									type="text" id="place" name="place" class="service-registration-addr_info"
									placeholder="주소" />
								</li>
	
								<li class="service-registration-item">
									<h2 class="service-registration-info__smalltitle">날짜</h2> <input
									type="date" id="startDate" name="startDate" class="service-registration-item__info1" /> <span
									class="service-registration-item__flow">~</span> <input
									type="date" id="endDate" name="endDate" class="service-registration-item__info2" />
								</li>
	
								<li class="service-registration-price">
									<h2 class="service-registration-info__smalltitle">가격</h2> <input
									type="text" id="price" name="price" class="service-registration-price__info"
									placeholder="가격" /> <span>원</span>
								</li>
							</ul>
						</div>
	
						<hr class="service-registration__line" />
	
						<div class="service-registration-explanation">
							<!--설명 부분 블럭줌-->
							<h2 class="service-registration-explanation__smalltitle">설명</h2>
							<textarea id="description" name="description" class="service-registration-explanation__explain"
								placeholder="설명을 입력해 주세요."></textarea>
						</div>
	
						<div class="service-registration-button">
							<!--버튼 부분 블럭줌-->
							<button type="submit" id="registration" class="service-registration-button__button">등록하기</button>
						</div>
					</form>
				</article>
			</main>
		</div>
		<!-- //container -->
		<!-- footer -->
		<footer></footer>
		<!-- //footer -->
	</div>
	<script src="js/serviceRegistration.js"></script>
	<script src="js/serviceRegistrationslick.js"></script>
</body>
</html>
