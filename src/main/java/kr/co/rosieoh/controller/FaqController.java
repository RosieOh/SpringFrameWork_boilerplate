package kr.co.rosieoh.controller;

import kr.co.rosieoh.dto.Faq;
import kr.co.rosieoh.service.FaqService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class FaqController {
    @Autowired
    private FaqService faqService;

    @GetMapping("list.do")
    public String getFaqList(Model model) throws Exception {
        List<Faq> faqList = faqService.faqList();
        model.addAttribute("faqList", faqList);
        return "/faq/faqList";
    }
}
