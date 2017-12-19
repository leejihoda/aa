<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
    $(function(){
        var cate = '';
        //저장
        $("#saveBtn").click(function(){
            var _this = $(this);
            var dataObj = {
                D2: isEmpty($("#boardType").val()),
                CATE_NO: isEmpty(cate),
                INFO: isEmpty($("input[name=info]").val()),
                CONTENT: $("input[name=content]"),
                EFFECT: $("input[name=effect]"),
                FILE1: $("input[name=fileUrl]").eq(0).val(),
                FILE2: $("input[name=fileUrl]").eq(1).val(),
                FILE3: $("input[name=fileUrl]").eq(2).val(),
                FILE4: $("input[name=fileUrl]").eq(3).val(),
                FILE5: $("input[name=fileUrl]").eq(4).val(),
                FILE6: $("input[name=fileUrl]").eq(5).val(),
                FILE7: $("input[name=fileUrl]").eq(6).val(),
                FILE8: $("input[name=fileUrl]").eq(7).val(),
                FILE9: $("input[name=fileUrl]").eq(8).val(),
                FILE10: $("input[name=fileUrl]").eq(9).val(),
                RESEARCH_CMPN: $("input[name=research_cmpn]"),
                TASK_NM: $("input[name=task_nm]"),
                RESEARCH_MNGR: $("input[name=research_mngr]"),
                SUBJECTIVE_CMPN: $("input[name=subjectice_cmpn]"),
                FIELD: $("input[name=field]"),
                MEMO: $("input[name=memo]"),
                RESEARCH_SMRY: $("input[name=research_smry]"),
                ETC: $("input[name=etc]"),
                FILE_URL: $("input[name=fileUrl]"),
                DEL_GB: 'N'
            };

            callAjaxJson('POST', '/lab/2_2/insert', dataObj, function(res){
                window.location.reload();
            });
        });
    });
</script>
<div class="article">
	<h2><i class="fa fa-cogs" aria-hidden="true"></i> 컨텐츠 관리[사업목적 및 구성]</h2>
	<table>
		<colgroup>
			<col width="150">
			<col width="*">
		</colgroup>
		<tr>
			<th>사업목적</th>
			<td>
				<textarea style="height:300px;" id="info"></textarea>


			</td>
		</tr>
		<tr>
			<th>사업내용</th>
			<td>
				<textarea style="height:300px;" id="content" ></textarea>


			</td>
		</tr>
		<tr>
			<th>기대효과</th>
			<td>
				<textarea style="height:300px;" id="effect"></textarea>


			</td>
		</tr>
		<tr>
			<th id="docTH" rowspan="2">공고문 첨부항목</th>
			<td><input value="" disabled="disabled"> <button type="submit" class="red-btn file">파일첨부</button></td>
		</tr>
		<tr>

			<td><input value="" disabled="disabled"> <button type="submit" class="red-btn file">파일첨부</button></td>
		</tr>

	</table>
</div>

<div class="article">
	<h2><i class="fa fa-cogs" aria-hidden="true"></i> 컨텐츠 관리[지원과제목록]</h2>
	<table>
		<colgroup>
			<col width="120">
			<col width="*">
		</colgroup>
		<tbody>
		<tr>
			<th>연구기관</th>
			<td><input type="text" size="20" id="RESEACH_CMPN"></td>
		</tr>
		<tr>
			<th>과제명</th>
			<td><input type="text" size="40" id="TASK_NM"></td>
		</tr>
		<tr>
			<th>연구책임자</th>
			<td><input type="text" size="20" id="RESEARCH_MNGR"></td>
		</tr>
		<tr>
			<th>주관기간</th>
			<td><input type="text" size="20" id="SUBJECTIVE_CMPN"></td>
		</tr>
		<tr>
			<th>분야</th>
			<td><input type="text" size="20" id="FIELD"></td>
		</tr>
		<tr>
			<th>비고</th>
			<td><input type="text" size="20" id="MEMO"></td>
		</tr>

		</tbody></table>
	<h2>
		<i class="fa fa-cogs" aria-hidden="true"></i> 컨텐츠 관리[지원과제내용]</h2>
	<table>
		<colgroup>
			<col width="120">
			<col width="*">
		</colgroup>
		<tbody><tr>
			<th>연구요약</th>
			<td><textarea style="height:300px;" id="RESEARCH_SMRY"></textarea></td>
		</tr>
		<tr>
			<th>기타사항</th>
			<td><textarea style="height:300px;" id="ETC"></textarea></td>
		</tr>
		<tr>
			<th>사진등록</th>
			<td><input value="" disabled="disabled" id="imgNm">
				<button type="submit" class="red-btn file">파일첨부</button>
				<input type="file" id="file1" style="visibility: hidden" />
				<input type="hidden" id="fileUrl" />
			</td>
		</tr>

		</tbody></table>
	<div class="btn-area">
		<button type="button" id="saveBtn" class="red-btn">등록하기</button>
	</div>
</div>