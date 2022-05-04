const body = document.querySelector("body");


function addStarRadingEvent() {
  const starRatingFormCancel = document.querySelector(".star-rating-form__cancel");
  const modalStarRating = document.querySelector(".modal--star-rating");

  $(document).on("click",".btn__star",function(event){
    modalStarRating.style.display = "block";
    body.style.overflow = "hidden"
    const serviceId = event.target.parentElement.getAttribute("serviceid");
    document.querySelector(".star-rating-form__service").value = serviceId;
    
  });

  starRatingFormCancel.addEventListener("click", function() {
    modalStarRating.style.display = "none";
    body.style.overflowY = "scroll"
  })
}

addStarRadingEvent();
