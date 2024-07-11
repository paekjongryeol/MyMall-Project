<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section id="hero">
    <div id="heroCarousel" data-bs-interval="5000" class="carousel slide carousel-fade" data-bs-ride="carousel">

      <div class="carousel-inner" role="listbox">

        <!-- Slide 1 -->
        <div class="carousel-item active" style="background-image: url(/assets/img/backimg1.jpg);">
        </div>

        <!-- Slide 2 -->
        <div class="carousel-item" style="background-image: url(/assets/img/backimg2.jpg);">
          <div class="carousel-container">
          </div>
        </div>

        <!-- Slide 3 -->
        <div class="carousel-item" style="background-image: url(/assets/img/backimg3.jpg);">
          <div class="carousel-container">
          </div>
        </div>

      </div>

      <a class="carousel-control-prev" href="#heroCarousel" role="button" data-bs-slide="prev">
        <span class="carousel-control-prev-icon bx bx-left-arrow" aria-hidden="true"></span>
      </a>

      <a class="carousel-control-next" href="#heroCarousel" role="button" data-bs-slide="next">
        <span class="carousel-control-next-icon bx bx-right-arrow" aria-hidden="true"></span>
      </a>

      <ol class="carousel-indicators" id="hero-carousel-indicators"></ol>

    </div>
  </section><!-- End Hero -->
    
<main id="main">

   	  <!-- ======= Portfolio Section ======= -->
   <form id="mainform">
    <section class="portfolio">
      <div class="container">

        <div class="section-title" data-aos="fade-up">
          <h2> <strong>HOT ITEMS</strong></h2>
        </div>

        <div class="row" data-aos="fade-up" style='cursor:pointer;' id="hotItem" >
          <!-- 여기에 상품 정보를 추가합니다. -->
        </div>
      </div>
    </section>
    
    <!-- ======= Portfolio Section ======= -->
    <section id="portfolio" class="portfolio">
      <div class="container">

        <div class="row" data-aos="fade-up">
          <div class="col-lg-12 d-flex justify-content-center">
            <ul id="portfolio-flters">
              <li data-filter="*" class="filter-active">전체</li>
            </ul>
          </div>
        </div>

        <div class="row portfolio-container" style='cursor:pointer;' data-aos="fade-up" id="goodsItem">    

        </div>
      </div>
    </section><!-- End Portfolio Section -->
</form>
    

  </main><!-- End #main -->
 
 
  	
  <script>
  	function goodsView(cd){
  		location.href="/goods/view?goodsCd="+cd;
  	}
  	
  	function inGoodsItem() {
  	 	call_server(mainform, "/main/hotItem", goodsMain);
  		call_server(mainform, "/main/goodsCategory", goodsCategory);
  		
  	}
  	inGoodsItem();

  	function goodsMain(list) {  
  	  for (var i = 0; i < list.length; i++) {
  	    // 각 상품 정보를 생성하여 hotItem에 추가합니다.
  	    var item = '<div class="col-lg-3 col-md-6 portfolio-item" onclick="goodsView(\''+list[i].goodsCd+'\')">';
  	    item += '<img src="' + list[i].thumnailUrl + '" class="img-fluid" style="width:250px;height:200px;">';
  	    item += '<div>';
  	    item += '<h6>' + list[i].goodsName + '</h6>';
  	    item += '<p>' + list[i].sellPrice + '원</p>';
  	    item += '</div>';
  	    item += '</div>';

  	    $('#hotItem').append(item);
  	}
  	  
  	for (var i = 0; i < list.length; i++) {
  		var item = "<div class=\"col-lg-4 col-md-6 portfolio-item filter-" + list[i].ctCd + "\")\">";

	  	  	item += "<img src=\""+ list[i].thumnailUrl +"\" class=\"img-fluid\" alt=\"\">";
	  		item += "<div class=\"portfolio-info\">";
	  		item += "<h4>"+ list[i].goodsName +"</h4>";
	  		item += "<p>"+ list[i].sellPrice +"원</p>";
	  		item += "<a href=\"/assets/img/portfolio/portfolio-1.jpg\" data-gallery=\"portfolioGallery\" class=\"portfolio-lightbox preview-link\" title=\"App 1\"><i class=\"bx bx-plus\"></i></a>";
	  		item += "<a href=\"portfolio-details.html\" class=\"details-link\" title=\"More Details\"><i class=\"bx bx-link\"></i></a>";
	  		item += "</div>";
	  		item += "</div>";
	  	    
	  	    $('#goodsItem').append(item);
	  	  }
  	}
  	
  	function goodsCategory(list) {
  	    for (var i = 0; i < list.length; i++) {
  	        $('#portfolio-flters').append("<li data-filter=\".filter-"+list[i].ctCd+"\">"+list[i].ctName+"</li>");
  	    }
  	}
  </script>
    