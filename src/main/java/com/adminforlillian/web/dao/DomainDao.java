package com.adminforlillian.web.dao;

import org.springframework.dao.DataAccessException;

import java.util.List;
import java.util.Map;

public interface DomainDao {
    public List<Map<String, Object>> getList(Map<String, Object> data) throws DataAccessException;
    public Integer getTotal(Map<String, Object> data) throws DataAccessException;
    public Map<String, Object> getDetail(Map<String, Object> data) throws DataAccessException;
    public void insert(Map<String, Object> data) throws DataAccessException;
    public void update(Map<String, Object> data) throws DataAccessException;
    public void staticInsertDay(Map<String, Object> data) throws DataAccessException;
    public List<Map<String, Object>> getStaticDay(Map<String, Object> data) throws DataAccessException;
    public List<Map<String, Object>> getStaticDayDetail(Map<String, Object> data) throws DataAccessException;
    public List<Map<String, Object>> getStaticMonth(Map<String, Object> data) throws DataAccessException;
}
