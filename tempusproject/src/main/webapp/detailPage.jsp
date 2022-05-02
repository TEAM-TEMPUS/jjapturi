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

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>���� �� ������</title>
     <!--1�� cdn��� slick���� css��ũ������--> 
   <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
     
   <!--8�� xeicon�� �����´� ���: xeicon����Ʈ-> �޴��� get started -> ����Ʈ <head> �±� �ȿ� �Ʒ��� �ڵ带 ���Դϴ� �� �ڵ� ����
       �״��� ���̺귯���� �� ���ϴ� �������� �����´�-->
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">

   <!--5�� �������� ��������-->
   <!--�������� �ٿ���: �������� Ȩ������->�ٿ�ε�->�ǾƷ� cdn��ũŬ��-> ���� minifiedŬ��->�ڵ� ����-->
   <!--�������� ��ũ��Ʈ ���� ����� ���̺귯�� ���� ������ �;��Ѵ�-->
   <!--src���ܳ��� �� ����-->
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

   <!--2�� cdn��� slick���� js��ũ������-->
   <!--1�� 2�� ���� �ȵɽ� //cdn �տ� http://�־���� �Ѵ�.-->
   <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    
    <link rel="stylesheet" type="text/css" href="css/styles.css" />
    <link rel="stylesheet" type="text/css" href="css/screens/detailPage.css" />
<!-- jsp�ۼ� -->    
<%
// Service�� ��ȸ
// Service�� ���� ���� Comment ��ȸ
Long serviceId = Long.parseLong(request.getParameter("serviceId"));
Long memberId = Long.parseLong(request.getParameter("memberId"));

MemberDao memberDao = new MemberDao();
ServiceDao serviceDao = new ServiceDao();
CommentDao commentDao = new CommentDao();
ServiceImageDao serviceImageDao = new ServiceImageDao();
TradingInfoDao tradingInfoDao =new TradingInfoDao();

HashMap<String, String> categoryMap = new HashMap<>();
categoryMap.put("errand", "�ɺθ�");
categoryMap.put("walk", "��å");
categoryMap.put("install", "��ġ");
categoryMap.put("study", "����");
categoryMap.put("clean", "û��");
//�����ȸ
//5.dao list���� 
ServiceInqueryDto service = serviceDao.findByServiceId(serviceId);
List<CommentInqueryDto> comments = commentDao.findAllByServiceId(serviceId);
//�̹��� ��ȸ //Ÿ���� dto���ִ°Ŵ�
List<ServiceImageDto> images = serviceImageDao.findAllByServiceId(serviceId);
//����� �����ʰ� �г���
MemberProfileDto memberprofiledto = memberDao.findMemberProfileByMemberId(memberId);
//������ ���
List<TradingInfoDto> rank = tradingInfoDao.findCompleteTradingInfosByMemberId(memberId);

//System.out.println(rank.get(0).getGrade());

