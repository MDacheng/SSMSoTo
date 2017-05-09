package com.mdc.service;

import com.mdc.beans.Question;
import com.mdc.dao.QuestionDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by mengdacheng on 2017/5/5.
 */
@Service
public class QuestionService {
    @Autowired
    private QuestionDao questionDao;

    public void addQuestion(Question question){
        questionDao.addQuestion(question);
    }

    public Question getQuestion(int id){
        return questionDao.getQuestion(id);
    }

    public List<Question> getPartQuestionList(int start){
        return questionDao.getPartQuestion(start);
    }

    public List<Question> getRandomList(int count){
        return questionDao.getRandomQuestion(count);
    }

    public void deleteQuestion(int id){
        questionDao.deleteQuestion(id);
    }

    public void updateQuestion(Question question){
        questionDao.updateQuestion(question);
    }

    public int getCount(){
        return questionDao.getCount();
    }
}
