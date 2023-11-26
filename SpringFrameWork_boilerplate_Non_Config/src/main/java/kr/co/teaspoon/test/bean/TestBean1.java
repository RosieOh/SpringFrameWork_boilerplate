package kr.co.teaspoon.test.bean;

import org.springframework.beans.factory.annotation.Required;

public class TestBean1 {
    private int data1;

    public int getData1() {
        return data1;
    }

    //@Required 애노테이션으로 주입할 경우에는 Setter에 의하여 주입하여야만 한다.
    @Required
    public void setData1(int data1){
        this.data1 = data1;
    }
}
