<%@page import="data.dto.tradinginfo.TradingInfoDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="data.dao.member.MemberDao"%>
<%@page import="common.Grades"%>
<%@page import="data.dao.tradinginfo.TradingInfoDao"%>
<%@page import="data.dto.service.ServiceImageDto"%>
<%@page import="data.dao.service.ServiceImageDao"%>
<%@page import="java.text.DecimalFormat"%>
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
	String types = request.getParameter("types");
	HashMap<String, String> categoryMap = new HashMap<>();
	categoryMap.put("errand", "심부름");
	categoryMap.put("walk", "산책");
	categoryMap.put("install", "설치");
	categoryMap.put("study", "과외");
	categoryMap.put("clean", "청소");
	
	ServiceDao serviceDao = new ServiceDao();
	
	int totalCount; //총 서비스 수
	int totalPage; //총 페이지수
	int startPage; //각 블럭의 시작페이지
	int endPage; //각 블럭의 끝페이지
	int offset; //각 페이지의 시작번호
	int sizePerPage = 20; //한 페이지에 보여질 글 갯수
	int sizePerBlock = 5; //한 블럭당 보여지는 페이지 개수
	int currentPage; //현재페이지
	
	//총갯수
	totalCount = serviceDao.getTotalCountByCategory(category, types);

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
	if (endPage > totalPage){
		endPage = totalPage;
	}
	//각페이지에서 불러올 시작번호
	offset = (currentPage - 1) * sizePerPage;
	
	//각페이지에서 필요한 게시글 가져오기, 여기에 types를 추가하는게 맞는지는 모르겠지만 해보기
	List<ServiceInqueryDto> services = serviceDao.findAll(category, types, offset, sizePerPage);
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	DecimalFormat decimalFormat = new DecimalFormat("###,###");
	
	//서비스 이미지 불러오기
	ServiceImageDao serviceImageDao = new ServiceImageDao();
	
	List<List<ServiceImageDto>> serviceImagesList = new ArrayList<>();
	List<String> medalImageNames = new ArrayList<>();
	for (ServiceInqueryDto service : services) {
		serviceImagesList.add(serviceImageDao.findAllByServiceId(service.getServiceId()));
	}

	//서비스 거래 상태에 따라서 나오는 회원 등급
	MemberDao memberDao = new MemberDao();
 	TradingInfoDao tradingInfoDao = new TradingInfoDao();

  	for (ServiceInqueryDto service : services) {
  		List<TradingInfoDto> tradingInfos = tradingInfoDao.findCompleteTradingInfosByMemberId(service.getMemberId());
  	  
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
  	  
  	  	String medalImageName;
  	  	if (completeTradingCount >= 100 && totalGrade >= 3.5) {
  	  	  medalImageName = Grades.PLATINUM.getImagePath();
  	  	} else if (completeTradingCount >= 50 && totalGrade >= 3.0) {
  	  	  medalImageName = Grades.GOLD.getImagePath();
  	 	} else if (completeTradingCount >= 10 && totalGrade >= 2.5) {
  	 	  medalImageName = Grades.SILVER.getImagePath();
  	 	} else {
  	 	  medalImageName = Grades.BRONZE.getImagePath();
  	  	}
  	  	
  		medalImageNames.add(medalImageName);
  		
	}
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
              <%= types.equals("ant") ? "checked" : ""%>
              OnClick="location.href='index.jsp?home=serviceList.jsp?category=<%=category %>&types=ant'"
            />
