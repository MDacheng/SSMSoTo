package com.mdc.beans;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by mengdacheng on 2017/5/5.
 */
public class Paper {
    private int paperId;
    private List<Question> questionList = new ArrayList<Question>();

    public int getPaperId() {
        return paperId;
    }

    public void setPaperId(int paperId) {
        this.paperId = paperId;
    }

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
