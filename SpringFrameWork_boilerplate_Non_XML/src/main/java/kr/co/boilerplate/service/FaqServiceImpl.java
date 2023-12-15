package kr.co.boilerplate.service;

import kr.co.boilerplate.persistence.FaqMapper;
import kr.co.boilerplate.domain.Faq;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FaqServiceImpl implements FaqService {

    @Autowired
    private FaqMapper faqMapper;


    @Override
    public List<Faq> faqList() throws Exception {
        return faqMapper.faqList();
    }
}
