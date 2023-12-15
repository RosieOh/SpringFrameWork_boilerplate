package kr.co.boilerplate.service;

import kr.co.boilerplate.domain.Faq;

import java.util.List;

public interface FaqService {
    public List<Faq> faqList() throws Exception;
}
