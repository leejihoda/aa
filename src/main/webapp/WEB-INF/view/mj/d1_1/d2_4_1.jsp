<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="/resources/common/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="/resources/js/mj/common.js"></script>
<%
String d1 = request.getParameter("d1");
String d2 = request.getParameter("d2");
%>
<script type="text/javascript">
var seq = '';
$(function(){
	//목록조회
    callAjaxJson('POST', '/lab/1_4/list', '', function (res) {
        var html = '';
        var data = res.context;
        if(isEmpty(data) !== ''){
            for(var i=0; i< data.length; i++){
                var answer = isEmpty(data[i].ANSWER);
                if(answer !== '') answer = removeHtml(answer);

				html += '<tr id="d2_4list" data-no="'+data[i].FAQ_NO+'">'+
					'		<td>'+i+'</td>'+
					'		<td>'+isEmpty(data[i].QUESTION)+'</td>'+
					'	<td>'+answer+'</td>'+
					'	<td>'+
					'	<button class="blue-btn faqEdit">수정</button>'+
                    '		<button type="button" class="faqDel">삭제</button>'+
					'		</td>'+
					'	</tr>';
                $("#d2_4list").replaceWith(html);
            }
        }
    });

    //저장
    $("#saveBtn").click(function(){
        var _this = $(this);
        var dataObj = {
            QUESTION: '',
            ANSWER: '',
			DEL_GB: 'N'
        };
        var url = '/lab/1_4/insert';

        callAjaxJson('POST', url, JSON.stringify(dataObj), function(res){
            $("input, textarea").val("");
        });
    });

	//삭제
	$(".faqDel").click(function(){
	    var _this = $(this);
        var dataObj = {
            FAQ_NO: _this.data("no"),
            del_yn: 'Y'
        };

		callAjaxJson('POST', '/lab/1_4/update', dataObj, function(res){
			_this.parents("tr").remove();
		});
	});

    //수정팝업
	$(document).on('click', '.faqEdit', function(){
        seq = $(this).parents("tr").data('no');
        window.open("/mj/d1_1/d2_4_detail/page/", "edit", "width=900,height=900");
	});
});
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
			<h2><i class="fa fa-cogs" aria-hidden="true"></i> 컨텐츠 관리[FAQ 등록]</h2>
			<table>
				<colgroup>
					<col width="120">
					<col width="*">
				</colgroup>
				<tr>
					<th>질문</th>
					<td><input type="text" size="80" name="qustion"></td>
				</tr>
				<tr>
					<th>답변</th>
					<td><textarea name="answer" style="height:100px;"></textarea></td>
				</tr>


			</table>
			<div class="btn-area">
				<button type="button" id="saveBtn" class="red-btn">확인</button>
			</div>
		</div>

		<div class="article">
			<table class="center">
				<col width="120"/>
				<tr>
					<th>노출순서</th>
					<th>질문내용</th>
					<th>답변내용</th>
					<th>관리</th>
				</tr>
				<tr id="d2_4list">
					<td colspan="4"></td>
				</tr>
			</table>
		</div>
	</div>
</div>
<%--<jsp:include page="/jsp/lab/manager/include/footer.jsp"></jsp:include>--%>