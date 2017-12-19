<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
	var seq = '';
    $(function(){
        //목록조회
		if($("#boardType").val() !== 2) {
            var dataObj = {
                D2: Number($("#boardType").val())
            };
            getList(dataObj);
		} else {
		    //카테고리 조회
            callAjaxJson('POST', '/lab/2_2/cate/list', dataObj, function(res){
                var html = '';
                var data = res.context;
                var category = '';
                if(isEmpty(data) !== '') {
                    for(var i=0; i< data.length; i++){ //컬럼명
                        if(i === 0) category = data[i].IDX;
                        html += '<li data="'+data[i].IDX+'"><a href="#" >'+data[i].CATE_NAME+'</a></li>';
                    }
                    $("#categoryUl").empty().append(html);
                }
				//목록조회
                var dataObj = {
                    D2: Number($("#boardType").val()),
                    CATEGORY_NO: category
                };
                getList(dataObj);
            });
		}

        //수정
        $(document).on('click', '.editBtn', function(){
            seq = $(this).parents("tr").data('no');
            window.open("/mj/d1_2/d2_detail/page/", "edit", "width=900,height=900");
        });

        //삭제
        $(document).on('click', '.delBtn', function(){
            var _this = $(this);
            var dataObj = {
                BSNS_NO: isEmpty(_this.parents("tr").data('no')),
                del_yn: 'Y'
            };

            callAjaxJson('POST', '/lab/2_2/update', dataObj, function(res){
                _this.parents("tr").remove();
            });
        });
    });

    function getList(dataObj){
        callAjaxJson('POST', '/lab/1_4/list', dataObj, function(res){
            var html = '';
            var data = res.context;
            if(isEmpty(data) !== '') {
                for(var i=0; i< data.length; i++){
                    html = ''
                    '<tr id="d2_list" data-no='+data[i].BSNS_NO+'>'+
                    '	<td>'+i+'</td>'+
                    '	<td>'+isEmpty(data[i].RESERCH_CMPN)+'</td>'+
                    '		<td>'+isEmpty(data[i].TASK_NM)+'</td>'+
                    '	<td>'+isEmpty(data[i].RESERCH_MNGR)+'</td>'+
                    '	<td>'+isEmpty(data[i].SUBJECTIVE_CMPN)+'</td>'+
                    '	<td>+isEmpty(data[i].FIELD)+</td>'+
                    '	<td>'+isEmpty(data[i].MEMO)+'</td>'+
                    '	<td>'+
                    '		<button type="button" class="blue-btn">수정</button>'+
                    '		<button type="button" class="delBtn">삭제</button>'+
                    '	</td>'+
                    '</tr>';
                }
            }

            $("#d2_list").replaceWith(html).find("tr").eq(0).attr("id", "d2_list");
        });
	}
</script>

<div class="article">
	<table class="center">
		<tbody>
		<tr>
			<th>노출순서</th>
			<th>연구기관</th>
			<th>과제명</th>
			<th>연구책임자</th>
			<th>주관기관</th>
			<th>분야</th>
			<th>비고</th>
			<th>관리</th>
		</tr>
		<tr id="d2_list">
			<td colspan="8">1</td>
			<td>공동연구과제</td>
			<td>장서각소장 한글필사본 자료역주연구</td>
			<td>황문환</td>
			<td>한국학중앙연구원</td>
			<td>인문학</td>
			<td>-</td>
			<td>
				<button class="blue-btn editBtn">수정</button>
				<button>삭제</button>
			</td>

		</tr>
		</tbody>
	</table>
</div>
