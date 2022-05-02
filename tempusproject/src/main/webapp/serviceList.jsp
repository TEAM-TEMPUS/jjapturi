<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- favicon -->
    <link rel="icon" type="image/png" sizes="32x32" href="img/favicon-32x32.png"/>
    <title>짭투리 | 서비스 목록</title>
    <!-- google Material Icons -->
    <link rel="stylesheet" href="https://fonts.sandbox.google.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200"/>
    <!-- css -->
	<!-- 다른 html을 들고 올때 css에 있는 style.css 임포트 빼고 아래와 같이 넣어줄것 -->
    <link rel="stylesheet" type="text/css" href="css/styles.css" />
    <link rel="stylesheet" type="text/css" href="css/screens/serviceList.css">
  </head>
  <body>
    <!-- header -->
    <header></header>

    <!-- service-list -->
    <section id="service-list">
      <div class="service-list__wrap">
        <div class="service-title-switch__wrap">
          <!-- switch -->
          <div class="switch__wrap">
            <input
              id="toggle-on"
              class="toggle toggle-left"
              name="toggle"
              value="false"
              type="radio"
              checked
            />
            <label for="toggle-on" class="btn">개미</label>
            <input
              id="toggle-off"
              class="toggle toggle-right"
              name="toggle"
              value="true"
              type="radio"
            />
            <label for="toggle-off" class="btn">베짱이</label>
          </div>
          <h2 class="service-list__title">청소</h2>
        </div>
        <div class="service__wrap">
          <div class="service-item__wrap">
            <div class="service-item">
              <a href="#" class="service-item__inner">
                <div class="service-item__img img-hover--color">
                  <span class="medal--status">
                    <img src="img/medal-gold.svg" alt="" class="medal__img" />
                  </span>
                  <img
                    class="service-list__test-img img-hover--scale"
                    src="img/service-list__test-img-1.jpg"
                    alt=""
                  />
                </div>
                <div class="service-item-txt__wrap">
                  <div class="service-item__title">
                    입주청소 해주실 분 찾습니다!
                  </div>
                  <div class="service-item__place">대구 수성구 범어2동</div>
                  <div class="service-item-date__wrap">
                    <div class="service-item-date__icon">
                      <span class="material-symbols-rounded">
                        calendar_today
                      </span>
                    </div>
                    <div class="date__wrap">
                      <span>2022-04-22 ~ 2022-04-30</span>
                    </div>
                  </div>
                  <div class="service-item__status">
                    <!-- item 거래 상태 표시 -->
                    <span class="list__transaction-status complete">
                      <img src="img/status-complete.svg" alt="" />
                    </span>
                    <div class="service-item__price">70,000</div>
                  </div>
                  <div class="service-item__description">
                    <span class="item-description__txt">
                      입주 청소 해주실 분을 찾습니다! 아주 깔끔하게
                      청소해주실분~
                    </span>
                  </div>
                </div>
              </a>
            </div>

            <div class="service-item">
              <a href="#" class="service-item__inner">
                <div class="service-item__img img-hover--color">
                  <span class="medal--status">
                    <img src="" alt="" class="medal__img" />
                  </span>
                  <img
                    class="service-list__test-img img-hover--scale"
                    src="img/service-list__test-img-2.jpg"
                    alt=""
                  />
                </div>
                <div class="service-item-txt__wrap">
                  <div class="service-item__title">
                    마당 청소 도와주실 분을 찾고 있습니다.
                  </div>
                  <div class="service-item__place">경상남도 김해시 부원동</div>
                  <div class="service-item-date__wrap">
                    <div class="service-item-date__icon">
                      <span class="material-symbols-rounded">
                        calendar_today
                      </span>
                    </div>
                    <div class="date__wrap">
                      <span>2022-04-23 ~ 2022-05-20</span>
                    </div>
                  </div>
                  <div class="service-item__status">
                    <span class="list__transaction-status"></span>
                    <div class="service-item__price">70,000</div>
                  </div>
                  <div class="service-item__description">
                    <span class="item-description__txt">
                      마당 낙엽 청소하려는데 같이 하실분 찾아요!
                    </span>
                  </div>
                </div>
              </a>
            </div>

            <div class="service-item">
              <a href="#" class="service-item__inner">
                <div class="service-item__img img-hover--color">
                  <span class="medal--status">
                    <img src="" alt="" class="medal__img" />
                  </span>
                  <img
                    class="service-list__test-img img-hover--scale"
                    src="img/service-list__test-img-3.jpg"
                    alt=""
                  />
                </div>
                <div class="service-item-txt__wrap">
                  <div class="service-item__title">
                    창고 정리 5일정도 같이 해주실 분 구해봐요~
                  </div>
                  <div class="service-item__place">서울 서대문구 북기좌동</div>
                  <div class="service-item-date__wrap">
                    <div class="service-item-date__icon">
                      <span class="material-symbols-rounded">
                        calendar_today
                      </span>
                    </div>
                    <div class="date__wrap">
                      <span>2022-05-22 ~ 2022-05-26</span>
                    </div>
                  </div>
                  <div class="service-item__status">
                    <span class="list__transaction-status reserved">
                      <img src="img/status-reserved.svg" alt="" />
                    </span>
                    <div class="service-item__price">70,000</div>
                  </div>
                  <div class="service-item__description">
                    <span class="item-description__txt">
                      대형 창고이고 여분옷도 따로 챙겨드리지는 않으니깐
                      챙겨오세요
                    </span>
                  </div>
                </div>
              </a>
            </div>

            <div class="service-item">
              <a href="#" class="service-item__inner">
                <div class="service-item__img img-hover--color">
                  <span class="medal--status">
                    <img
                      src="img/medal-platinum.svg"
                      alt=""
                      class="medal__img"
                    />
                  </span>
                  <img
                    class="service-list__test-img img-hover--scale"
                    src="img/service-list__test-img-1.jpg"
                    alt=""
                  />
                </div>
                <div class="service-item-txt__wrap">
                  <div class="service-item__title">
                    입주청소 해주실 분 찾습니다!
                  </div>
                  <div class="service-item__place">대구 수성구 범어2동</div>
                  <div class="service-item-date__wrap">
                    <div class="service-item-date__icon">
                      <span class="material-symbols-rounded">
                        calendar_today
                      </span>
                    </div>
                    <div class="date__wrap">
                      <span>2022-04-22 ~ 2022-04-30</span>
                    </div>
                  </div>
                  <div class="service-item__status">
                    <span class="list__transaction-status"></span>
                    <div class="service-item__price">70,000</div>
                  </div>
                  <div class="service-item__description">
                    <span class="item-description__txt">
                      입주 청소 해주실 분을 찾습니다! 아주 깔끔하게
                      청소해주실분~
                    </span>
                  </div>
                </div>
              </a>
            </div>

            <div class="service-item">
              <a href="#" class="service-item__inner">
                <div class="service-item__img img-hover--color">
                  <span class="medal--status">
                    <img src="" alt="" class="medal__img" />
                  </span>
                  <img
                    class="service-list__test-img img-hover--scale"
                    src="img/service-list__test-img-2.jpg"
                    alt=""
                  />
                </div>
                <div class="service-item-txt__wrap">
                  <div class="service-item__title">
                    마당 청소 도와주실 분을 찾고 있습니다.
                  </div>
                  <div class="service-item__place">경상남도 김해시 부원동</div>
                  <div class="service-item-date__wrap">
                    <div class="service-item-date__icon">
                      <span class="material-symbols-rounded">
                        calendar_today
                      </span>
                    </div>
                    <div class="date__wrap">
                      <span>2022-04-23 ~ 2022-05-20</span>
                    </div>
                  </div>
                  <div class="service-item__status">
                    <span class="list__transaction-status"></span>
                    <div class="service-item__price">70,000</div>
                  </div>
                  <div class="service-item__description">
                    <span class="item-description__txt">
                      마당 낙엽 청소하려는데 같이 하실분 찾아요!
                    </span>
                  </div>
                </div>
              </a>
            </div>

            <div class="service-item">
              <a href="#" class="service-item__inner">
                <div class="service-item__img img-hover--color">
                  <span class="medal--status">
                    <img src="img/medal-silver.svg" alt="" class="medal__img" />
                  </span>
                  <img
                    class="service-list__test-img img-hover--scale"
                    src="img/service-list__test-img-3.jpg"
                    alt=""
                  />
                </div>
                <div class="service-item-txt__wrap">
                  <div class="service-item__title">
                    창고 정리 5일정도 같이 해주실 분 구해봐요~
                  </div>
                  <div class="service-item__place">서울 서대문구 북기좌동</div>
                  <div class="service-item-date__wrap">
                    <div class="service-item-date__icon">
                      <span class="material-symbols-rounded">
                        calendar_today
                      </span>
                    </div>
                    <div class="date__wrap">
                      <span>2022-05-22 ~ 2022-05-26</span>
                    </div>
                  </div>
                  <div class="service-item__status">
                    <span class="list__transaction-status"></span>
                    <div class="service-item__price">70,000</div>
                  </div>
                  <div class="service-item__description">
                    <span class="item-description__txt">
                      대형 창고이고 여분옷도 따로 챙겨드리지는 않으니깐
                      챙겨오세요
                    </span>
                  </div>
                </div>
              </a>
            </div>

            <div class="service-item">
              <a href="#" class="service-item__inner">
                <div class="service-item__img img-hover--color">
                  <span class="medal--status">
                    <img src="" alt="" class="medal__img" />
                  </span>
                  <img
                    class="service-list__test-img img-hover--scale"
                    src="img/service-list__test-img-1.jpg"
                    alt=""
                  />
                </div>
                <div class="service-item-txt__wrap">
                  <div class="service-item__title">
                    입주청소 해주실 분 찾습니다!
                  </div>
                  <div class="service-item__place">대구 수성구 범어2동</div>
                  <div class="service-item-date__wrap">
                    <div class="service-item-date__icon">
                      <span class="material-symbols-rounded">
                        calendar_today
                      </span>
                    </div>
                    <div class="date__wrap">
                      <span>2022-04-22 ~ 2022-04-30</span>
                    </div>
                  </div>
                  <div class="service-item__status">
                    <span class="list__transaction-status"></span>
                    <div class="service-item__price">70,000</div>
                  </div>
                  <div class="service-item__description">
                    <span class="item-description__txt">
                      입주 청소 해주실 분을 찾습니다! 아주 깔끔하게
                      청소해주실분~
                    </span>
                  </div>
                </div>
              </a>
            </div>

            <div class="service-item">
              <a href="#" class="service-item__inner">
                <div class="service-item__img img-hover--color">
                  <span class="medal--status">
                    <img src="" alt="" class="medal__img" />
                  </span>
                  <img
                    class="service-list__test-img img-hover--scale"
                    src="img/service-list__test-img-2.jpg"
                    alt=""
                  />
                </div>
                <div class="service-item-txt__wrap">
                  <div class="service-item__title">
                    마당 청소 도와주실 분을 찾고 있습니다.
                  </div>
                  <div class="service-item__place">경상남도 김해시 부원동</div>
                  <div class="service-item-date__wrap">
                    <div class="service-item-date__icon">
                      <span class="material-symbols-rounded">
                        calendar_today
                      </span>
                    </div>
                    <div class="date__wrap">
                      <span>2022-04-23 ~ 2022-05-20</span>
                    </div>
                  </div>
                  <div class="service-item__status">
                    <span class="list__transaction-status"></span>
                    <div class="service-item__price">70,000</div>
                  </div>
                  <div class="service-item__description">
                    <span class="item-description__txt">
                      마당 낙엽 청소하려는데 같이 하실분 찾아요!
                    </span>
                  </div>
                </div>
              </a>
            </div>

            <div class="service-item">
              <a href="#" class="service-item__inner">
                <div class="service-item__img img-hover--color">
                  <span class="medal--status">
                    <img src="" alt="" class="medal__img" />
                  </span>
                  <img
                    class="service-list__test-img img-hover--scale"
                    src="img/service-list__test-img-3.jpg"
                    alt=""
                  />
                </div>
                <div class="service-item-txt__wrap">
                  <div class="service-item__title">
                    창고 정리 5일정도 같이 해주실 분 구해봐요~
                  </div>
                  <div class="service-item__place">서울 서대문구 북기좌동</div>
                  <div class="service-item-date__wrap">
                    <div class="service-item-date__icon">
                      <span class="material-symbols-rounded">
                        calendar_today
                      </span>
                    </div>
                    <div class="date__wrap">
                      <span>2022-05-22 ~ 2022-05-26</span>
                    </div>
                  </div>
                  <div class="service-item__status">
                    <span class="list__transaction-status"></span>
                    <div class="service-item__price">70,000</div>
                  </div>
                  <div class="service-item__description">
                    <span class="item-description__txt">
                      대형 창고이고 여분옷도 따로 챙겨드리지는 않으니깐
                      챙겨오세요
                    </span>
                  </div>
                </div>
              </a>
            </div>

            <div class="service-item">
              <a href="#" class="service-item__inner">
                <div class="service-item__img img-hover--color">
                  <span class="medal--status">
                    <img src="" alt="" class="medal__img" />
                  </span>
                  <img
                    class="service-list__test-img img-hover--scale"
                    src="img/service-list__test-img-1.jpg"
                    alt=""
                  />
                </div>
                <div class="service-item-txt__wrap">
                  <div class="service-item__title">
                    입주청소 해주실 분 찾습니다!
                  </div>
                  <div class="service-item__place">대구 수성구 범어2동</div>
                  <div class="service-item-date__wrap">
                    <div class="service-item-date__icon">
                      <span class="material-symbols-rounded">
                        calendar_today
                      </span>
                    </div>
                    <div class="date__wrap">
                      <span>2022-04-22 ~ 2022-04-30</span>
                    </div>
                  </div>
                  <div class="service-item__status">
                    <span class="list__transaction-status"></span>
                    <div class="service-item__price">70,000</div>
                  </div>
                  <div class="service-item__description">
                    <span class="item-description__txt">
                      입주 청소 해주실 분을 찾습니다! 아주 깔끔하게
                      청소해주실분~
                    </span>
                  </div>
                </div>
              </a>
            </div>

            <div class="service-item">
              <a href="#" class="service-item__inner">
                <div class="service-item__img img-hover--color">
                  <span class="medal--status">
                    <img
                      src="img/medal-platinum.svg"
                      alt=""
                      class="medal__img"
                    />
                  </span>
                  <img
                    class="service-list__test-img img-hover--scale"
                    src="img/service-list__test-img-2.jpg"
                    alt=""
                  />
                </div>
                <div class="service-item-txt__wrap">
                  <div class="service-item__title">
                    마당 청소 도와주실 분을 찾고 있습니다.
                  </div>
                  <div class="service-item__place">경상남도 김해시 부원동</div>
                  <div class="service-item-date__wrap">
                    <div class="service-item-date__icon">
                      <span class="material-symbols-rounded">
                        calendar_today
                      </span>
                    </div>
                    <div class="date__wrap">
                      <span>2022-04-23 ~ 2022-05-20</span>
                    </div>
                  </div>
                  <div class="service-item__status">
                    <span class="list__transaction-status"></span>
                    <div class="service-item__price">70,000</div>
                  </div>
                  <div class="service-item__description">
                    <span class="item-description__txt">
                      마당 낙엽 청소하려는데 같이 하실분 찾아요!
                    </span>
                  </div>
                </div>
              </a>
            </div>

            <div class="service-item">
              <a href="#" class="service-item__inner">
                <div class="service-item__img img-hover--color">
                  <span class="medal--status">
                    <img src="" alt="" class="medal__img" />
                  </span>
                  <img
                    class="service-list__test-img img-hover--scale"
                    src="img/service-list__test-img-3.jpg"
                    alt=""
                  />
                </div>
                <div class="service-item-txt__wrap">
                  <div class="service-item__title">
                    창고 정리 5일정도 같이 해주실 분 구해봐요~
                  </div>
                  <div class="service-item__place">서울 서대문구 북기좌동</div>
                  <div class="service-item-date__wrap">
                    <div class="service-item-date__icon">
                      <span class="material-symbols-rounded">
                        calendar_today
                      </span>
                    </div>
                    <div class="date__wrap">
                      <span>2022-05-22 ~ 2022-05-26</span>
                    </div>
                  </div>
                  <div class="service-item__status">
                    <span class="list__transaction-status"></span>
                    <div class="service-item__price">70,000</div>
                  </div>
                  <div class="service-item__description">
                    <span class="item-description__txt">
                      대형 창고이고 여분옷도 따로 챙겨드리지는 않으니깐
                      챙겨오세요
                    </span>
                  </div>
                </div>
              </a>
            </div>
          </div>
        </div>

        <!-- pagenation -->
        <div class="pagenation__wrap">
          <div class="pagenation__inner">
            <a href="#" class="pagenation__item pagenation--previous">
              <span class="material-symbols-rounded"> arrow_back_ios_new </span>
            </a>
            <a href="#" class="pagenation__item pagenation-number">6</a>
            <a href="#" class="pagenation__item pagenation-number current">7</a>
            <a href="#" class="pagenation__item pagenation-number">8</a>
            <a href="#" class="pagenation__item pagenation-number">9</a>
            <a href="#" class="pagenation__item pagenation-number">10</a>
            <a href="#" class="pagenation__item pagenation--next">
              <span class="material-symbols-rounded"> arrow_forward_ios </span>
            </a>
          </div>
        </div>
      </div>

      <!-- service-navigation -->
      <div class="service--navigation">
        <div class="menu-bar">
          <a href="#item-menu" id="navigation">
            <span>
              <div class="menu-area"></div>
            </span>
          </a>
          <div id="menu_wrap">
            <ul>
              <li><a href="#">등록하기</a></li>
              <li><a href="#">거래내역</a></li>
              <li><a href="#">마이페이지</a></li>
            </ul>
          </div>
        </div>
      </div>
    </section>

    <!-- footer -->
    <footer></footer>

    <!-- js -->
    <script src="js/serviceNavigation.js"></script>
    <!-- script -->

  </body>
</html>