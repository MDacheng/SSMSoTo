package com.mdc.dao;

import com.mdc.beans.Question;

import java.util.List;

/**
 * Created by mengdacheng on 2017/5/3.
 */
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
