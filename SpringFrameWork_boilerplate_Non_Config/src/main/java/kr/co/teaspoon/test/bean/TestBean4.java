package kr.co.teaspoon.test.bean;

import org.springframework.beans.factory.annotation.Value;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.annotation.Resource;
import javax.inject.Inject;
import javax.inject.Named;

public class TestBean4 {
    private int data1;
    private String data2;
    private DataBean3 data3;
    private DataBean4 data4;

    //@Value : 생성자 주입 시 자동으로 주입되지 않는 기본 자료형과 문자열의 값을 설정하는 애노테이션
    public TestBean4(@Value("1004") int data1, @Value("김기태") String data2, DataBean3 data3, DataBean4 data4){
        this.data1 = data1;
        this.data2 = data2;
        this.data3 = data3;
        this.data4 = data4;
    }

    //@PostConstruct : 생성자 호출 후에 자동으로 실행해야할 메서드에 붙여서 사용하는 애노테이션
    @PostConstruct
    public void init5(){
        System.out.println("TestBean4의 init5 메서드");
    }

    //@PreDestroy : 객체가 소멸되기 전에 자동으로 실행해야할 메서드에 지정하는 애노테이션
    @PreDestroy
    public void destroy6(){
        System.out.println("TestBean4의 destroy6 메서드");
    }

    //@Resource : 해당 인스턴스명(id)로 자동 주입하는 애노테이션으로 자바에서 제공하며,
    //@Autowired + @Qualifier를 합친 것과 유사한 기능을 한다.
    //인스턴스명과 id가 서로 다를 경우 name 옵션을 써서 인스턴스명을 지정하여야 한다.

    @Resource
    private DataBean5 data5;

    @Resource(name = "obj6")
    private DataBean5 data6;


    //@Inject : Autowired와 마찬가지로 필드 주입, 생성자 주입, 수정자(Setter) 주입이 가능하도록 한 자바에서 제공하는 애노테이션
    //필드 주입
    @Inject
    private DataBean1 data100;

    //필드 주입2 : 인스턴스명과 id가 서로 다른 경우 @Named 애노테이션을 활용할 수 있음.
    @Inject
    @Named("data2")
    private DataBean2 data200;

    //생성자 주입
    private DataBean3 data300;
    @Inject
    public TestBean4(DataBean3 data300){
        this.data300 =data300;
    }

    //수정자(Setter) 주입
    private DataBean4 data400;
    @Inject
    public void setDataBean4(DataBean4 data400){
        this.data400 = data400;
    }
}
