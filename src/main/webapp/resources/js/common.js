var tableAttr = {tableAttr: 'class="table table-bordered table-hover table-striped" style="text-align: center;"'};
var noneData = {string: '데이터가 없습니다.', addAttr: 'align="center"'};

$(document).ready(function () {
    //스킨
    $('body').addClass('hold-transition sidebar-mini skin-blue');
});

/**
 * alertModal popup
 * @param type
 * @param text
 * @param onfunc
 * @param title
 */
function alertModal(type, text, onfunc, title ){
    var modalTitle = '안내';
    if(title !== undefined){
        modalTitle = title;
    }
    var html = '';
    html += '<div class="modal-dialog">';
    html += '   <div class="modal-content">';
    html += '       <div class="modal-header">';
    html += '           <button type="button" class="close" data-dismiss="modal" aria-label="Close">';
    html += '               <span aria-hidden="true">&times;</span></button>';
    html += '           <h4 class="modal-title">'+modalTitle+'</h4>';
    html += '       </div>';
    html += '       <div class="modal-body">';
    html += '           <p>'+text+'</p>';
    html += '       </div>';
    html += '       <div class="modal-footer">';
    if(type === 'confirm'){
        html += '           <button type="button" class="btn btn-primary" onclick="'+onfunc+'()">확인</button>';
        html += '           <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>';
    }else if(type === 'alert'){
        html += '           <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>';
    }
    html += '       </div>';
    html += '   </div>';
    html += '</div>';

    $('#confirmDiv').html(html);
    $('#confirmDiv').modal();
}

/**
 * 테이블 클릭 이벤트
 * @param data
 * @param content
 * @param clickfunc
 * @param key
 * @returns {string}
 */
function setClickText(data,content,clickfunc,key){
    var str = key.split(',');
    var arrKey = '';
    for(var i=0; i<str.length;i++){
        arrKey += '\''+data[str[i]]+'\',';
    }
    arrKey = arrKey.substr(0,arrKey.length-1);

    var result = '';
    if(arrKey.indexOf('undefined') > -1){
        result = content;
    }else{
        result = '<a href="javascript:void(0);" onclick="'+clickfunc+'('+arrKey+')" tabindex="-1">' + content + '</a>';
    }

    return result;
}

/**
 * 숫자에 따른 TEXT 색
 * @param data
 * @param content
 * @param key
 * @returns {string}
 */
function setCntColor(data,content,key){
    var text = key.toUpperCase();
    var result = '';
    if(text.indexOf('FAIL') > -1 && content > 0){
        result = '<span style="color:red;font-weight:bold;">' + content + '</span>';
    }else{
        result = content;
    }
    return result;
}

/**
 * 선택된 체크박스 리스트
 * @param name
 * @returns {string}
 */
function getCheckBoxList(name){
    var checkList = "";
    $('input[name='+name+']:checked').each(function (index) {
        checkList += $(this).val() + ",";
    });
    if(checkList.length > 0){
        checkList = checkList.substr(0,checkList.length-1);
    }
    return checkList;
}

/**
 * 선택되지 않은 체크박스 리스트
 * @param name
 * @returns {string}
 */
function getNoneCheckBoxList(name){
    var checkList = "";
    $('input[name='+name+']:not(:checked)').each(function (index) {
        checkList += $(this).val() + ",";
    });
    if(checkList.length > 0){
        checkList = checkList.substr(0,checkList.length-1);
    }
    return checkList;
}

/**
 * 체크박스, 라디오버튼 CSS 적용
 */
function styleCheckRadio() {
    $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
        checkboxClass: 'icheckbox_minimal-blue',
        radioClass: 'iradio_minimal-blue'
    });
}

/**
 * 수정 내역에 따른 버튼 활성화/비활성화
 * @param btn
 */
function btnStatus(btn) {
    /* textChange.js 사용시 */
    $(document).on('textchange', 'input[type=text]', function () {
        $('#' + btn).prop('disabled', false);
    });
    /* icheck.js 사용시 */
    $(document).on('ifChanged','input[class=minimal]', function(){
        $('#' + btn).prop('disabled', false);
    });
}
