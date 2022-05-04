const body = document.querySelector("body");


function addStarRatingEvent() {
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

addStarRatingEvent();

$(document).on("click",".btn__cancle",function(event){
  const serviceId = event.target.parentElement.getAttribute("serviceid");

  $.ajax({
    
    type:"post",
    dataType:"html",
    url:"crud/service/statusChange.jsp",
    data:{"status":"basic", "serviceId":serviceId},
    success:function(){
      location.reload();
    }
  });
  
});