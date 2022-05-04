const body = document.querySelector("body");


function addStarRadingEvent() {
  const starRatingFormCancel = document.querySelector(".star-rating-form__cancel");
  const modalStarRating = document.querySelector(".modal--star-rating");

  $(document).on("click",".btn__star",function(){
    modalStarRating.style.display = "block";
    body.style.overflow = "hidden"
  });

  starRatingFormCancel.addEventListener("click", function() {
    modalStarRating.style.display = "none";
    body.style.overflowY = "scroll"
  })
}

addStarRadingEvent();
