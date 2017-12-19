package com.adminforlillian.web.dao.impl;

import com.adminforlillian.web.dao.DomainDao;
import com.adminforlillian.web.facade.DomainFacade;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class DomainImpl implements DomainFacade {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private DomainDao domainDao;

    @Override
    public List<Map<String, Object>> getList(Map<String,Object> param){ return domainDao.getList(param);}
    @Override
    public Integer getTotal(Map<String,Object> param){ return domainDao.getTotal(param);}
    @Override
    public Map<String, Object> getDetail(Map<String,Object> param){ return domainDao.getDetail(param);}
    @Override
    public void insert(Map<String,Object> param){ domainDao.insert(param);}
    @Override
    public void update(Map<String,Object> param){ domainDao.update(param);}
    @Override
    public void staticInsertDay(Map<String,Object> param){ domainDao.staticInsertDay(param);}
    @Override
    public List<Map<String, Object>> getStaticDay(Map<String,Object> param){ return domainDao.getStaticDay(param);}
    @Override
    public List<Map<String, Object>> getStaticDayDetail(Map<String,Object> param){ return domainDao.getStaticDayDetail(param);}
    @Override
    public List<Map<String, Object>> getStaticMonth(Map<String, Object> param){
        List<Map<String, Object>> result = new ArrayList<>();
        List<Map<String, Object>> data = domainDao.getStaticMonth(param);
        if(data != null && data.size() > 0){
            List<Map<String, Object>> tempList = new ArrayList<>();
            Map<String,Object> tempMap = new HashMap<>();
            String domain_no = "0";
            for(int i=0; i<data.size(); i++){
                if(domain_no.equals("0") || !domain_no.equals(data.get(i).get("DOMAIN_NO").toString())){
                    if(!domain_no.equals("0")){
                        tempMap.put("LIST",tempList);
                        result.add(tempMap);
                        tempMap = new HashMap<>();
                        tempList = new ArrayList<>();
                    }
                    domain_no = data.get(i).get("DOMAIN_NO").toString();
                    tempMap.put("DOMAIN_NO",domain_no);
                    tempMap.put("DOMAIN_NM",data.get(i).get("DOMAIN_NM").toString());
                    tempList.add(data.get(i));
                }else{
                    tempList.add(data.get(i));
                }
                if(i == (data.size()-1)){
                    tempMap.put("LIST",tempList);
                    result.add(tempMap);
                }
            }
        }
        return result;
    }
}
