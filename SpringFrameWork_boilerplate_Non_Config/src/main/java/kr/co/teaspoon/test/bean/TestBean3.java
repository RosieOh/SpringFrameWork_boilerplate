package kr.co.teaspoon.test.bean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

public class TestBean3 {
    //@Qualifier : @Autowired 로 주입시 객체를 찾지 못하는 경우 강제로 주입할 객체의 이름을 지정하는 애노테이션

    @Autowired
    @Qualifier("obj3")
    private DataBean3 data3;

    @Autowired(required = false)        //인스턴스 중복 무시
    @Qualifier("obj4")
    private DataBean4 data4;
}
