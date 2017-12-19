package com.adminforlillian.commons.utils;

import org.json.JSONObject;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/****** INFO ***********************************************
 * 업 무 명 : Cookie 관련 class
 * 작 성 자 : LEE BYEONG MOO
 * 작 성 일 : 2017-02-09
 * 수 정 자 : 
 * 수 정 일 : 
 * 내    용 : cookie를 이용한 API 호출 및 cookie 셋팅을 위한 class
 * 주의사항 : 
 ************************************************************/
public class SimpleCookieUtils {
    /**
     * Cookie를 통한 Access-Token 얻기
     * @param request
     * @return
     */
    public String getAccessToken(HttpServletRequest request){
        Cookie[] cookies = request.getCookies();
        String PHD= "";
        String PPLD= "";
        String PSIGN= "";
        String access_token= "";
        for (Cookie cookie : cookies) {
            if( cookie.getName().equals("PHD") ) { PHD = cookie.getValue(); }
            if( cookie.getName().equals("PPLD") ) { PPLD = cookie.getValue(); }
            if( cookie.getName().equals("PSIGN") ) { PSIGN = cookie.getValue(); }
        }
        access_token = PHD+"."+PPLD+"."+PSIGN;

        return access_token;
    }

    public String getRefreshToken(HttpServletRequest request){
        Cookie[] cookies = request.getCookies();
        String PRFT= "";
        for (Cookie cookie : cookies) {
            if( cookie.getName().equals("PRFT") ) { PRFT = cookie.getValue(); }
        }
        return PRFT;
    }

    /**
     * 응답 받은 파라미터를 통한 Cookie 추가
     * @param object
     * @param response
     */
    public void paramSetCookie(JSONObject object,HttpServletResponse response,String domain){
        StringUtil stringUtil = new StringUtil();
        String PHD= "";
        String PPLD= "";
        String PSIGN= "";
        String access_token= "";
        String PRFT= "";

        if(stringUtil.isNotEmpty(object)){
            access_token = object.get("access_token").toString();
            String[] accessTokenArray = access_token.split("[.]");
            if(accessTokenArray.length > 0){
                PHD = accessTokenArray[0];
                PPLD = accessTokenArray[1];
                PSIGN = accessTokenArray[2];
            }
            PRFT = object.get("refresh_token").toString();
            setCookie(response,"PHD",PHD,domain);
            setCookie(response,"PPLD",PPLD,domain);
            setCookie(response,"PSIGN",PSIGN,domain);
            setCookie(response,"PRFT",PRFT,domain);
        }
    }

    /**
     * Cookie 추가
     * @param response
     * @param name
     * @param value
     * @param domain
     */
    public void setCookie(HttpServletResponse response, String name, String value, String domain){
        Cookie cookie = new Cookie(name, value);
        // 쿠키 유효기간을 설정한다. 초단위 : 60*60*24= 1일
        cookie.setMaxAge(-1);
        cookie.setDomain(domain);
        cookie.setPath("/");
        // 응답헤더에 쿠키를 추가한다.
        response.addCookie(cookie) ;
    }

    /**
     * Cookie 삭제
     * @param response
     * @param cookieName
     * @param domain
     */
    public void removeCookie( HttpServletResponse response, String cookieName, String domain) {
        Cookie cookie = new Cookie(cookieName, null) ;
        cookie.setDomain(domain);
        cookie.setPath("/");
        cookie.setMaxAge(0) ;
        response.addCookie(cookie);
    }

}
