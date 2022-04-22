function setDetailImage(event){
    //document.getelmentbyid로 product-registration__imge일때 작동하는 조건
    if(document.getElementById("product-registration__imge")!=null){
      document.querySelector(".product-registration__imagspace").removeChild(document.getElementById("product-registration__imge"));
      //기본이미지를 지우고 등록된 이미지를 적용한다.
  }

      for(const image of event.target.files){
          const reader = new FileReader();
          
          reader.onload = function(event){
              const img = document.createElement("img");
              img.setAttribute("src", event.target.result);
              document.querySelector(".product-registration__imagspace").appendChild(img);
          };
          console.log(image);
          reader.readAsDataURL(image);
      }
       
  }

 