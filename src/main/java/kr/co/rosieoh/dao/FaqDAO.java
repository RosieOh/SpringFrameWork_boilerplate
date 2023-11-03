package kr.co.rosieoh.dao;
import kr.co.rosieoh.dto.Faq;
import java.util.List;

public interface FaqDAO {
    public List<Faq> faqList() throws Exception;
}
