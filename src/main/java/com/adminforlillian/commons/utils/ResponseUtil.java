package com.adminforlillian.commons.utils;

import org.json.JSONObject;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
public class ResponseUtil {
    public static ResponseEntity getResponse(JSONObject map){
        HttpHeaders responseHeaders = new HttpHeaders();
        responseHeaders.add("Content-Type", "application/json; charset=UTF-8");
        return new ResponseEntity(map.toString(), responseHeaders, HttpStatus.OK);
    }
}