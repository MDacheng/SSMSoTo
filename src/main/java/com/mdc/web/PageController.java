package com.mdc.web;

import com.mdc.beans.Paper;
import com.mdc.beans.Question;
import com.mdc.service.PaperService;
import com.mdc.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by mengdacheng on 2017/5/4.
 */
@Controller
public class PageController {

    @Autowired
    private QuestionService questionService;

    @Autowired
    private PaperService paperService;

    /**
     * 跳转到首页
     * @param request
     * @return
     */
    @RequestMapping("/index.html")
    public String listQuestion(HttpServletRequest request){

        //查询总试题个数
        int total = questionService.getCount();
        request.getSession().setAttribute("total", total);

        //查询当前页的试题列表
        String pageIdStr = request.getParameter("pageId");
        int pageId = 0;
        try{
            pageId = Integer.parseInt(pageIdStr) - 1;
        }catch (Exception e){}

        request.getSession().setAttribute("pageId", pageId);

        List<Question> list = questionService.getPartQuestionList(pageId * 20);
        request.getSession().setAttribute("questionList", list);
        request.getSession().setAttribute("selectList", paperService.getQuestionList());
        return "main";
    }

    /**
     * 跳转到试题管理页面
     * @param request
     * @return
     */
    @RequestMapping("/manage.html")
    public String manage(HttpServletRequest request){
        //查询总试题个数
        int total = questionService.getCount();
        request.getSession().setAttribute("total", total);

        //查询当前页的试题列表
        String pageIdStr = request.getParameter("pageId");
        int pageId = 0;
        try{
            pageId = Integer.parseInt(pageIdStr) - 1;
        }catch (Exception e){}

        request.getSession().setAttribute("m_pageId", pageId);

        List<Question> list = questionService.getPartQuestionList(pageId * 20);
        request.getSession().setAttribute("m_questionList", list);
        return "manage";
    }

    /**
     * 已选试题
     * @return
     */
    @RequestMapping(value = "/manual.html")
    public String manual(){
        return "manual";
    }

    /**
     * 添加试题
     * @return
     */
    @RequestMapping(value = "/add.html")
    public String add(){
        return "addQuestion";
    }


}
