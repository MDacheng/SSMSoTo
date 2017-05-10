package com.mdc.service;

import com.mdc.beans.Paper;
import com.mdc.beans.Question;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created by mengdacheng on 2017/5/5.
 */
@Service
public class PaperService {

    @Autowired
    private Paper paper;

    public void addQuestion(Question question){
        paper.getQuestionList().add(question);
    }

    public void removeQuestion(int id){
        List<Question> questionList = paper.getQuestionList();
        for(int i = 0; i < questionList.size(); i++){
            if(id == questionList.get(i).getId()){
                questionList.remove(i);
                break;
            }
        }
        System.out.print(questionList.size());
    }
    public void adjustQuestion(Question question){
        List<Question> questionList = paper.getQuestionList();
        for(int i = 0; i < questionList.size(); i++){
            if(question.getId() == questionList.get(i).getId()){
                questionList.set(i, question);
            }
        }
    }

    public int getQuestionCount(){
        return paper.getLength();
    }

    public List<Question> getQuestionList(){
        return paper.getQuestionList();
    }
    public void setQuestionList(List<Question> list){
        paper.setQuestionList(list);
    }
}
