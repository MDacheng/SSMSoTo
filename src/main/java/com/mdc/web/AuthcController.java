package com.mdc.web;

import com.mdc.beans.User;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by mengdacheng on 2017/5/6.
 */
@Controller
@RequestMapping("/authc")
public class AuthcController {
    @RequestMapping("/anyuser")
    public ModelAndView anyUser(){
        Subject subject = SecurityUtils.getSubject();
        User user = (User)subject.getSession().getAttribute("user");
        return new ModelAndView("main");
    }

    @RequestMapping("/admin")
    public ModelAndView admin(){
        Subject subject = SecurityUtils.getSubject();
        User user = (User) subject.getSession().getAttribute("user");
        return new ModelAndView("main");
    }
}
