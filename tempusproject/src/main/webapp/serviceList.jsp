<%@page import="java.util.HashMap"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.service.ServiceInqueryDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.service.ServiceDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- favicon -->
<link rel="icon" type="image/png" sizes="32x32"
	href="img/favicon-32x32.png" />
<title>짭투리 | 서비스 목록</title>
<!-- google Material Icons -->
<link rel="stylesheet"
	href="https://fonts.sandbox.google.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<!-- css -->
<!-- 다른 html을 들고 올때 css에 있는 style.css 임포트 빼고 아래와 같이 넣어줄것 -->
<link rel="stylesheet" type="text/css" href="css/styles.css" />
<link rel="stylesheet" type="text/css"
	href="css/screens/serviceList.css">
</head>
</head>
<%
	String category = request.getParameter("category");
	HashMap<String, String> categoryMap = new HashMap<>();
	categoryMap.put("errand", "심부름");
	categoryMap.put("walk", "산책");
	categoryMap.put("install", "설치");
	categoryMap.put("study", "과외");
	categoryMap.put("clean", "청소");
	
	ServiceDao dao = new ServiceDao();
	
	int totalCount; //총 서비스 수
	int totalPage; //총 페이지수
	int startPage; //각 블럭의 시작페이지
	int endPage; //각 블럭의 끝페이지
	int offset; //각 페이지의 시작번호
	int sizePerPage = 5; //한 페이지에 보여질 글 갯수
	int sizePerBlock = 5; //한 블럭당 보여지는 페이지 개수
	int currentPage; //현재페이지
	
	//총갯수
	totalCount = dao.getTotalCountByCategory("category");
	
	//현재 페이지번호 읽기(단 null일경우는 1페이지로 설정)
	if (request.getParameter("currentPage") == null)
		currentPage = 1;
	else
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	
	//총페이지 개수구하기
	totalPage = totalCount / sizePerPage + (totalCount % sizePerPage == 0 ? 0 : 1);
	
	//각블럭의 시작페이지
	//예:현재페이지가 3인경우 startpage=1,endpage= 5
	//현재페이지가 6인경우 startpage=6,endpage= 10
	startPage = (currentPage - 1) / sizePerBlock * sizePerBlock + 1;
	endPage = startPage + sizePerPage - 1;
	
	//만약 총페이지가 8 -2번째블럭: 6-10 ..이럴경우는 endpage가 8로 수정되어야함
	if (endPage > totalPage)
		endPage = totalPage;
	
	//각페이지에서 불러올 시작번호
	offset = (currentPage - 1) * sizePerPage;
	
	//각페이지에서 필요한 게시글 가져오기
	List<ServiceInqueryDto> services = dao.findAll(category, offset, sizePerPage);
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
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
          <h2 class="service-list__title"><%= categoryMap.get(category)%></h2>
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