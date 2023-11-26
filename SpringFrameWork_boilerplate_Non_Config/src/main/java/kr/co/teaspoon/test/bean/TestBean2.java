package kr.co.teaspoon.test.bean;

import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class TestBean2 {

    /*
    @Autowired 애노테이션 : 객체 타입을 통해 빈 객체를 자동으로 주입하는 스프링프레임워크에서만 사용되는 애노테이션으로
    필드 주입, 수정자(Setter) 주입, 생성자 주입 등이 있으며,
    필드 주입이나 수정자(Setter)의 경우 반드시 기본 생성자가 정의되어 있어야 한다.
     */

    //필드 주입 : 현재 클래스인 TestBean2의 한 멤버 필드로 주입됨.
    @Autowired
    private DataBean1 data1;

    //required = false 옵션을 지정할 경우 인스턴스 중복을 무시할 수 있음.
    @Autowired(required = false)
    private DataBean2 data2;

    //세터(Setter) 주입 : 아래의 setDataBean3 메서드에 의하여 DataBean3 클래스가 현재 TestBean2 클래스에 주입되고 있음.
    private DataBean3 data3;

    @Autowired
    public void setDataBean3(DataBean3 data3){
        this.data3 = data3;
    }

    //세터(Setter) 주입 : 롬복의 세터(Setter)에 의한 주입
    @Setter(onMethod_ = {@Autowired})
    private DataBean4 data4;

    //생성자에 의한 주입 : 현재 클래스의 생성자 함수인 TestBean2에 의해 DataBean5가 주입되고 있음.
    private DataBean5 data5;
    @Autowired
    public TestBean2(DataBean5 data5){
        this.data5 = data5;
    }
}
