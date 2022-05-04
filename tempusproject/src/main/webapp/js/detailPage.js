const body = document.querySelector("body");

function addReservationConfirmModalEvent() {
  if(document.querySelector(".detailpage-info__basicbtn") != null){
  const detailPageInfoReservationBtn = document.querySelector(".detailpage-info__basicbtn");
  const reservationConfirmCancel = document.querySelector(".reservation-confirm__cancel");
  const modalReservationConfirm = document.querySelector(".modal--reservation-confirm");
 
  detailPageInfoReservationBtn.addEventListener("click", function() {
    modalReservationConfirm.style.display = "block";
    body.style.overflow = "hidden"
     
  });
  
  reservationConfirmCancel.addEventListener("click", function() {
    modalReservationConfirm.style.display = "none";
    body.style.overflowY = "scroll"
  });
  }
}

function addProfileModalEvent() {
  const detailPagePublisherInfo = document.querySelector(".detailpage-publisher-info");
  const profileCancel = document.querySelector(".profile-cancel");
  const modalProfile = document.querySelector(".modal--profile");

  detailPagePublisherInfo.addEventListener("click", function() {
    modalProfile.style.display = "block";
    body.style.overflow = "hidden"
  });
  
  profileCancel.addEventListener("click", function() {
    modalProfile.style.display = "none";
    body.style.overflowY = "scroll"
  });
}

addReservationConfirmModalEvent();
addProfileModalEvent();
