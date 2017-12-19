package com.adminforlillian.web.controller.mj;

import com.adminforlillian.commons.utils.ResponseUtil;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value="/lab")
public class SubController {

//
//    DbController dbSvc = null;
//
//    public SubController() {
//        dbSvc = new DbController();
//    }
//
//
//    @RequestMapping(value = "/home/index.do")
//    public void homeIndex(HttpServletRequest servletRequest, HttpServletResponse servletResponse) throws Exception {
//
//        Map<String,Object> reqMap = new HashMap<>();
//    리스트
//        dbSvc.dbList(reqMap, "sub.faqList");
//    상세
//        dbSvc.dbDetail(reqMap,"sub.faqDetail");
//    등록
//        dbSvc.dbInsert(reqMap, "sub.faqInsert");
//    수정
//        dbSvc.dbUpdate(reqMap, "sub.faqUpdate");
//    삭제
//        dbSvc.dbUpdate(reqMap, "sub.faqDelete");
//    시퀀스
//        dbSvc.dbCount(reqMap, "sub.searchProfCount");
//    }

    @RequestMapping(value = "/lab/manager/d1_1/d2_3.do")
    public String labManagerd1_1d2_3() {
        return "lab/manager/d1_1/d2_3";
    }

    //파일 업로드
    @RequestMapping(value="/fileUpload",method = RequestMethod.POST)
    public ResponseEntity fileUpload(HttpServletRequest request, HttpServletResponse response,@RequestParam("filename_0") MultipartFile file) {
        JSONObject resultObject = new JSONObject();
        try {
            FileHelper fileHelper = new FileHelper();
            Map<String,Object> fileInfo = fileHelper.uploadFiles(request, file);
            resultObject.put("result",200);
            resultObject.put("context",fileInfo);
            return ResponseUtil.getResponse(resultObject);
        } catch (Exception e){
            resultObject.put("result", "503");
            resultObject.put("return_message", "서버 예외상황이 발생했습니다.");
            resultObject.put("Exception", e);
            return ResponseUtil.getResponse(resultObject);
        }
    }

