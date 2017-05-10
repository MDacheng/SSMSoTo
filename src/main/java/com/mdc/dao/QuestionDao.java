package com.mdc.dao;

import com.mdc.beans.Question;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by mengdacheng on 2017/5/3.
 */
@Component
@MapperScan
public interface QuestionDao {
    Question getQuestion(int id);
    void addQuestion(Question question);
    void updateQuestion(Question question);
    void deleteQuestion(int id);
    List<Question> getAllQuestion();
    List<Question> getPartQuestion(int start);
    int getCount();
    List<Question> getRandomQuestion(int count);
}
