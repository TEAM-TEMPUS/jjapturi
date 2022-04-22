const body = document.querySelector("body");
const detailPageInfoReservationBtn = document.querySelector(".detailpage-info__reservationbtn");
const reservationConfirmCancel = document.querySelector(".reservation-confirm__cancel");
const modalReservationConfirm = document.querySelector(".modal--reservation-confirm");

detailPageInfoReservationBtn.addEventListener("click", function() {
  modalReservationConfirm.style.display = "block";
  body.style.overflow = "hidden"
});

reservationConfirmCancel.addEventListener("click", function() {
  modalReservationConfirm.style.display = "none";
  body.style.overflowY = "scroll"
})

