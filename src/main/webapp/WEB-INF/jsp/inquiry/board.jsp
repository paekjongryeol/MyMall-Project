<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
  <!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>고객문의</title>
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
        <h2>고객문의</h2>
        <form id="boardform">
            <input type="hidden" id="huserId" name="userId">
            <input type="hidden" id="hboardSeq" name="boardSeq">
            <input type="hidden" id="currentPage" name="currentPage">
            <div class="row mb-4">
                <label for="inputText" class="col-sm-1 col-form-label">답변상태</label>
                <div class="col-sm-2">
                    <select class="form-select" name="replyYn">
                        <option value="">전체</option>
                        <option value="Y">Y</option>
                        <option value="N">N</option>
                    </select>
                </div>
            </div>
            <button type="button" class="btn btn-info" onclick="inquiryMod();" style="float: right;">문의하기</button>

            <table class="cart__list" id="boardTable">
                <thead>
                <tr>
                    <th colspan="2">작성자</th>
                    <th>문의유형</th>
                    <th>제목</th>
                    <th>답변상태</th>
                    <th>작성일</th>
                </tr>
                </thead>
                <tbody>
                <!-- 여기에 문의글 목록이 동적으로 추가될 예정 -->
                </tbody>
            </table>
            <nav aria-label="Page navigation example">
                <ul class="pagination" id="boardPaging"></ul>
            </nav><!-- End Pagination with icons -->
        </form>
    </section><!-- End Portfolio Details Section -->
</main><!-- End .container -->

<form id="modalform">
    <input type="hidden" id="userId" name="userId">
    <input type="hidden" id="boardSeq" name="boardSeq">
<div class="modal fade" id="inquiryInfo" tabindex="-1">
    <div class="modal-dialog modal-xl modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">고객문의</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <table class="table table-hover" id="memberTable">
                    <tbody>
                    <tr>
                        <th scope="row">제목</th>
                        <td><input type="text" id="title" name="title"></td>
                    </tr>
                    <tr>
                        <th scope="row">유형</th>
                        <td><input type="text" id="boardType" name="boardType"></td>
                    </tr>
                    <tr id="userIdRow">
                        <th scope="row">회원ID</th>
                        <td><input type="text" id="userId" name="userId"></td>
                    </tr>
                    <tr id="regDtRow">
                        <th scope="row">문의일</th>
                        <td><input type="text" id="regDt" name="regDt"></td>
                    </tr>
                    <tr>
                        <th scope="row">첨부파일</th>
                        <td><input type="text" id="attchFile" name="attchFile"></td>
                    </tr>
                    <tr>
                        <th scope="row">문의내용</th>
                        <td><input type="text" id="content" name="content"></td>
                    </tr>
					<tr id="replyContentRow">
					    <th scope="row">답변내용</th>
					    <td><input type="text" id="replyContent" name="replyContent" readonly></td>
					</tr>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button type="button" id="btnInsert" class="btn btn-info" onclick="inquiryIn();" style="float: right;">등록</button>
            </div>
        </div>
    </div>
</div><!-- End Vertically centered Modal-->
</form>

<script src="/assets/js/paging.js"></script>
<script>
    function inboard(no) {
        if (no === undefined) {
            $('#currentPage').val(1);
        } else {
            $('#currentPage').val(no);
        }
        call_server(boardform, "/search/board", searchBoard)
    }

    function searchBoard(vo) {
        list = vo.inquirylist;
        $('#boardTable > tbody').empty(); // 테이블 내용 초기화
        for (var i = 0; i < list.length; i++) {
            var str = "<tr onclick=\"boardDetail('" + list[i].userId + "','" + list[i].boardSeq + "');\" style=\"cursor:pointer;\">";
            str += "<th scope=\"row\">" + ((Number(vo.currentPage) - 1) * vo.countPerPage + (i + 1)) + "</th>";
            str += "<td>" + list[i].userId + "</td>";
            str += "<td>" + list[i].boardType + "</td>";;
            str += "<td>" + list[i].title + "</td>";
            str += "<td>" + list[i].replyYn + "</td>";
            str += "<td>" + list[i].regDt + "</td>";
            str += "</tr>";
            $('#boardTable > tbody').append(str);
        }
        setPaging(boardPaging, vo.startPage, vo.endPage, 'inboard');
    }

    function boardDetail(id, seq) {
        $('#userId').val(id);
        $('#boardSeq').val(seq);
        call_server(modalform, '/inquiry/userdetail', getinquiryDetail);
    }

    function getinquiryDetail(vo) {
        $('#title').val(vo.title);
        $('#boardType').val(vo.boardType);
        $('#userId').val(vo.userId);
        $('#regDt').val(vo.regDt);
        $('#attchFile').val(vo.attchFile);
        $('#content').val(vo.content);
        $('#replyContent').val(vo.replyContent);

        $('#btnInsert').hide();
        // 모달 창 열기
        $('#inquiryInfo').modal('show');
    }

    function inquiryMod() {
        $('#btnInsert').show();
        resetForm();
        $('#inquiryInfo').modal('show');
    }

    function resetForm() {
        $('#title').val('');
        $('#boardType').val('');
        $('#userId').val('');
        $('#regDt').val('');
        $('#attchFile').val('');
        $('#content').val('');
        $('#replyContent').val('');;
        $('#regDtRow').hide();
        $('#userIdRow').hide();
        $('#replyContentRow').hide();	//숨기기
    }
    
    function inquiryIn() {
        call_server(modalform, '/inquiry/insertInfo', updateAram);
    }

    function updateAram(cnt) {
        if (cnt > 0) {
            alert('문의가 등록되었습니다.');
            $('#inquiryInfo').modal('hide');
            resetForm();
        } else {
            alert("오류발생하였습니다.");
        }
    }

    inboard();
</script>
</body>
</html>
