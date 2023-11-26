package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Faq;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface FaqMapper {
    public List<Faq> faqList() throws Exception;
}
