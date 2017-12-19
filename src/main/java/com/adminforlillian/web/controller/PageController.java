package com.adminforlillian.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Enumeration;

@Controller
public class PageController {
    @RequestMapping("/{page}/page/")
    public String goDepth1Page(@PathVariable String page) {
        return page;
    }

    @RequestMapping("/{depth1}/{page}/page/")
    public String goDepth2Page(@PathVariable String depth1, @PathVariable String page,HttpServletRequest request,Model model) {
        Enumeration enumeration = request.getParameterNames();
        while (enumeration.hasMoreElements()) {
            String key = (String) enumeration.nextElement();
            String value = request.getParameter(key);
            model.addAttribute(key,value);
        }
        return depth1 + "/" + page;
    }

    @RequestMapping("/{depth1}/{depth2}/{page}/page/")
    public String goDepth3Page(@PathVariable String depth1, @PathVariable String depth2, @PathVariable String page,HttpServletRequest request,Model model) {
        Enumeration enumeration = request.getParameterNames();
        while (enumeration.hasMoreElements()) {
            String key = (String) enumeration.nextElement();
            String value = request.getParameter(key);
            model.addAttribute(key,value);
        }
        return depth1 + "/" + depth2 + "/" + page;
    }
}
