package com.mdc.web;

import com.mdc.beans.Paper;
import com.mdc.beans.Question;
import com.mdc.dao.QuestionDao;
import com.mdc.service.PaperService;
import com.mdc.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by mengdacheng on 2017/5/5.
 */
@Controller
public class PaperController {

    @Autowired
    private QuestionService questionService;

    @Autowired
    private PaperService paperService;

    /**
     * 向试卷中添加试题或者取消添加试题
     * @param request
     * @param response
     * @throws IOException
     */
    @RequestMapping("/select.html")
    public void select(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("selectId"));
        String method = (String) request.getParameter("method");

        if(method.equals("add")){
            paperService.addQuestion(questionService.getQuestion(id));
        }else{
            paperService.removeQuestion(id);
        }
        response.setContentType("text/javascript");
        response.getWriter().print("{\"selectCount\":" + paperService.getQuestionCount() + "}");
        request.getSession().setAttribute("selectList", paperService.getQuestionList());
    }

    @RequestMapping("/remove.html")
    public String remove(HttpServletRequest request){
        int id = Integer.parseInt(request.getParameter("selectId"));
        paperService.removeQuestion(id);
        request.getSession().setAttribute("selectList", paperService.getQuestionList());
        return "manual";
    }

    @RequestMapping("/auto.html")
    public String autoAdd(HttpServletRequest request){
        List<Question> selectList = questionService.getRandomList(20);
        request.getSession().setAttribute("selectList", selectList);
        paperService.setQuestionList(selectList);
        return "main";
    }
}
