var ajax_yn = true;
/**
 * AJAX 호출1
 * @param Method
 * @param Url
 * @param Data
 * @param callback
 */
function callAjaxJson(Method, Url, Data, callback){
    if(ajax_yn){
        ajax_yn = false;
        $.ajax({
            type: Method
            , url: Url
            , data: JSON.stringify(Data)
            , contentType: "application/json"
            , success: function (res) {
                ajax_yn = true;
                if(res.result === 200){
                    callback(res);
                }else{
                    alertModal('alert',res.return_message);
                }
            }, error: function (error) {
                console.log(error)
            }
        });
    }
}

/**
 * AJAX 호출2
 * @param Method
 * @param Url
 * @param Data
 * @param callback
 */
function callAjaxJsonNosync(Method, Url, Data, callback){
    $.ajax({
        type: Method
        , url: Url
        , data: Data
        , contentType: "application/json"
        , success: function (res) {
            callback(res);
        }
    });
}

function isEmpty(str){
    if(str === null || str === undefined || str.length === 0 ){
        return '';
    }
    return str;
}

function removeHtml(str){
    return str.replace(/(<([^>]+)>)/gi, '');
}