%>   
  </head>
  <body>
    <div id="wrap">
      <header></header>
      <!-- container -->
      <div id="container">
        <main class="container__inner">
          <article class="detailpage-info">
            <!--����-->
            <h2 class="detailpage-info__categorytitle"><%= categoryMap.get(service.getCategory()) %></h2>
            <!--����̹���-->
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
                <!--����� ����-->
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
                      src="img/bronze-badge.png"
                      class="detailpage-info__rankinfo"
                  /></span>
                </li>

                <!--�������-->
                <li class="detailpage-info__item">
                  <h2 class="detailpage-info__title">
                    <%=service.getTitle() %>
                  </h2>
                </li>

                <!--�ŷ�����-->
                <li class="detailpage-info__item">
                  <h2 class="detailpage-info__addr">
                    <%=service.getPlace() %>
                  </h2>
                </li>

                <!--��¥-->
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

                <!--�����߰� ����-->
                <li class="detailpage-info__item">
                  <img
                    alt=""
                    src="img/status_reserved.png"
                    class="detailpage-info__reservationimge"
                  />
                  <!--������ ���� ���� ����-->
                  <span class="detailpage-info__priceinfo"><%=service.getPrice() %></span>
                </li>
              </ul>
            </div>

            <!-- �������� ��� -->
            <div class="detailpage-info_service">
              <h5 class="detailpage-info__servicename">���� ����</h5>

              <!-- ���߱� -->
              <hr class="detailpage-info__line" />

              <p class="detailpage-info__contents">
                <%=service.getDescription() %>
              </p>
            </div>

            <!-- �����ư -->
            <div class="detailpage-info__reservation">
              <button type="button" class="detailpage-info__reservationbtn">
                ������
              </button>
            </div>

            <!-- ��ǰ���� �������� -->
            <div class="detailpage-info__inquiry">
              <h5 class="detailpage-info__inquirys">���� ����</h5>
              <textarea class="detailpage-info__comment"></textarea>
            </div>

            <!-- ��ǰ���� ��� ��ư -->
            <div class="detailpage-info__inquirybtn">
              <button type="submit" class="detailpage-info__inquirybtns">���</button>
            </div>

            <hr class="detailpage-info__line" />


             <!-- ��� �ۼ� ����1 -->
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
                    alt="������ ����"
                    class="profile__image"
                  />

                  <img
                    src="img/bronze-badge.png"
                    alt="ȸ�� ���"
                    class="profile__badge"
                  />

                  <span class="profile__nickname">�����ʹ������</span>

                  <div class="profile__phone-number-wrap">
                    <i class="fas fa-phone-alt profile__phone-icon"></i>
                    <span class="profile__phone-number">010-1234-1234</span>
                  </div>
                </div>

                <div class="transaction-info">
                  <ul class="transaction-info__list">
                    <li class="transaction-info__item">
                      <span class="transaction-info__title">�ŷ��Ǽ�</span
                      ><br />
                      <span class="transaction-info__content">4</span>
                    </li>

                    <li class="transaction-info__item">
                      <span class="transaction-info__title">ȸ�����</span
                      ><br />
                      <span class="transaction-info__content">�����</span>
                    </li>

                    <li class="transaction-info__item">
                      <span class="transaction-info__title">����</span><br />
                      <span class="transaction-info__content">5.0</span>
                    </li>
                  </ul>
                </div>

                <div class="profile__introduction">
                  <h1 class="profile__introduction__title">�ڱ� �Ұ�</h1>

                  <p class="profile__introduction__content">
                    �ȳ��ϼ���~ ���� ���� ������ �ϰ� �ֽ��ϴ�. �ϰ� �ð��ֽø�
                    �����ϰڽ��ϴ� :) �ȳ��ϼ���~ ���� ���� ������ �ϰ�
                    �ֽ��ϴ�. �ϰ� �ð��ֽø� �����ϰڽ��ϴ� :)�ȳ��ϼ���~ ����
                    ���� ������ �ϰ� �ֽ��ϴ�. �ϰ� �ð��ֽø� �����ϰڽ��ϴ�
                    :)�ȳ��ϼ���~ ���� ���� ������ �ϰ� �ֽ��ϴ�. �ϰ�
                    �ð��ֽø� �����ϰڽ��ϴ� :)�ȳ��ϼ���~ ���� ���� ������
                    �ϰ� �ֽ��ϴ�. �ϰ� �ð��ֽø� �����ϰڽ��ϴ� :)�ȳ��ϼ���~
                    ���� ���� ������ �ϰ� �ֽ��ϴ�. �ϰ� �ð��ֽø�
                    �����ϰڽ��ϴ� :)�ȳ��ϼ���~ ���� ���� ������ �ϰ� �ֽ��ϴ�.
                    �ϰ� �ð��ֽø� �����ϰڽ��ϴ� :)�ȳ��ϼ���~ ���� ����
                    ������ �ϰ� �ֽ��ϴ�. �ϰ� �ð��ֽø� �����ϰڽ��ϴ�
                    :)�ȳ��ϼ���~ ���� ���� ������ �ϰ� �ֽ��ϴ�. �ϰ�
                    �ð��ֽø� �����ϰڽ��ϴ� :)�ȳ��ϼ���~ ���� ���� ������
                    �ϰ� �ֽ��ϴ�. �ϰ� �ð��ֽø� �����ϰڽ��ϴ� :)
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
                    �����Ͻðڽ��ϱ�?
                  </h1>

                  <p class="reservation-confirm__description-content">
                    Ȯ���� �����ø�
                    <span class="reservation-confirm__nickname">junjun</span
                    >�԰� ����˴ϴ�.<br />
                    ���� ä���� ���ؼ� �������ּ���.
                  </p>
                </div>

                <div class="reservation-confirm__buttons">
                  <button type="button" class="reservation-confirm__check">
                    Ȯ��
                  </button>

                  <button type="button" class="reservation-confirm__cancel">
                    ���
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
