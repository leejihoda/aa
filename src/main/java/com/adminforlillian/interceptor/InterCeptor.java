package com.adminforlillian.interceptor;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class InterCeptor extends HandlerInterceptorAdapter {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler){
        try {
            //나중에 로근 처리하는 로직을 추가하자
            request.setAttribute("member_no","1");

            /** 실패할경우
             *  response.sendRedirect(URL);
                return false;
             */

        } catch (Exception e) {
            logger.info("[InterCeptor Exception] : "+e);
            e.printStackTrace();
        }
        return true;
    }
}
