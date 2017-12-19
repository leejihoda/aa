package com.adminforlillian.commons.utils;

import org.apache.commons.lang.StringUtils;
import org.json.JSONArray;
import org.json.simple.JSONObject;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

/****** INFO ***********************************************
 * 업 무 명 : StringUtil
 * 작 성 자 : LEE BYEONG MOO
 * 작 성 일 : 2017-02-09
 * 수 정 자 : 
 * 수 정 일 : 
 * 내    용 : 
 * 주의사항 : 
 ************************************************************/
public class StringUtil {

    public boolean isEmpty(Object value) {
        if (value == null) {
            return true;
        } else {
            if (value instanceof String) {
                return !(value.toString().length() > 0);
            } else if (value instanceof List) {
                return !(((List<Object>) value).size() > 0);
            } else if (value instanceof String[]) {
                return !(((String[]) value).length > 0);
            } else if (value instanceof HashMap) {
                return !(((HashMap) value).keySet().size() > 0);
            } else if (value instanceof JSONObject) {
                return !(((JSONObject) value).size() > 0);
            } else if (value instanceof JSONArray) {
                return !(((JSONArray) value).length() > 0);
            } else {
                return false;
            }
        }
    }
    public boolean isNotEmpty(Object value) {
        return !isEmpty(value);
    }

    public String longToIp(Long ip)
    {
        return ((ip >> 24) & 0xFF) + "."
                + ((ip >> 16) & 0xFF) + "."
                + ((ip >> 8) & 0xFF) + "."
                + (ip & 0xFF);
    }

    public long ipToLong(String ipAddr) {
        String[] ipAddrArray = ipAddr.split("\\.");
        if (ipAddrArray.length != 4)
            throw new RuntimeException();

        long num = 0;
        for (int i = 0; i < ipAddrArray.length; i++) {
            int power = 3 - i;
            num += ((Integer.parseInt(ipAddrArray[i]) % 256 * Math.pow(256, power)));
        }
        return num;
    }

    public String getClientStrIp(HttpServletRequest request){
        String ipAddr = request.getHeader("X-Forwarded-For");
        if( StringUtils.isEmpty(ipAddr) )
            ipAddr = request.getRemoteAddr();		// nginx 없는 localhost의 null 방지용
        else
            ipAddr = ipAddr.split(",")[0].trim();		// , 로 구분된 값 중 첫번째 값이 client IP

        return ipAddr;
    }
}
