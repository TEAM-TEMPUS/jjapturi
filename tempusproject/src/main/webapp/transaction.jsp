<%@page import="data.dto.service.MyServiceDto"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="common.Grades"%>
<%@page import="data.dto.member.TradingInfoDto"%>
<%@page import="data.dto.member.MemberProfileDto"%>
<%@page import="data.dao.tradinginfo.TradingInfoDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.service.ServiceDto"%>
<%@page import="data.dto.service.ServiceImageDto"%>
<%@page import="data.dao.service.ServiceImageDao"%>
<%@page import="data.dao.member.MemberDao"%>
<%@page import="data.dto.service.ServiceInqueryDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.service.ServiceDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- google Material Icons -->
<link rel="stylesheet"
	href="https://fonts.sandbox.google.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<link rel="stylesheet" type="text/css" href="css/styles.css" />
<link rel="stylesheet" type="text/css" href="css/screens/transactions.css" />
<%
Long signInMemberId = (Long) session.getAttribute("signInMemberId");

ServiceDao serviceDao = new ServiceDao();
TradingInfoDao tradingInfoDao = new TradingInfoDao();

int totalCount; //총 서비스 수
int totalPage; //총 페이지수
int startPage; //각 블럭의 시작페이지
int endPage; //각 블럭의 끝페이지
int offset; //각 페이지의 시작번호
int sizePerPage = 10; //한 페이지에 보여질 글 갯수
int sizePerBlock = 5; //한 블럭당 보여지는 페이지 개수
int currentPage; //현재페이지

//총갯수
totalCount = tradingInfoDao.getTotalCountByMemberId(signInMemberId);

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
if (endPage > totalPage) {
	endPage = totalPage;
}
//각페이지에서 불러올 시작번호
offset = (currentPage - 1) * sizePerPage;

List<MyServiceDto> myServices = serviceDao.findMyServicesByMemberId(signInMemberId, offset, sizePerPage);

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
DecimalFormat decimalFormat = new DecimalFormat("###,###");

//서비스 이미지 불러오기
ServiceImageDao serviceImageDao = new ServiceImageDao();

