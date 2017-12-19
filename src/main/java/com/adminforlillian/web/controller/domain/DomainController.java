package com.adminforlillian.web.controller.domain;

import com.adminforlillian.commons.utils.JSONResponseUtil;
import com.adminforlillian.web.facade.DomainFacade;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping(value="/fixedwork/domain")
public class DomainController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private DomainFacade domainFacade;

    /**
     * 전체 목록 조회
     * @return
     */
    @GetMapping(value="/list")
    public ResponseEntity list(HttpServletRequest request, HttpServletResponse response) {
        JSONObject resultObject = new JSONObject();
        try {
            Map<String, Object> param = new HashMap<String, Object>();
            param.put("member_no", request.getAttribute("member_no"));
            resultObject.put("result",200);
            resultObject.put("context",domainFacade.getList(param));
            resultObject.put("total_cnt",domainFacade.getTotal(param));
            return JSONResponseUtil.getJSONResponse(resultObject);
        } catch (Exception e){
            logger.info("[Exception] : " + e);
            resultObject.put("result", "503");
            resultObject.put("return_message", "서버 예외상황이 발생했습니다.");
            resultObject.put("Exception", e);
            return JSONResponseUtil.getJSONResponse(resultObject);
        }
    }

    /**
     * 상세 조회
     * @param domain_no
     * @return
     */
    @GetMapping(value="/detail/{domain_no}")
    public ResponseEntity detail(HttpServletRequest request, HttpServletResponse response, @PathVariable int domain_no) {
        JSONObject resultObject = new JSONObject();
        try {
            Map<String, Object> param = new HashMap<String, Object>();
            param.put("domain_no", domain_no);
            resultObject.put("result",200);
            resultObject.put("context",domainFacade.getDetail(param));
            return JSONResponseUtil.getJSONResponse(resultObject);
        } catch (Exception e){
            logger.info("[Exception] : " + e);
            resultObject.put("result", "503");
            resultObject.put("return_message", "서버 예외상황이 발생했습니다.");
            resultObject.put("Exception", e);
            return JSONResponseUtil.getJSONResponse(resultObject);
        }
    }

    /**
     * 등록
     * @param request
     * @param response
     * @param json
     * @return
     */
    @PostMapping(value="/insert")
    public ResponseEntity insert(HttpServletRequest request, HttpServletResponse response, @RequestBody String json) {
        JSONObject resultObject = new JSONObject();
        try {
            Map<String, Object> param = new JSONObject(json).toMap();
            param.put("member_no", request.getAttribute("member_no"));
            domainFacade.insert(param);
            resultObject.put("result",200);
            return JSONResponseUtil.getJSONResponse(resultObject);
        }catch (Exception e){
            logger.info("[Exception] : " + e);
            resultObject.put("result", "503");
            resultObject.put("return_message", "서버 예외상황이 발생했습니다.");
            resultObject.put("Exception", e);
            return JSONResponseUtil.getJSONResponse(resultObject);
        }
    }

    /**
     * 수정
     * @param request
     * @param response
     * @param json
     * @return
     */
    @PutMapping(value="/update")
    public ResponseEntity update(HttpServletRequest request, HttpServletResponse response, @RequestBody String json) {
        JSONObject resultObject = new JSONObject();
        try {
            Map<String, Object> param = new JSONObject(json).toMap();
            param.put("member_no", request.getAttribute("member_no"));
            domainFacade.update(param);
            resultObject.put("result",200);
            return JSONResponseUtil.getJSONResponse(resultObject);
        } catch (Exception e){
            logger.info("[Exception] : " + e);
            resultObject.put("result", "503");
            resultObject.put("return_message", "서버 예외상황이 발생했습니다.");
            resultObject.put("Exception", e);
            return JSONResponseUtil.getJSONResponse(resultObject);
        }
    }

    /**
     * 집계 등록
     * @param request
     * @param response
     * @param json
     * @return
     */
    @PostMapping(value="/staticInsert")
    public ResponseEntity staticInsert(HttpServletRequest request, HttpServletResponse response, @RequestBody String json) {
        JSONObject resultObject = new JSONObject();
        try {
            Map<String, Object> param = new JSONObject(json).toMap();
            param.put("member_no", request.getAttribute("member_no"));
            String success = param.get("success_list").toString();
            String fail = param.get("fail_list").toString();
            Map<String, Object> insertParam;
            //성공 등록
            if(success.length() > 0){
                insertParam = param;
                insertParam.put("status","Y");
                String successList[] = success.split(",");
                for(int i=0; i<successList.length; i++){
                    insertParam.put("domain_no",successList[i]);
                    domainFacade.staticInsertDay(insertParam);
                }
            }
            //실패 등록
            if(fail.length() > 0){
                insertParam = param;
                insertParam.put("status","N");
                String failList[] = fail.split(",");
                for(int i=0; i<failList.length; i++){
                    insertParam.put("domain_no",failList[i]);
                    domainFacade.staticInsertDay(insertParam);
                }
            }
            resultObject.put("result",200);
            return JSONResponseUtil.getJSONResponse(resultObject);
        }catch (Exception e){
            logger.info("[Exception] : " + e);
            resultObject.put("result", "503");
            resultObject.put("return_message", "서버 예외상황이 발생했습니다.");
            resultObject.put("Exception", e);
            return JSONResponseUtil.getJSONResponse(resultObject);
        }
    }

    /**
     * 일별 통계 조회
     * @param request
     * @param response
     * @param day
     * @return
     */
    @GetMapping(value="/staticDay/{day}")
    public ResponseEntity staticDay(HttpServletRequest request, HttpServletResponse response, @PathVariable String day) {
        JSONObject resultObject = new JSONObject();
        try {
            Map<String, Object> param = new HashMap<String, Object>();
            param.put("day", day);
            resultObject.put("result",200);
            resultObject.put("context",domainFacade.getStaticDay(param));
            return JSONResponseUtil.getJSONResponse(resultObject);
        } catch (Exception e){
            logger.info("[Exception] : " + e);
            resultObject.put("result", "503");
            resultObject.put("return_message", "서버 예외상황이 발생했습니다.");
            resultObject.put("Exception", e);
            return JSONResponseUtil.getJSONResponse(resultObject);
        }
    }

    /**
     * 일별 통계 Detail
     * @param request
     * @param response
     * @param domain_no
     * @return
     */
    @GetMapping(value="/staticDay/detail/{domain_no}/{day}")
    public ResponseEntity staticDayDetail(HttpServletRequest request, HttpServletResponse response,
                                          @PathVariable String domain_no,
                                          @PathVariable String day) {
        JSONObject resultObject = new JSONObject();
        try {
            Map<String, Object> param = new HashMap<String, Object>();
            param.put("domain_no", domain_no);
            param.put("day", day);
            resultObject.put("result",200);
            resultObject.put("context",domainFacade.getStaticDayDetail(param));
            return JSONResponseUtil.getJSONResponse(resultObject);
        } catch (Exception e){
            logger.info("[Exception] : " + e);
            resultObject.put("result", "503");
            resultObject.put("return_message", "서버 예외상황이 발생했습니다.");
            resultObject.put("Exception", e);
            return JSONResponseUtil.getJSONResponse(resultObject);
        }
    }

    @GetMapping(value="/staticMonth/{month}")
    public ResponseEntity staticMonth(HttpServletRequest request, HttpServletResponse response, @PathVariable String month) {
        JSONObject resultObject = new JSONObject();
        try {
            Map<String, Object> param = new HashMap<String, Object>();
            param.put("month", month);
            resultObject.put("result",200);
            resultObject.put("context",domainFacade.getStaticMonth(param));
            return JSONResponseUtil.getJSONResponse(resultObject);
        } catch (Exception e){
            logger.info("[Exception] : " + e);
            resultObject.put("result", "503");
            resultObject.put("return_message", "서버 예외상황이 발생했습니다.");
            resultObject.put("Exception", e);
            return JSONResponseUtil.getJSONResponse(resultObject);
        }
    }

}