<!--             개미, 베짱이 해야함 -->
            <label for="toggle-on" class="btn" >개미</label>
            <input
              id="toggle-off"
              class="toggle toggle-right"
              name="toggle"
              value="true"
              type="radio"
              <%= types.equals("grasshopper") ? "checked" : ""%>
              OnClick="location.href='index.jsp?home=serviceList.jsp?category=<%=category %>&types=grasshopper'"
            />
            <label for="toggle-off" class="btn" >베짱이</label>
          </div>
          <h2 class="service-list__title"><%= categoryMap.get(category)%></h2>
        </div>
        <div class="service__wrap">
          <div class="service-item__wrap">
          <%for (int i = 0; i < services.size(); i++) { 
          	ServiceInqueryDto service = services.get(i);
          %>
            <div class="service-item">
              <a href="index.jsp?home=detailPage.jsp?serviceId=<%= service.getServiceId()%>&memberId=<%= service.getMemberId()%>" class="service-item__inner">
                <div class="service-item__img img-hover--color">
                  <span class="medal--status">
                    <img src="img/medal-<%= medalImageNames.get(i) %>.svg" alt="" class="medal__img <%= medalImageNames.get(i) %>" />
                  </span>
                  <%for (ServiceImageDto serviceImage : serviceImagesList.get(i)) { %>
                  	<img class="service-list__test-img img-hover--scale" src="img/<%= serviceImage.getStoreImageName() %>" alt=""/>
                  <%} %>
                </div>
                <div class="service-item-txt__wrap">
                  <div class="service-item__title">
                    <%= service.getTitle() %>
                  </div>
                  <div class="service-item__place"><%= service.getPlace() %></div>
                  <div class="service-item-date__wrap">
                    <div class="service-item-date__icon">
                      <span class="material-symbols-rounded">
                        calendar_today
                      </span>
                    </div>
                    <div class="date__wrap">
                      <span><%= sdf.format(service.getStartDate()) %> ~ <%= sdf.format(service.getEndDate())%></span>
                    </div>
                  </div>
                  <div class="service-item__status">
                    <!-- item 거래 상태 표시 -->
                    <% String status = service.getStatus(); %>
                    <span class="list__transaction-status">
                      <img src="img/status_<%= status %>.svg" alt="" class="<%= status %>">
                    </span>
                    <div class="service-item__price"><%= decimalFormat.format(service.getPrice())%></div>
                  </div>
                  <div class="service-item__description">
                    <span class="item-description__txt">
                      <%= service.getDescription() %>
                    </span>
                  </div>
                </div>
              </a>
            </div>

		  <%} %>
          </div>
        </div>

        <!-- pagenation -->
        <div class="pagenation__wrap">
          <div class="pagenation__inner">
          	<% if (startPage == 1) {%>
            <a href="#" class="pagenation__item pagenation--previous" tabindex="-1" aria-disabled="true">
              <span class="material-symbols-rounded"> arrow_back_ios_new </span>
            </a>
            <%} else {%>
            <a href="index.jsp?home=serviceList.jsp?category=<%=category %>&types=<%=types %>&currentPage=<%= startPage -1 %>" class="pagenation__item pagenation--previous" tabindex="-1" aria-disabled="true">
              <span class="material-symbols-rounded"> arrow_back_ios_new </span>
            </a>
            <%} %>
            <% for (int i = startPage; i<= endPage; i++) {%>
            
            <a href="index.jsp?home=serviceList.jsp?category=<%=category %>&types=<%=types %>&currentPage=<%= i %>" class="pagenation__item pagenation-number <%= i == currentPage ? "current" : ""%>"><%= i %></a>
            <%} %>
            <%
            if (totalPage == endPage){
            %>
            <a href="#" class="pagenation__item pagenation--next">
              <span class="material-symbols-rounded"> arrow_forward_ios </span>
            </a>
            <%} else {%>
            <a href="index.jsp?home=serviceList.jsp?category=<%=category %>&types=<%=types %>&currentPage=<%= endPage + 1 %>" class="pagenation__item pagenation--next">
              <span class="material-symbols-rounded"> arrow_forward_ios </span>
            </a>
            <%} %>
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
              <li><a href="index.jsp?home=serviceRegistration.jsp">등록하기</a></li>
              <li><a href="index.jsp?home=transaction.jsp">거래내역</a></li>
              <li><a href="index.jsp?home=myPage.jsp">마이페이지</a></li>
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