List<List<ServiceImageDto>> serviceImagesList = new ArrayList<>();
List<String> medalImageNames = new ArrayList<>();
for (MyServiceDto myService : myServices) {
	serviceImagesList.add(serviceImageDao.findAllByServiceId(myService.getServiceId()));

	if (myService.getTypes().equals("owner")) {
		medalImageNames.add("");
		continue;
	}
	
	List<TradingInfoDto> tradingInfos = tradingInfoDao.findCompleteTradingInfosByMemberId(myService.getMemberId());
  
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
</head>
<body>
	<section id="transaction-list">
		<div class="transaction-list__wrap">

			<h2 class="transaction-list__title">거래내역</h2>


			<div class="transaction__wrap">
				<div class="transaction-item__wrap">
					<%
					for (int i = 0; i < myServices.size(); i++) {
						MyServiceDto myService = myServices.get(i);
					%>
					<div class="transaction-item">
						<a href="#" class="transaction-item__inner">

							<div class="transaction-text__img">
								<div class="transaction-item__img">
									<span class="medal--status"> 
									<img src="img/medal-<%=medalImageNames.get(i)%>.svg" alt="" class="medal__img <%=medalImageNames.get(i)%>" />
									</span>

									<img class="transaction-list__img"
										src="img/<%=serviceImagesList.get(i).get(0).getStoreImageName()%>" alt="이미지" />

								</div>
								<div class="transaction-item-text__wrap">
									<div class="transaction-item__title">
										<%=myService.getTitle()%></div>
									<div class="transaction-item__place"><%=myService.getPlace()%></div>
									<div class="transaction-item-date__wrap">
										<div class="transaction-item-date__icon">
											<span class="material-symbols-rounded"> calendar_today
											</span>
										</div>
										<div class="date__wrap">
											<span><%=sdf.format(myService.getStartDate())%> ~ <%=sdf.format(myService.getEndDate())%></span>
										</div>
									</div>
									<div class="transaction-item__price"><%=decimalFormat.format(myService.getPrice())%></div>
									<div class="transaction-item__description">
										<span class="description__text"><%=myService.getDescription()%>
										</span>
									</div>

									<div class="box__item-btn">
										<%
										if (signInMemberId == myService.getMemberId()) {
										%>
										<button type="submit" class="btn__update">수정</button>
										<button type="submit" class="btn__delete">삭제</button>
										<%
										}
										%>
									</div>
								</div>

							</div>

							<div class="box__information-reservation">
							<%String status = myService.getStatus(); 
							  String types = myService.getTypes();
							%>
							<%if (types.equals("owner")) {%>
								<button type="submit" class="btn__sale <%=status.equals("basic") ? " btn--selected" : ""%>">판매중</button>
								<button type="submit" class="btn__reserved <%=status.equals("reservation") ? " btn--selected" : ""%>">예약중</button>
								<button type="submit" class="btn__completed <%=status.equals("completion") ? " btn--selected" : ""%>">거래완료</button>
								<%if (status.equals("completion")) { %>
								<button type="submit" class="btn__star">리뷰</button>
								<%} %>
								
							<%} else { // custom인 경우%>
								<button type="submit" class="btn__cancle <%=status.equals("reservation") ? " btn--selected" : ""%>">예약취소</button>
								<button type="submit" class="btn__completed <%=status.equals("completion") ? " btn--selected" : ""%>">거래완료</button>
								<%if (status.equals("completion")) { %>
								<button type="submit" class="btn__star">리뷰</button>
								<%} %>
							<%} %>
							
							<% %>
							</div>
						</a>
					</div>
					<%
					}
					%>
				</div>
			</div>

			<!-- pagenation -->
			<div class="pagenation__wrap">
				<div class="pagenation__inner">
					<%
					if (startPage == 1) {
					%>
					<a href="#" class="pagenation__item pagenation--previous"
						tabindex="-1" aria-disabled="true"> <span
						class="material-symbols-rounded"> arrow_back_ios_new </span>
					</a>
					<%
					} else {
					%>
					<a
						href="/tempusproject/transac.jsp?currentPage=<%=startPage - 1%>"
						class="pagenation__item pagenation--previous" tabindex="-1"
						aria-disabled="true"> <span class="material-symbols-rounded">
							arrow_back_ios_new </span>
					</a>
					<%
					}
					%>
					<%
					for (int i = startPage; i <= endPage; i++) {
					%>

					<a href="/tempusproject/serviceList.jsp?currentPage=<%=i%>"
						class="pagenation__item pagenation-number <%=i == currentPage ? "current" : ""%>"><%=i%></a>
					<%
					}
					%>
					<%
					if (totalPage == endPage) {
					%>
					<a href="#" class="pagenation__item pagenation--next"> <span
						class="material-symbols-rounded"> arrow_forward_ios </span>
					</a>
					<%
					} else {
					%>
					<a
						href="/tempusproject/serviceList.jsp?currentPage=<%=endPage + 1%>"
						class="pagenation__item pagenation--next"> <span
						class="material-symbols-rounded"> arrow_forward_ios </span>
					</a>
					<%
					}
					%>
				</div>
			</div>
		</div>

		<!-- service-navigation -->
		<div class="service--navigation">
			<div class="menu-bar">
				<a href="#item-menu" id="navigation"> <span>
						<div class="menu-area"></div>
				</span>
				</a>
				<div id="menu_wrap">
					<ul>
						<li><a href="#">서비스 등록</a></li>
						<li><a href="#">마이페이지</a></li>
						<li><a href="#">거래내역</a></li>

					</ul>
				</div>
			</div>
		</div>
	</section>

	<script src="js/default.js"></script>
	<script src="js/serviceNavigation.js"></script>
</body>
</html>