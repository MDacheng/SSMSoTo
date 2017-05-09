package com.mdc.web;

import com.mdc.beans.Question;
import com.mdc.dao.QuestionDao;
import com.mdc.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by mengdacheng on 2017/5/4.
 */
@Controller
public class QuestionController {

    @Autowired
    private QuestionService questionService;

    @RequestMapping("/addQuestion.html")
    public void addQuestion(Question question){
        questionService.addQuestion(question);
    }

    @RequestMapping("/modify.html")
    public String modify(HttpServletRequest request){
        int questionId = Integer.parseInt(request.getParameter("questionId"));
        Question question = questionService.getQuestion(questionId);
        request.getSession().setAttribute("curQuestion", question);
        return "updateQuestion";
    }

    @RequestMapping("/delete.html")
    public String delete(HttpServletRequest request){
        int questionId = Integer.parseInt(request.getParameter("questionId"));
        questionService.deleteQuestion(questionId);
        updateQuestionList(request);
        return "manage";
    }

    @RequestMapping("/updateQuestion.html")
    public String update(HttpServletRequest request, Question question){
        System.out.println(question.getContent());
        Question curQuestion = (Question)request.getSession().getAttribute("curQuestion");
        question.setId(curQuestion.getId());
        questionService.updateQuestion(question);
        updateQuestionList(request);
        return "manage";
    }

    private void updateQuestionList(HttpServletRequest request){
        int pageId = 0;
        try{
            String pageIdStr = (String) request.getSession().getAttribute("pageId");
            pageId = Integer.parseInt(pageIdStr);
        }catch (Exception e){}
        List<Question> questionList = questionService.getPartQuestionList(pageId * 20);
        request.getSession().setAttribute("m_questionList", questionList);
    }
}
