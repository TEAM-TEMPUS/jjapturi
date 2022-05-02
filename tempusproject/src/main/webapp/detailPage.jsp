<%@page import="data.dto.member.TradingInfoDto"%>
<%@page import="data.dao.member.TradingInfoDao"%>
<%@page import="data.dto.member.MemberProfileDto"%>
<%@page import="data.dto.service.ServiceDto"%>
<%@page import="data.dto.service.ServiceImageDto"%>
<%@page import="data.dao.service.ServiceImageDao"%>
<%@page import="data.dto.comment.CommentInqueryDto"%>
<%@page import="data.dto.service.ServiceInqueryDto"%>
<%@page import="java.util.HashMap"%>
<%@page import="data.dao.service.ServiceDao"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.member.MemberDao"%>
<%@page import="data.dto.member.MemberDto"%>
<%@page import="data.dto.comment.CommentDto"%>
<%@page import="data.dao.comment.CommentDao"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>서비스 상세 페이지</title>
     <!--1번 cdn방법 slick에서 css링크가져옴--> 
   <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
     
   <!--8번 xeicon을 가져온다 방법: xeicon사이트-> 메뉴바 get started -> 사이트 <head> 태그 안에 아래의 코드를 붙입니다 밑 코드 복사
       그다음 라이브러리를 들어가 원하는 아이콘을 가져온다-->
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">

   <!--5번 제이쿼리 가져오기-->
   <!--제이쿼리 다운방법: 제이쿼리 홈페이지->다운로드->맨아래 cdn링크클릭-> 맨위 minified클릭->코드 복사-->
   <!--제이쿼리 스크립트 삽입 방법은 라이브러리 제일 맨위에 와야한다-->
   <!--src남겨놓고 다 삭제-->
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

   <!--2번 cdn방법 slick에서 js링크가져옴-->
   <!--1번 2번 실행 안될시 //cdn 앞에 http://넣어줘야 한다.-->
   <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    
    <link rel="stylesheet" type="text/css" href="css/styles.css" />
    <link rel="stylesheet" type="text/css" href="css/screens/detailPage.css" />
<!-- jsp작성 -->    
<%
// Service를 조회
// Service에 딸린 여러 Comment 조회
Long serviceId = Long.parseLong(request.getParameter("serviceId"));
Long memberId = Long.parseLong(request.getParameter("memberId"));

MemberDao memberDao = new MemberDao();
ServiceDao serviceDao = new ServiceDao();
CommentDao commentDao = new CommentDao();
ServiceImageDao serviceImageDao = new ServiceImageDao();
TradingInfoDao tradingInfoDao =new TradingInfoDao();

HashMap<String, String> categoryMap = new HashMap<>();
categoryMap.put("errand", "심부름");
categoryMap.put("walk", "산책");
categoryMap.put("install", "설치");
categoryMap.put("study", "과외");
categoryMap.put("clean", "청소");
//댓글조회
//5.dao list선언 
ServiceInqueryDto service = serviceDao.findByServiceId(serviceId);
List<CommentInqueryDto> comments = commentDao.findAllByServiceId(serviceId);
//이미지 조회 //타입은 dto에있는거다
List<ServiceImageDto> images = serviceImageDao.findAllByServiceId(serviceId);
//등록자 프로필과 닉네임
MemberProfileDto memberprofiledto = memberDao.findMemberProfileByMemberId(memberId);
//프로필 등급
List<TradingInfoDto> tradingInfos = tradingInfoDao.findCompleteTradingInfosByMemberId(memberId);
  
  int completeTradingCount = tradingInfos.size();
  
  double totalGrade = 0;
  int gradeSum = 0;
  int grantedGradeCount = 0;
  for (TradingInfoDto tradingInfo : tradingInfos) {
	  int grade = tradingInfo.getGrade();
	  if (grade > 0) {
		  gradeSum += grade;
		  grantedGradeCount++;
	  }
  }
  totalGrade = (double) gradeSum / grantedGradeCount;
  
  String rank;
  if (completeTradingCount >= 100 && totalGrade >= 3.5) {
	  rank = "rank_platinum.png";
  } else if (completeTradingCount >= 50 && totalGrade >= 3.0) {
	  rank = "rank_gold.png";
  } else if (completeTradingCount >= 10 && totalGrade >= 2.5) {
	  rank = "rank_silver.png";
  } else {
	  rank = "rank_bronze.png";
  }
  
