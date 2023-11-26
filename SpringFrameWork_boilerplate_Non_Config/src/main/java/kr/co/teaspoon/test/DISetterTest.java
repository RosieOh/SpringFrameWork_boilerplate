package kr.co.teaspoon.test;

import kr.co.teaspoon.dto.Simple3;
import org.springframework.beans.factory.annotation.Autowired;

public class DISetterTest {
    private Simple3 simple3;

    @Autowired
    public void setSimple(Simple3 simple3) {
        this.simple3 = simple3;
    }
}
