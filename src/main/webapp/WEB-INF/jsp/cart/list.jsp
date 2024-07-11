<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
   <title>장바구니</title>
    <head>
    <style>
        table {
            border-top: solid 1.5px black;
            border-collapse: collapse;
            width: 100%;
            font-size: 14px;
        }

        thead {
            text-align: center;
            font-weight: bold;
        }

        tbody {
            font-size: 12px;
        }

        td {
            padding: 15px 0px;
            border-bottom: 1px solid lightgrey;
        }
    </style>
</head>
<body>
    <main class="container">
        <section id="portfolio-details" class="portfolio-details">
            <h2>장바구니</h2>
            <form id="cartform">
                <input type="hidden" id="huserId" name="userId">
                <input type="hidden" id="hgoodCd" name="goodsCd">
                <button type="button" class="btn btn-info" onclick="goosdOrder();" style="float: right;">주문하기</button>


                <table class="cart__list" id="cartTable">
                    <thead>
                        <tr>
                            <th colspan="2">상품정보</th>
                            <th>상품이름</th>
                            <th>옵션</th>
                            <th>상품금액</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- 여기에 장바구니 상품 목록이 동적으로 추가될 예정 -->
                    </tbody>
                </table>
            </form>
        </section><!-- End Portfolio Details Section -->
    </main><!-- End .container -->
</body>
</html>
  <script>
  function inCart() {
	  
	    call_server(cartform, "/cart/orderlist", cartList);
	}

	function cartList(list) {

	    for (var i = 0; i < list.length; i++) {
	        var str = "<tr>";
	        str += "<td colspan='2'><img src='" + list[i].thumnailUrl + "' alt='상품이미지'></td>";
	        str += "<td>" + list[i].goodsName + "</td>";
	        str += "<td><input type='number' class='qtyInput' name='buyList[" + i + "]' value='" + list[i].buyQty + "' min='1'>개</td>"; // 수량 인풋
	        str += "<td>개당 " + list[i].sellPrice + " 원</td>";
	        str += "<td><button type='button' class='btn btn-danger' onclick=\"removeItem('"+list[i].goodsCd+"')\">삭제</button></td>";
	        str += "</tr>";

	        $('#cartTable > tbody').append(str);
	    }

	    // 수량 변경 시 이벤트 처리
	    $('.qtyInput').on('change', function() {
	        // 체크박스가 속한 tr을 찾아서 그 인덱스를 가져옴
	        var index = $(this).closest('tr').index();
	        // 변경된 수량을 가져와서 buyQty에 대입
	        list[index].buyQty = $(this).val();
	    });
	}

	function removeItem(cd) {
		$('#hgoodCd').val(cd);
	    call_server(cartform, "/cart/deInfo", cartDelete);
	}


	function goosdOrder(id) {
		location.href="/cart/order";
	}
	
	function cartDelete(cnt) {
  	    if (cnt > 0) {
  	        alert("장비구니 삭제");
  	      location.reload();
  	    } else {
  	        alert("장바구니에 오류발생.");
  	    }
  	}
	inCart();
  </script>