%>   
  </head>
  <body>
    <div id="wrap">
      <header></header>
      <!-- container -->
      <div id="container">
        <main class="container__inner">
          <article class="detailpage-info">
            <!--제목-->
            <h2 class="detailpage-info__categorytitle"><%= categoryMap.get(service.getCategory()) %></h2>
            <!--등록이미지-->
            <div class="detailpage-info__serviceimgespace">
            <%for(ServiceImageDto image : images) {%>
            <img
              alt=""
              src="img/<%=image.getStoreImageName() %>"
              class="detailpage-info__serviceimge"
            />
            <%} %>
          </div>
            <div>
              <ul class="detailpage-info__list">
                <!--등록자 정보-->
                <li class="detailpage-info__item detailpage-publisher-info">
                  <img
                    alt=""
                    src="img/<%=memberprofiledto.getMemberImage() %>"
                    class="detailpage-info__registrantimge"
                  />
                  <span class="detailpage-info__mynickname"

                    ><%=memberprofiledto.getNickname() %></span
                  >
                  <span class="detailpage-info__rank"
                    ><img
                      alt=""
                      src="img/<%=rank%>"
                      class="detailpage-info__rankinfo"
                  /></span>
                </li>

                <!--등록제목-->
                <li class="detailpage-info__item">
                  <h2 class="detailpage-info__title">
                    <%=service.getTitle() %>
                  </h2>
                </li>

                <!--거래지역-->
                <li class="detailpage-info__item">
                  <h2 class="detailpage-info__addr">
                    <%=service.getPlace() %>
                  </h2>
                </li>

                <!--날짜-->
                <li class="detailpage-info__item">
                  <img
                    alt=""
                    src="img/icon_calendar.png"
                    class="detailpage-info__dateimge"
                  />
                  <span class="detailpage-info_dateinfo"
                    ><%=service.getStartDate() %>~ <%=service.getEndDate() %></span
                  >
                </li>

                <!--예약중과 가격-->
                <li class="detailpage-info__item">
                  
                 <%if(service.getStatus().equals("reservation")){%>        		
                  
                  <img
                    alt=""
                    src="img/status_reserved.png"
                    class="detailpage-info__reservationimge"
                  />
                  <%}%> 
                  <!--예약중 옆에 가격 정보-->
                  <span class="detailpage-info__priceinfo"><%=service.getPrice() %></span>
                </li>
              </ul>
            </div>

            <!-- 설명정보 등록 -->
            <div class="detailpage-info_service">
              <h5 class="detailpage-info__servicename">서비스 정보</h5>

              <!-- 선긋기 -->
              <hr class="detailpage-info__line" />

              <p class="detailpage-info__contents">
                <%=service.getDescription() %>
              </p>
            </div>

            <!-- 예약버튼 -->
            <div class="detailpage-info__reservation">
              
              <%if(service.getStatus().equals("reservation")){%>
                <button type="button" class="detailpage-info__reservationbtn">
               예약중
               </button>
               <%}else{%> 
               <button type="button" class="detailpage-info__basicbtn">
               예약하기
               </button>
               <%}%> 
              
            </div>
			<form action="crud/comments/registration.jsp" method="post">
            <!-- 상품문의 내용적기 -->
            <input type="hidden" name="memberId" value="<%=memberId%>">
            <input type="hidden" name="serviceId" value="<%=serviceId%>">
            <div class="detailpage-info__inquiry">
              <h5 class="detailpage-info__inquirys">서비스 문의</h5>
              <textarea name="text" class="detailpage-info__comment"></textarea>
            </div>

            <!-- 상품문의 등록 버튼 -->
            <div class="detailpage-info__inquirybtn">
              <button type="submit" class="detailpage-info__inquirybtns">등록</button>
            </div>
          
