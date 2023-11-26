package kr.co.teaspoon.test;

import kr.co.teaspoon.dto.Simple2;
import org.springframework.beans.factory.annotation.Autowired;

public class DIConstructorTest {

    private Simple2 simple2;

    @Autowired
    public DIConstructorTest(Simple2 simple2) {
        this.simple2 = simple2;
    }
}
