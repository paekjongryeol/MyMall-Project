<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
   <title>장바구니</title>
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
        input[type="checkbox"] {
    width: 1rem;
    height: 1rem;
    border-radius: 50%;
    border: 1px solid #999;
    appearance: none;
    cursor: pointer;
    transition: background 0.2s;
  }

  input[type="checkbox"]:checked {
    background: #32e732;
    border: none;
  }
    </style>
</head>
<body>
    <main class="container">
        <section id="portfolio-details" class="portfolio-details">
            <h2>주문하기</h2>
            <form id="cartOrderform">
                <input type="hidden" id="huserId" name="userId">
                <input type="hidden" id="hgoodCd" name="goodsCd">
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
                <div class="col-lg-4" >
                <h5>주문자정보</h5>
			    <div class="user-info" id="userTable">
                	<ul>
			            <li><strong>성명</strong>: <span id="userName"></span></li>
			            <li><strong>연락처</strong>: <span id="phone"></span></li>
			            <li><strong>주소</strong>: <span id="addr"></span></li>
			        </ul>        
                  </div>
				</div>
				<div class="col-lg-4" >
				   <div>
					    <h5 style="display: inline;">수취인정보</h5> 주문자정보와동일
					    <input type="checkbox" id="check" onclick="setValue()">
					    <label for="check"></label>
					</div>
				    <div class="receive-info" id="receiveTable">
				        <ul>
				            <li><strong>성명</strong>: <input type="text" id="receiveName" name="receiveName"></li>
				            <li><strong>연락처</strong>: <input type="text" id="receivePhone" name="receivePhone"></li>
				            <li><strong>주소</strong>: <input type="text" id="addrDtl" name="addr"></li>
				        </ul>        
				    </div>
				</div>
				<div class="col-lg-4" >
				    <h5>결제정보</h5>
				    <div class="card-info" id="contentTable">
				        <ul>
				            <li><strong>결제수단</strong>: 
							    <label for="online">온라인</label>
							    <input type="radio"  name="payment" value="온라인">
							    
							    <label for="card">카드결제</label>
							    <input type="radio"  name="payment" value="카드결제">
							    
							    <label for="kakao">카카오페이</label>
							    <input type="radio"  name="payment" value="카카오페이">
							</li>
				            <li><strong>결제금액</strong>: <span id="sellPrice"></span>원</li>
				        </ul>        
				    </div>
				    <div>
				    <button type="button" class="btn btn-info" onclick="cartOrderOn();" style="float: right;">주문하기</button>
				    </div>
				</div>		
            </form>
        </section><!-- End Portfolio Details Section -->
    </main><!-- End .container -->
</body>
</html>
 <script>
    function inCart() {
        call_server(cartOrderform, "/cart/orderlist", cartList);
    }

    var orderPrice=0;
    function cartList(list) {
        for (var i = 0; i < list.length; i++) {
            var str = "<tr>";
            str += "<td colspan='2'><img src='" + list[i].thumnailUrl + "' alt='상품이미지'></td>";
            str += "<td>" + list[i].goodsName + "</td>";
            str += "<td>주문수량 : " + list[i].buyQty + "</td>"; // 수량 인풋
            str += "<td>개당 " + list[i].sellPrice + " 원</td>";
            str += "</tr>";
            orderPrice += Number(list[i].buyQty)*Number(list[i].sellPrice);
            $('#cartTable > tbody').append(str);
        }
        // 주문자 정보를 가져옵니다.
        $('#sellPrice').text(orderPrice);
        call_server(cartOrderform, "/cart/orderUser", userInfo);
    }
	
    function setValue() {
        var checkbox = document.getElementById("check");
        var label = document.querySelector("label[for='check']");
        var receiveNameInput = document.getElementById("receiveName");
        var receivePhoneInput = document.getElementById("receivePhone");
        var addrDtlInput = document.getElementById("addrDtl");
        
        if (checkbox.checked) {
            label.textContent = "선택됨";
            receiveNameInput.value = $('#userName').text();
            receivePhoneInput.value = $('#phone').text();
            addrDtlInput.value = $('#addr').text();
        } else {
            label.textContent = "";
            receiveNameInput.value = "";
            receivePhoneInput.value = "";
            addrDtlInput.value = "";
        }
    }

    function userInfo(vo) {
        $('#userName').text(vo.userName);
        $('#phone').text(vo.phone);
        $('#addr').text(vo.addr);

        // 수취인 정보를 가져옵니다.
    }
    
    function cartOrderOn() {
    	call_server(cartOrderform, "/cart/orderOn", orderOn);
    }
    
    function orderOn(cnt) {
    	if (cnt > 0) {
  	        alert("주문완료 되었습니다.");
  	      location.href="/main/mall";
  	    } else {
  	        alert("주문 오류발생.");
  	    }
  	}
    inCart();
</script>
