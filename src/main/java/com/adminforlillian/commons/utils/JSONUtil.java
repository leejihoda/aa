package com.adminforlillian.commons.utils;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.*;

/****** INFO ***********************************************
 * 업 무 명 : JSONUtil
 * 작 성 자 : LEE BYEONG MOO
 * 작 성 일 : 2017-02-13
 * 수 정 자 : 
 * 수 정 일 : 
 * 내    용 : 
 * 주의사항 : 
 ************************************************************/
public class JSONUtil {
    public Map<String, Object> jsonToMap(JSONObject json) throws JSONException {
        Map<String, Object> retMap = new HashMap<String, Object>();

        if(json != JSONObject.NULL) {
            retMap = toMap(json);
        }
        return retMap;
    }

    public Map<String, Object> toMap(JSONObject object) throws JSONException {
        Map<String, Object> map = new HashMap<String, Object>();

        Iterator<String> keysItr = object.keys();
        while(keysItr.hasNext()) {
            String key = keysItr.next();
            Object value = object.get(key);

            if(value instanceof JSONArray) {
                value = toList((JSONArray) value);
            }

            else if(value instanceof JSONObject) {
                value = toMap((JSONObject) value);
            }
            map.put(key, value);
        }
        return map;
    }

    public List<Object> toList(JSONArray array) throws JSONException {
        List<Object> list = new ArrayList<Object>();
        for(int i = 0; i < array.length(); i++) {
            Object value = array.get(i);
            if(value instanceof JSONArray) {
                value = toList((JSONArray) value);
            }

            else if(value instanceof JSONObject) {
                value = toMap((JSONObject) value);
            }
            list.add(value);
        }
        return list;
    }

    public boolean jsonKeyCheck(JSONObject json, String key){
        if(json.has(key)){
            try {
                String outValue = json.getString(key);
                return true;
            } catch (JSONException e) {
                e.printStackTrace();
                return false;
            }
        }else{
            return false;
        }
    }
}
