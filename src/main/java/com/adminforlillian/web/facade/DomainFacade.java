package com.adminforlillian.web.facade;

import java.util.List;
import java.util.Map;

public interface DomainFacade {
    public List<Map<String,Object>> getList(Map<String, Object> param);
    public Integer getTotal(Map<String, Object> param);
    public Map<String,Object> getDetail(Map<String, Object> param);
    public void insert(Map<String, Object> param);
    public void update(Map<String, Object> param);
    public void staticInsertDay(Map<String, Object> param);
    public List<Map<String, Object>> getStaticDay(Map<String, Object> param);
    public List<Map<String, Object>> getStaticDayDetail(Map<String, Object> param);
    public List<Map<String, Object>> getStaticMonth(Map<String, Object> param);


}
