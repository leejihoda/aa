package com.adminforlillian.commons.utils;

import org.json.JSONObject;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

/****** INFO ***********************************************
 * 업 무 명 : response 모듈
 * 작 성 자 : LEE BYEONG MOO
 * 작 성 일 : 2017-02-13
 * 수 정 자 :
 * 수 정 일 :
 * 내    용 :
 * 주의사항 :
 ************************************************************/
public class JSONResponseUtil {

    /**
     * JSON View 화면 처리를 위해 JSON변환 후 ResponseEntity로 반환.
     * @param obj
     * @return
     */
    public static ResponseEntity getJSONResponse(JSONObject obj){
        HttpHeaders responseHeaders = new HttpHeaders();
        responseHeaders.add("Content-Type", "application/json; charset=UTF-8");
        return new ResponseEntity(obj.toString(), responseHeaders, HttpStatus.OK);
    }
}