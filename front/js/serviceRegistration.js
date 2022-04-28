function setDetailImage(event){
    //document.getelmentbyid로 service-registration__imge일때 작동하는 조건
    if(document.querySelector(".service-registration__imge")!=null){
      const gibonimge = document.querySelector(".service-registration__imge"); 
      gibonimge.parentNode.removeChild(gibonimge);
      //기본이미지를 지우고 등록된 이미지를 적용한다.
  }

   


      for(const image of event.target.files){
          const reader = new FileReader();
          
          reader.onload = function(event){
              const img = document.createElement("img");
              img.setAttribute("src", event.target.result);
              //document.querySelector(".slick-track").appendChild(img);
              $('.service-registration__imagspace').slick('slickAdd', img);
              //document.querySelector(".service-registration__imagspace").appendChild(img);
           
          };
          console.log(image);
          reader.readAsDataURL(image);
      }
       
  }

 