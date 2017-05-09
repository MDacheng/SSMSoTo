package com.mdc.web;

import com.mdc.beans.User;
import com.mdc.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by mengdacheng on 2017/5/5.
 */
@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    @RequestMapping("/login.html")
    public ModelAndView login(@RequestParam("username") String username, @RequestParam("password") String password){
        UsernamePasswordToken token = new UsernamePasswordToken(username, password);
        Subject subject = SecurityUtils.getSubject();
        ModelAndView view = null;
        try{
            subject.login(token);
        } catch (IncorrectCredentialsException ice){
            view = new ModelAndView("error");
            view.addObject("message", "password error!!!");
            return view;
        } catch (UnknownAccountException uae){
            view = new ModelAndView("error");
            view.addObject("message", "no such username");
            return view;
        } catch (ExcessiveAttemptsException eae){
            view = new ModelAndView("error");
            view.addObject("message", "times error");
            return view;
        }
        User user = userService.findUserByName(username);
        subject.getSession().setAttribute("user", user);
        return new ModelAndView("main");
    }
}
