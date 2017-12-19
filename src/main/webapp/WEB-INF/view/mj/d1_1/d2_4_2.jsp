<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="/resources/common/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="/resources/js/mj/common.js"></script>
<%
String d1 = request.getParameter("d1");
String d2 = request.getParameter("d2");
%>
<script type="text/javascript">
	var cnt = 1;
	var seq = '';
	var delArray = [];
    $(function() {
        //faq목록조회
        callAjaxJson('POST', '/lab/1_4/list', '', function (res) {
            var html = '';
            var option = '<option value="">선택하세요</option>';
            var data = res.context;
            if(isEmpty(data) !== ''){
				for(var i=0; i< data.length; i++){
				    html +=
                         '<tr data-no="'+data[i].FAQ_NO+'">'+
						'	<td>'+i+'</td>'+
						'		<td>'+
						'		<button class="blue-btn faqEdit">수정</button>'+
						'		<button type="button" class="faqDel">삭제</button>'+
						'		</td>'+
						'	</tr>';
					$("#d2_4list").replaceWith(html);
                    //셀렉트
                    option += '<option value="'+data[i].FAQ_NO+'">'+isEmpty(data[i].QUESTION)+'</option>';
				}
                $("#selFaq").empty().append(option);
			}
        });

        //선택박스
		$("#selFaq").change(function(){
		    var dataObj = {FAO_NO: $(this).val()};
            callAjaxJson('POST', '/lab/1_4/detail', dataObj, function(res){
                var data = res.context;
                var html = '';
                if(data != null){
                    for(var i=0; i< data.length; i++){
                        html += '<tr data-no="'+data[i].FILE_NO+'" >'+
                        '<th>파일첨부</th>'+
                        '   <td>'+
                        '   <input id="fileNm'+i+'" disabled="disabled"> <button type="button" class="red-btn file">파일첨부</button>'+
                        '   <input type="file" style="visibility: hidden" id="file'+i+'" data-no="'+i+'" />'+
                        '   <input type="hidden" id="fileUrl'+i+'" name="fileUrl" />'+
                        '   <button type="button" class="red-btn delBtn">삭제</button>'+
                        '   </td>'+
                        '   </tr>';

                    }
                    $("#fileList").replaceWith(html).find("tr").eq(0).attr("id", "fileList");
                }
            });
		});

        //수정
		$(document).on('click', '.faqEdit', function(){
            seq = $(this).data('seq');
            window.open("/mj/d1_1/d2_4_detail/page/", "edit", "width=900,height=900");
		});

        //삭제
        $(".faqDel").click(function(){
            var _this = $(this);
            var dataObj = {
                FAQ_NO: isEmpty(_this.data("no")),
                del_yn: 'Y'
            };

            callAjaxJson('POST', '/lab/1_4/update', dataObj, function(res){
                _this.parents("tr").remove();
            });
        });

        //규정추가
        $("#addInput").click(function () {
            var html = '<tr>' +
                '<th>규정명</th>' +
                '<td><input type="text" size="80"></td>' +
                '   </tr>' +
                '   <tr>' +
                '   <th>파일첨부</th>' +
                '   <td><input value="" id="fileNm' + cnt + '" disabled="disabled"> <button type="button" class="red-btn file">파일첨부</button> <input type="file" style="visibility: hidden" id="file' + cnt + '" data-no="' + cnt + '">' +
                '<input type="hidden" id="fileUrl' + cnt + '" name="fileUrl" /></td>' +
                '</tr>';
            cnt++;

            $("#fileTB").append(html);
        });

        //파일 업로드 버튼
        $(document).on('click', 'button.file', function () {
            $(this).next().trigger('click');

        });

        //파일 업로드
        $(document).on('change', 'input[type=file]', function () {
            uploadFile($(this).data("no"));
        });

        //저장
        $("#saveBtn").click(function () {
            var addArray = [];
            var modArray = [];
			$("input[name=fileUrl]").each(function () {
                var obj = {};
                obj.FILE_NM = $(this).val();
                obj.FILE_URL = $(this).val().split('_')[1];

                if($(this).hasClass('edit')){
                    obj.FILE_NO = $(this).data("fileNo");
                    modArray.push(obj);
				} else {
                    addArray.push(obj);
				}
            });

            var dataObj = {
                FAQ_NO: ''
                , ADD: addArray
                , MODI: modArray
                , DEL: delArray
            };

            callAjaxJson('POST', '/lab/1_4/insert', dataObj, function (res) {
                window.location.reload();
            });

        });

        //삭제
		$(document).on('click', '.delBtn', function(){
		    var fileNo = $(this).parents("tr").data("no");
            if(fileNo != ''){
                delArray.push(fileNo);
            }
            $(this).parents().remove();
		});
    });

    function uploadFile(no){

        var formData = new FormData();
        formData.append('filename_0',$("#file"+no)[0].files[0]);
        console.log(formData)
w
        $.ajax({
            type: 'POST'
            , async:false
            , url: '/lab/fileUpload'
            , data: formData
            , processData: false
            , contentType: false
            , success: function (res) {
                ajax_yn = true;
                var res = res.context;
                if(isEmpty(res.file_path) === ''){
                    alert("파일 업로드에 실패하였습니다.");
                } else {
                    $("#fileUrl"+no).val(res.file_path);
                    $("#fileNm"+no).val(res.file_path.split('_')[1]);
				}
            }
        });
	}
