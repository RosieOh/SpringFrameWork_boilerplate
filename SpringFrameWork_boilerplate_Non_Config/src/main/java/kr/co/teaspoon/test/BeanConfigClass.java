package kr.co.teaspoon.test;

import kr.co.teaspoon.test.bean.*;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

//xxxxxBean.xml을 대신하는 Configuration 클래스 => xml로 빈(Bean)을 만드는 것을 자바 클래스로 만들 수 있음.
@Configuration
public class BeanConfigClass {

    @Bean
    public TestBean1 testBean1() {
        return new TestBean1();
    }

    @Bean
    public TestBean2 testBean2() {
        return new TestBean2(null);
    }

    @Bean
    public DataBean1 data1() {
        return new DataBean1();
    }

    @Bean
    public DataBean2 data2() {
        return new DataBean2();
    }

    @Bean
    public DataBean3 data3() {
        return new DataBean3();
    }

    @Bean
    public DataBean4 data4() {
        return new DataBean4();
    }

    @Bean
    public DataBean5 data5() {
        return new DataBean5();
    }
}
