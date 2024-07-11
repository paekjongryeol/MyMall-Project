<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <main id="main">

	    
    <!-- ======= Portfolio Details Section ======= -->
    <form id="goodsinfo">
    <input type="hidden" id="hgoodsCd" name="goodsCd" value="${vo.goodsCd }">
    
    <section id="portfolio-details" class="portfolio-details">
      <div class="container">

        <div class="row gy-4">

          <div class="col-lg-8">
            <div class="portfolio-details-slider swiper">
              <div class="swiper-wrapper align-items-center" id="imgTable">


              </div>
              <div class="swiper-pagination"></div>
            </div>
          </div>

          <!-- HTML 코드 -->
			<div class="col-lg-4" id="contentTable">
			    <div class="portfolio-info">
			        <h3 id="goodsName"></h3>
			        <ul>
			            <li><strong>제조국</strong>: 한국</li>
			            <li><strong>정가</strong>: <span id="normalPrice"></span> 원</li>
			            <li><strong>판매가</strong>: <span id="sellPrice"></span> 원</li>
			        </ul>
			        수량<input type="button" value=" - " onclick="del();">
			        <input type="text" name="buyQty" value="1" size="3">
					<input type="button" value=" + " onclick="add();">
			        <button type="button" class="btn btn-info" onclick='onCart();'>장바구니</button>	
			    </div>
			    <div class="portfolio-description">
			        <h2>상품설명</h2>
			        <p id="content">
			            
			        </p>
			    </div>
			</div>

	
        </div>

      </div>
    </section><!-- End Portfolio Details Section -->
	</form>
  </main><!-- End #main -->
  <script>
  		
  		function onCart() {
  			call_server(goodsinfo, "/goods/cartUp", goodsCart);
  		}
  		
	 	function inItem() {
			call_server(goodsinfo, "/goods/content", goodsContent);
			call_server(goodsinfo, "/main/itemImg", goodsImg);
			
	 	}
	
	 	function goodsContent(vo) {
	        $('#goodsName').text(vo.goodsName);
	        $('#normalPrice').text(vo.normalPrice);
	        $('#sellPrice').text(vo.sellPrice);
	        $('#content').text(vo.content);
	    }
		
	 	function goodsImg(list) {
	 		console.log(list);
	        for (var i = 0; i < list.length; i++) {
	            var str = "<div class=\"swiper-slide\">";
	            str += "<img src=\"" + list[i].imgUrl + "\" alt=\"\">";
	            str += "</div>";

	            $('#imgTable').append(str);
	        }
	    }

	  	inItem();
	  
	  	function add() {
	  	    var hm = $('input[name="buyQty"]');
	  	    hm.val(parseInt(hm.val()) + 1); // 현재 값에 1을 더하여 설정
	  	}

	  	function del() {
	  	    var hm = $('input[name="buyQty"]');
	  	    if (parseInt(hm.val()) > 1) { // 현재 값이 1보다 크면
	  	        hm.val(parseInt(hm.val()) - 1); // 현재 값에서 1을 빼서 설정
	  	    }
	  	}
		
	  	function goodsCart(cnt) {
	  	    if (cnt > 0) {
	  	        alert("장비구니 저장");
	  	    } else {
	  	        alert("장바구니에 오류발생.");
	  	    }
	  	}

	</script>