</script>
<%--<jsp:include page="/jsp/lab/manager/include/header.jsp"></jsp:include>--%>
<!-- 2단 메뉴 -->
<div class="aside_second">
	<a href="/lab/manager/d1_1/d2_1.do?d1=1&d2=1"<%if("1".equals(d2)){ %> class="on"<%} %>>인사말</a>
	<a href="/lab/manager/d1_1/d2_2.do?d1=1&d2=2"<%if("2".equals(d2)){ %> class="on"<%} %>>조직도</a>
	<a href="/lab/manager/d1_1/d2_3.do?d1=1&d2=3"<%if("3".equals(d2)){ %> class="on"<%} %>>전략과 목표</a>
	<a href="/lab/manager/d1_1/d2_4.do?d1=1&d2=4"<%if("4".equals(d2)){ %> class="on"<%} %>>연구자 FAQ</a>
</div>
<!-- 본문 -->
<div class="view-contents">
	<div class="top-tit">
		<h1><i class="fa fa-pencil-square-o" aria-hidden="true"></i>연구자 FAQ</h1>
		<ul class="nav-tab">
			<li>홈</li>
			<li>소개</li>
			<li>연구자 FAQ</li>
		</ul>
	</div>
	<!-- 3단 메뉴 -->
	<div class="tab-menu">
		<ul>
			<li><a href="" alt="/admin/info/04.html">FAQ 일반등록</a></li>
			<li><a href="" alt="/admin/info/04-1.html">FAQ 규정파일 세팅</a></li>
		</ul>
		<!--a class="plus-cate2"><i class="fa fa-plus" aria-hidden="true"></i> 카테고리 추가</a-->
	</div>

	<div class="view-area">

		<div class="article">
			<h2><i class="fa fa-cogs" aria-hidden="true"></i> FAQ 규정파일 세팅</h2>
			<table id="fileTB">
				<colgroup>
					<col width="150">
					<col width="*">
				</colgroup>
				<tr>
					<th>노출할 FAQ 항목</th>
					<td>
						<select name="" id="selFaq">
							<option value="">선택하세요</option>
						</select>
						<span>* 규정파일 항목이 노출될 FAQ항목을 선택하세요.</span></td>
				</tr>
				<tr id="">
					<th>규정명</th>
					<td><input type="text" size="80"></td>
				</tr>
				<tr id="fileList">
					<th>파일첨부</th>
					<td>
						<input id="fileNm0" value="" disabled="disabled"> <button type="button" class="red-btn file">파일첨부</button>
						<input type="file" style="visibility: hidden" id="file0" name="file[]" data-no='0' />
						<input type="hidden" id="fileUrl0" name="fileUrl" />
						<button type="button" class="red-btn delBtn">삭제</button>
					</td>
				</tr>

			</table>
			<div class="btn-area">
				<button type="button" id="addInput" class="blue-btn">규정추가</button>
				<button type="button" id="saveBtn" class="red-btn">적용하기</button>
			</div>
		</div>
		<div class="article">
			<table class="center">

				<tr>
					<th>FAQ 번호</th>
					<th>관리</th>
				</tr>
				<tr id="d2_4list">
					<td colspan="2"></td>
				</tr>
			</table>
		</div>

	</div>
</div>
<%--<jsp:include page="/jsp/lab/manager/include/footer.jsp"></jsp:include>--%>