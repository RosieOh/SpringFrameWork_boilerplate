package kr.co.boilerplate.test;//package kr.ed.haebeop.test;

import kr.co.boilerplate.config.RootConfig;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import static org.junit.jupiter.api.Assertions.assertNotNull;

@DisplayName("Root Context 테스트")
@ExtendWith(SpringExtension.class)
@ContextConfiguration(classes = RootConfig.class)
public class RootConfigTest {
/*
    private Sample sample;

    @Autowired
    public RootConfigTest(Sample sample) {
        this.sample = sample;
    }

    @Test
    @DisplayName("Root Context Component scan 확인")
    void rootContextComponentScanTest() {
        assertNotNull(sample);
    }

 */
}