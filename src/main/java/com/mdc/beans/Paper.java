package com.mdc.beans;

import org.springframework.context.annotation.Scope;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by mengdacheng on 2017/5/5.
 */
@Scope("session")
public class Paper {
    private List<Question> questionList = new ArrayList<Question>();

    public List<Question> getQuestionList() {
        return questionList;
    }

    public void setQuestionList(List<Question> questionList) {
        this.questionList = questionList;
    }

    public int getLength(){
        return questionList.size();
    }
}
