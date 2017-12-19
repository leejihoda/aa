<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="/resources/common/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="/resources/js/mj/common.js"></script>
<script type="text/javascript">
    $(function(){
        var seq = opener.seq;
        if(seq != ''){ //상세
            var dataObj = {FAQ_NO: seq};
            callAjaxJson('POST', '/lab/1_4/detail', dataObj, function(res){
                var data = res.context;
                if(isEmpty(data) !== ''){
                    $("input[name=qustion]").val(data.QUESTION);
                    $("input[name=answer]").val(data.ANSWER);
                    $("input[name=faq_no]").val(data.FAQ_NO);
				}
            });
            opener.seq = '';
		}
        //저장
        $("#saveBtn").click(function(){
            var _this = $(this);
            var dataObj = {
                FAQ_NO: isEmpty($("input[name=faq_no]").val()),
                QUESTION: $("input[name=qustion]"),
                ANSWER: $("input[name=answer]"),
                DEL_GB: 'N'
            };
            var url = '/lab/1_4/insert';
            if(isEmpty($("input[name=faq_no]").val()) !== '') {
                url = '/lab/1_4/update';
            }
            callAjaxJson('POST', url, dataObj, function(res){
				$("input, textarea").val("");
            });
        });
    });
</script>
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
	<input type="hidden" name="faq_no" value=""/>
	<div class="btn-area">
		<button type="button" id="saveBtn" class="red-btn">확인</button>
	</div>
</div>