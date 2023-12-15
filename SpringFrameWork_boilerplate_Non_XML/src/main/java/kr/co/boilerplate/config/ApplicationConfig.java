package kr.co.boilerplate.config;
//주입 설정 및 빈 등록 파일 : ApplicationConfig.java
import kr.co.boilerplate.repository.FileRepository;
import kr.co.boilerplate.repository.FileRepositoryImpl;
import kr.co.boilerplate.service.FileService;
import kr.co.boilerplate.service.FileServiceImpl;
import kr.co.boilerplate.service.MemberService;
import kr.co.boilerplate.service.MemberServiceImpl;
import kr.ed.haebeop.repository.*;
import kr.ed.haebeop.service.*;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ComponentScan;

//컨트롤러나 서비스, 맴퍼, 레포시토리에서 사용할 Bean을 등록
@Configuration
@ComponentScan(basePackages = "kr.ed.haebeop")
public class ApplicationConfig {

    // Member
    @Bean
    public MemberService memberService(){ return new MemberServiceImpl(); }

    // file
    @Bean
    public FileRepository fileRepository() {return new FileRepositoryImpl();}
    @Bean
    public FileService fileService() { return new FileServiceImpl(); }

}