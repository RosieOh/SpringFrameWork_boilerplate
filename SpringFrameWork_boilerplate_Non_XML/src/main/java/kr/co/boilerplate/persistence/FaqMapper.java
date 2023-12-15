package kr.co.boilerplate.persistence;

import kr.co.boilerplate.domain.Faq;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface FaqMapper {
    public List<Faq> faqList() throws Exception;
}