</form>
            <hr class="detailpage-info__line" />


             <!-- 댓글 작성 정보1 -->
           <%for(CommentInqueryDto comment: comments){%>
          
            <div class="detailpage-info__comments">
              <ul class="detailpage-info__user">
                <li class="detailpage-info__useritem">
                  <img
                    alt=""
                    src="img/<%=comment.getStoreImgName() %>"
                    class="detailpage-info__userimg"
                  />
                  <p class="detailpage-info__usernickname"><%=comment.getNickname()%></p>
                  <p class="detailpage-info__usercomment">
                    <%=comment.getText()%>
                  </p>
                  <br>
                  <hr class="detailpage-info__commentline" />
                </li>
              </ul>
            </div>
      	<%}%>
          </article>
        </main>

        <section class="modals">
          <article class="modal modal--profile">
            <div class="modal__body">
              <div class="profile-wrap">
                <div class="profile-cancel">
                  <i class="fas fa-times"></i>
                </div>

                <div class="profile">
                  
                  <img
                    src="img/basic-profile-image.png"
                    alt="프로필 사진"
                    class="profile__image"
                  />

                  <img
                    src="img/bronze-badge.png"
                    alt="회원 등급"
                    class="profile__badge"
                  />

                  <span class="profile__nickname">차를너무사랑해</span>

                  <div class="profile__phone-number-wrap">
                    <i class="fas fa-phone-alt profile__phone-icon"></i>
                    <span class="profile__phone-number">010-1234-1234</span>
                  </div>
                </div>

                <div class="transaction-info">
                  <ul class="transaction-info__list">
                    <li class="transaction-info__item">
                      <span class="transaction-info__title">거래건수</span
                      ><br />
                      <span class="transaction-info__content">4</span>
                    </li>

                    <li class="transaction-info__item">
                      <span class="transaction-info__title">회원등급</span
                      ><br />
                      <span class="transaction-info__content">브론즈</span>
                    </li>

                    <li class="transaction-info__item">
                      <span class="transaction-info__title">평점</span><br />
                      <span class="transaction-info__content">5.0</span>
                    </li>
                  </ul>
                </div>

                <div class="profile__introduction">
                  <h1 class="profile__introduction__title">자기 소개</h1>

                  <p class="profile__introduction__content">
                    안녕하세요~ 개인 출장 세차를 하고 있습니다. 믿고 맡겨주시면
                    감사하겠습니다 :) 안녕하세요~ 개인 출장 세차를 하고
                    있습니다. 믿고 맡겨주시면 감사하겠습니다 :)안녕하세요~ 개인
                    출장 세차를 하고 있습니다. 믿고 맡겨주시면 감사하겠습니다
                    :)안녕하세요~ 개인 출장 세차를 하고 있습니다. 믿고
                    맡겨주시면 감사하겠습니다 :)안녕하세요~ 개인 출장 세차를
                    하고 있습니다. 믿고 맡겨주시면 감사하겠습니다 :)안녕하세요~
                    개인 출장 세차를 하고 있습니다. 믿고 맡겨주시면
                    감사하겠습니다 :)안녕하세요~ 개인 출장 세차를 하고 있습니다.
                    믿고 맡겨주시면 감사하겠습니다 :)안녕하세요~ 개인 출장
                    세차를 하고 있습니다. 믿고 맡겨주시면 감사하겠습니다
                    :)안녕하세요~ 개인 출장 세차를 하고 있습니다. 믿고
                    맡겨주시면 감사하겠습니다 :)안녕하세요~ 개인 출장 세차를
                    하고 있습니다. 믿고 맡겨주시면 감사하겠습니다 :)
                  </p>
                </div>
              </div>
            </div>
          </article>

          <article class="modal modal--reservation-confirm">
            <div class="modal__body modal__body--reservation-confirm">
              <div class="reservation-confirm">
                <div class="reservation-confirm__description">
                  <h1 class="reservation-confirm__description-title">
                    예약하시겠습니까?
                  </h1>

                  <p class="reservation-confirm__description-content">
                    확인을 누르시면
                    <span class="reservation-confirm__nickname">junjun</span
                    >님과 연결됩니다.<br />
                    이후 채팅을 통해서 진행해주세요.
                  </p>
                </div>

                <div class="reservation-confirm__buttons">
                  <button type="button" class="reservation-confirm__check">
                    확인
                  </button>

                  <button type="button" class="reservation-confirm__cancel">
                    취소
                  </button>
                </div>
              </div>
            </div>
          </article>
        </section>
      </div>
      <!-- //container -->
      <!-- footer -->
      <footer></footer>
      <!-- //footer -->
    </div>

    <script
      src="https://kit.fontawesome.com/b17793764c.js"
      crossorigin="anonymous"
    ></script>
    <script src="js/detailPage.js"></script>
    <script src="js/detailPageslick.js"></script>
  </body>
</html>
