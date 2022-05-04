<%@page import="data.dto.tradinginfo.TradingInfoDto"%>
<%@page import="java.util.Objects"%>
<%@page import="data.dao.member.MemberDao"%>
<%@page import="common.Grades"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="java.util.List"%>
<%@page import="data.dto.member.MemberProfileDto"%>
<%@page import="data.dao.tradinginfo.TradingInfoDao"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>마이페이지</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css" />
    <link rel="stylesheet" type="text/css" href="css/screens/myPage.css" />
  </head>
  <%
  MemberDao memberDao = new MemberDao();
  TradingInfoDao tradingInfoDao = new TradingInfoDao();
  
  Long signInMemberId = (Long)session.getAttribute("signInMemberId");
  
  MemberProfileDto memberProfile =  memberDao.findMemberProfileByMemberId(signInMemberId);
  List<TradingInfoDto> tradingInfos = tradingInfoDao.findCompleteTradingInfosByMemberId(signInMemberId);
  
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
	  rank = Grades.PLATINUM.getDescription();
  } else if (completeTradingCount >= 50 && totalGrade >= 3.0) {
	  rank = Grades.GOLD.getDescription();
  } else if (completeTradingCount >= 10 && totalGrade >= 2.5) {
	  rank = Grades.SILVER.getDescription();
  } else {
	  rank = Grades.BRONZE.getDescription();
  }
  	
  %>
  <body>
    <div id="wrap">
      <header></header>
      <div id="container">
        <main class="container__inner">
          <article class="my-page">
            <h1 class="my-page__title">마이페이지</h1>

            <div class="my-page__profile">
              <div class="my-page-profile">
                <img
                  src="storefiles/<%= memberProfile.getMemberImage() %>"
                  alt="프로필 사진"
                  class="my-page-profile__image"
                />
                <span class="my-page-profile__nickname"><%= memberProfile.getNickname() %></span>
              </div>

              <div class="my-transaction-info">
                <ul class="my-transaction-info__list">
                  <li class="my-transaction-info__item">
                    <span class="my-transaction-info__title">거래건수</span>
                    <span class="my-transaction-info__content"><%= completeTradingCount %></span>
                  </li>

                  <li class="my-transaction-info-item">
                    <span class="my-transaction-info__title">회원등급</span>
                    <span class="my-transaction-info__content"><%= rank %></span>
                  </li>

                  <li class="my-transaction-info-item">
                    <span class="my-transaction-info__title">평점</span>
                    <span class="my-transaction-info__content"><%= totalGrade > 0 ? totalGrade : "결과 없음" %></span>
                  </li>
                </ul>
              </div>
            </div>

            <p class="my-page__introduction">
              <%= memberProfile.getSelfIntroduction()%>
            </p>

            <div class="my-page__edit-buttons">
              <button type="button" class="my-profile-edit">프로필 편집</button>
              <button type="button" class="my-info-edit">
                <i class="fas fa-cog my-info-edit__icon"></i>
                <span class="my-info-edit__text">회원 정보 변경</span>
              </button>
            </div>

            <div class="transaction-history">
              <a href="index.jsp?home=transaction.jsp" class="transaction-history__link">거래내역</a>
            </div>
          </article>
        </main>
      </div>
      <footer></footer>
    </div>

    <script
      src="https://kit.fontawesome.com/b17793764c.js"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