    //FAQ 리스트
    @RequestMapping(value="/1_4/list",method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
    public ResponseEntity faqList() {
        JSONObject resultObject = new JSONObject();
        try {
            List<Map<String,Object>> list = new ArrayList<>();
            Map<String,Object> map = new HashMap<>();

            //예제 파일
            for(int i = 0 ; i < 2; i ++){
                map.put("FAQ_NO",i);
                map.put("QUESTION","FQA 질문_"+i);
                map.put("ANSWER","FQA 답변_"+i);
                list.add(map);
            }
            resultObject.put("result",200);
            resultObject.put("context",list);
            return ResponseUtil.getResponse(resultObject);
        } catch (Exception e){
            resultObject.put("result", "503");
            resultObject.put("return_message", "서버 예외상황이 발생했습니다.");
            resultObject.put("Exception", e);
            return ResponseUtil.getResponse(resultObject);
        }
    }

    //FAQ 상세
    @RequestMapping(value="/1_4/detail",method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
    public ResponseEntity faqDetail(@RequestBody String json) {
        JSONObject resultObject = new JSONObject();
        try {
            JSONObject jsonObject = new JSONObject(json);
            System.out.println("faqDetail");
            System.out.println(jsonObject);
            Map<String,Object> map = new HashMap<>();

            //예제 파일
            map.put("FAQ_NO",jsonObject.getInt("FQA_NO"));
            map.put("QUESTION","FQA 질문_"+jsonObject.getInt("FQA_NO"));
            map.put("ANSWER","FQA 답변_"+jsonObject.getInt("FQA_NO"));

            resultObject.put("result",200);
            resultObject.put("context",map);
            return ResponseUtil.getResponse(resultObject);
        } catch (Exception e){
            resultObject.put("result", "503");
            resultObject.put("return_message", "서버 예외상황이 발생했습니다.");
            resultObject.put("Exception", e);
            return ResponseUtil.getResponse(resultObject);
        }
    }

    //FAQ 등록
    @RequestMapping(value="/1_4/insert",method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
    public ResponseEntity faqInsert(@RequestBody String json) {
        JSONObject resultObject = new JSONObject();
        try {
            JSONObject jsonObject = new JSONObject(json);
            System.out.println("fqaInsert");
            System.out.println(jsonObject);

            resultObject.put("result",200);
            return ResponseUtil.getResponse(resultObject);
        } catch (Exception e){
            resultObject.put("result", "503");
            resultObject.put("return_message", "서버 예외상황이 발생했습니다.");
            resultObject.put("Exception", e);
            return ResponseUtil.getResponse(resultObject);
        }
    }

    //FAQ 수정
    @RequestMapping(value="/1_4/update",method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
    public ResponseEntity faqUpdate(@RequestBody String json) {
        JSONObject resultObject = new JSONObject();
        try {
            JSONObject jsonObject = new JSONObject(json);
            System.out.println("fqaUpdate");
            System.out.println(jsonObject);

            resultObject.put("result",200);
            return ResponseUtil.getResponse(resultObject);
        } catch (Exception e){
            resultObject.put("result", "503");
            resultObject.put("return_message", "서버 예외상황이 발생했습니다.");
            resultObject.put("Exception", e);
            return ResponseUtil.getResponse(resultObject);
        }
    }

    //FAQ 삭제
    @RequestMapping(value="/1_4/delete",method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
    public ResponseEntity faqDelete(@RequestBody String json) {
        JSONObject resultObject = new JSONObject();
        try {
            JSONObject jsonObject = new JSONObject(json);
            System.out.println("faqDelete");
            System.out.println(jsonObject);

            resultObject.put("result",200);
            return ResponseUtil.getResponse(resultObject);
        } catch (Exception e){
            resultObject.put("result", "503");
            resultObject.put("return_message", "서버 예외상황이 발생했습니다.");
            resultObject.put("Exception", e);
            return ResponseUtil.getResponse(resultObject);
        }
    }

    //FILE 리스트 - 필수값(FAQ_NO)
    @RequestMapping(value="/1_4/file/list",method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
    public ResponseEntity fileList(@RequestBody String json) {
        JSONObject resultObject = new JSONObject();
        try {
            JSONObject jsonObject = new JSONObject(json);
            System.out.println("fileList");
            System.out.println(jsonObject);

            List<Map<String,Object>> list = new ArrayList<>();
            Map<String,Object> map = new HashMap<>();

            //예제 파일
            for(int i = 0 ; i < 5; i ++){
                map.put("FILE_NO",i);
                map.put("FAQ_NO",jsonObject.getInt("FQA_NO"));
                map.put("FILE_NM","파일 제목_"+jsonObject.getInt("FQA_NO")+"_"+i);
                map.put("FILE_URL","https://t1.daumcdn.net/daumtop_chanel/op/20170315064553027.png");
                list.add(map);
            }
            resultObject.put("result",200);
            resultObject.put("context",list);
            return ResponseUtil.getResponse(resultObject);
        } catch (Exception e){
            resultObject.put("result", "503");
            resultObject.put("return_message", "서버 예외상황이 발생했습니다.");
            resultObject.put("Exception", e);
            return ResponseUtil.getResponse(resultObject);
        }
    }

    //FILE 수정
    @RequestMapping(value="/1_4/file/update",method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
    public ResponseEntity fileUpdate(@RequestBody String json) {
        JSONObject resultObject = new JSONObject();
        try {
            JSONObject jsonObject = new JSONObject(json);
            System.out.println("fileUpdate");
            System.out.println(jsonObject);

            if(jsonObject.has("ADD")){
                System.out.println("==============등록");
                JSONArray jsonArray = jsonObject.getJSONArray("ADD");
                for(int i=0;i<jsonArray.length();i++){
                    Map<String,Object> map = jsonArray.getJSONObject(i).toMap();
                    map.put("FAQ_NO",jsonObject.getInt("FAQ_NO"));
                    //등록 호출

                    System.out.println(map);

                }
            }
            if(jsonObject.has("MODI")){
                System.out.println("==============수정");
                JSONArray jsonArray = jsonObject.getJSONArray("MODI");
                for(int i=0;i<jsonArray.length();i++){
                    Map<String,Object> map = jsonArray.getJSONObject(i).toMap();
                    //수정 호출

                    System.out.println(map);
                }

            }
            if(jsonObject.has("DEL")){
                System.out.println("==============삭제");
                JSONArray jsonArray = jsonObject.getJSONArray("DEL");
                for(int i=0;i<jsonArray.length();i++){
                    int file_no = jsonArray.getInt(i);
                    //삭제 호출

                    System.out.println(file_no);
                }
            }
            resultObject.put("result",200);
            return ResponseUtil.getResponse(resultObject);
        } catch (Exception e){
            resultObject.put("result", "503");
            resultObject.put("return_message", "서버 예외상황이 발생했습니다.");
            resultObject.put("Exception", e);
            return ResponseUtil.getResponse(resultObject);
        }
    }

    //BUSINESS 리스트 - 필수값(D2)
    @RequestMapping(value="/2_2/list",method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
    public ResponseEntity businessList(@RequestBody String json) {
        JSONObject resultObject = new JSONObject();
        try {
            JSONObject jsonObject = new JSONObject(json);
            System.out.println("businessList");
            System.out.println(jsonObject);

            List<Map<String,Object>> list = new ArrayList<>();
            Map<String,Object> map = new HashMap<>();

            //예제 파일
            for(int i = 0 ; i < 2; i ++){
                map.put("BSNS_NO",i);
                map.put("ORDER_NO",i);
                map.put("RESEARCH_CMPN","연구기관"+i);
                map.put("TASK_NM","과제명"+i);
                map.put("RESEARCH_MNGR","연구책임자"+i);
                map.put("SUBJECTIVE_CMPN","주관기관"+i);
                map.put("FIELD","분야"+i);
                map.put("MEMO","비고"+i);
                list.add(map);
            }
            resultObject.put("result",200);
            resultObject.put("context",list);
            return ResponseUtil.getResponse(resultObject);
        } catch (Exception e){
            resultObject.put("result", "503");
            resultObject.put("return_message", "서버 예외상황이 발생했습니다.");
            resultObject.put("Exception", e);
            return ResponseUtil.getResponse(resultObject);
        }
    }

    //BUSINESS 상세
    @RequestMapping(value="/2_2/detail",method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
    public ResponseEntity businessDetail(@RequestBody String json) {
        JSONObject resultObject = new JSONObject();
        try {
            JSONObject jsonObject = new JSONObject(json);
            System.out.println("businessDetail");
            System.out.println(jsonObject);
            Map<String,Object> map = new HashMap<>();

            //예제 파일
            map.put("BSNS_NO",1);
            map.put("CATE_NO",null);
            map.put("INFO","사업목적");
            map.put("CONTENT","사업내용");
            map.put("EFFECT","기대효과");
            map.put("FILE_URL1","https://t1.daumcdn.net/daumtop_chanel/op/20170315064553027.png");
            map.put("FILE_URL2","https://t1.daumcdn.net/daumtop_chanel/op/20170315064553027.png");
            map.put("FILE_URL3","https://t1.daumcdn.net/daumtop_chanel/op/20170315064553027.png");
            map.put("FILE_URL4","https://t1.daumcdn.net/daumtop_chanel/op/20170315064553027.png");
            map.put("FILE_URL5","https://t1.daumcdn.net/daumtop_chanel/op/20170315064553027.png");
            map.put("FILE_URL6",null);
            map.put("FILE_URL7",null);
            map.put("FILE_URL8",null);
            map.put("FILE_URL9",null);
            map.put("FILE_URL10",null);
            map.put("ORDER",1);
            map.put("RESEARCH_CMPN","연구기관");
            map.put("TASK_NM","과제명");
            map.put("RESEARCH_MNGR","연구책임자");
            map.put("SUBJECTIVE_CMPN","주관기관");
            map.put("FIELD","분야");
            map.put("MEMO","비고");
            map.put("RESEARCH_SMRY","연구요약");
            map.put("ETC","기타사항");
            map.put("FILE_URL","https://t1.daumcdn.net/daumtop_chanel/op/20170315064553027.png");

            resultObject.put("result",200);
            resultObject.put("context",map);
            return ResponseUtil.getResponse(resultObject);
        } catch (Exception e){
            resultObject.put("result", "503");
            resultObject.put("return_message", "서버 예외상황이 발생했습니다.");
            resultObject.put("Exception", e);
            return ResponseUtil.getResponse(resultObject);
        }
    }

    //BUSINESS 등록
    @RequestMapping(value="/2_2/insert",method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
    public ResponseEntity businessInsert(@RequestBody String json) {
        JSONObject resultObject = new JSONObject();
        try {
            JSONObject jsonObject = new JSONObject(json);
            System.out.println("businessInsert");
            System.out.println(jsonObject);

            resultObject.put("result",200);
            return ResponseUtil.getResponse(resultObject);
        } catch (Exception e){
            resultObject.put("result", "503");
            resultObject.put("return_message", "서버 예외상황이 발생했습니다.");
            resultObject.put("Exception", e);
            return ResponseUtil.getResponse(resultObject);
        }
    }

    //BUSINESS 수정
    @RequestMapping(value="/2_2/update",method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
    public ResponseEntity businessUpdate(@RequestBody String json) {
        JSONObject resultObject = new JSONObject();
        try {
            JSONObject jsonObject = new JSONObject(json);
            System.out.println("businessUpdate");
            System.out.println(jsonObject);

            resultObject.put("result",200);
            return ResponseUtil.getResponse(resultObject);
        } catch (Exception e){
            resultObject.put("result", "503");
            resultObject.put("return_message", "서버 예외상황이 발생했습니다.");
            resultObject.put("Exception", e);
            return ResponseUtil.getResponse(resultObject);
        }
    }

    //BUSINESS 삭제
    @RequestMapping(value="/2_2/delete",method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
    public ResponseEntity businessDelete(@RequestBody String json) {
        JSONObject resultObject = new JSONObject();
        try {
            JSONObject jsonObject = new JSONObject(json);
            System.out.println("businessDelete");
            System.out.println(jsonObject);

            resultObject.put("result",200);
            return ResponseUtil.getResponse(resultObject);
        } catch (Exception e){
            resultObject.put("result", "503");
            resultObject.put("return_message", "서버 예외상황이 발생했습니다.");
            resultObject.put("Exception", e);
            return ResponseUtil.getResponse(resultObject);
        }
    }


}
