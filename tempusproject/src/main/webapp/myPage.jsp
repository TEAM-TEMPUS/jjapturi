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
  // 프로필 사진, 닉네임, memberId, 자기소개, 거래 건수, 평점, 회원 등급
  // memberId, nikcname, selfIntroduction, 
  // 조인 : memberImage, trading_Info
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
                  src="img/basic-profile-image.png"
                  alt="프로필 사진"
                  class="my-page-profile__image"
                />
                <span class="my-page-profile__nickname">junjunjun</span>
              </div>

              <div class="my-transaction-info">
                <ul class="my-transaction-info__list">
                  <li class="my-transaction-info__item">
                    <span class="my-transaction-info__title">거래건수</span>
                    <span class="my-transaction-info__content">66</span>
                  </li>

                  <li class="my-transaction-info-item">
                    <span class="my-transaction-info__title">회원등급</span>
                    <span class="my-transaction-info__content">골드</span>
                  </li>

                  <li class="my-transaction-info-item">
                    <span class="my-transaction-info__title">평점</span>
                    <span class="my-transaction-info__content">4.5</span>
                  </li>
                </ul>
              </div>
            </div>

            <p class="my-page__introduction">
              안녕하세요. junjunjun입니다~ 애용하고있어요!안녕하세요. junjunjun입니다~ 애용하고있어요!안녕하세요. junjunjun입니다~ 애용하고있어요!안녕하세요. junjunjun입니다~ 애용하고있어요!안녕하세요. junjunjun입니다~ 애용하고있어요!안녕하세요. junjunjun입니다~ 애용하고있어요!안녕하세요. junjunjun입니다~ 애용하고있어요!안녕하세요. junjunjun입니다~ 애용하고있어요!안녕하세요. junjunjun입니다~ 애용하고있어요!안녕하세요. junjunjun입니다~ 애용하고있어요!안녕하세요. junjunjun입니다~ 애용하고있어요!안녕하세요. junjunjun입니다~ 애용하고있어요!안녕하세요. junjunjun입니다~ 애용하고있어요!안녕하세요. junjunjun입니다~ 애용하고있어요!안녕하세요. junjunjun입니다~ 애용하고있어요!안녕하세요. junjunjun입니다~ 애용하고있어요!안녕하세요. junjunjun입니다~ 애용하고있어요!안녕하세요. junjunjun입니다~ 애용하고있어요!안녕하세요. junjunjun입니다~ 애용하고있어요!
            </p>

            <div class="my-page__edit-buttons">
              <button type="button" class="my-profile-edit">프로필 편집</button>
              <button type="button" class="my-info-edit">
                <i class="fas fa-cog my-info-edit__icon"></i>
                <span class="my-info-edit__text">회원 정보 변경</span>
              </button>
            </div>

            <div class="transaction-history">
              <a>거래내역</a>
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
