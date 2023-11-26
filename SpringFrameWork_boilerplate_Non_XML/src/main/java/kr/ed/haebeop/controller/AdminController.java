package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.*;
import kr.ed.haebeop.persistence.MemberMapper;
import kr.ed.haebeop.service.*;
import kr.ed.haebeop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/admin/")
public class AdminController {
    @Autowired
    private MemberService memberService;

    BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String adminPage(Model model) throws Exception {
        int totMember = memberService.memberCount();
        model.addAttribute("totMember", totMember);
        return "/admin/adminPage";
    }

    @RequestMapping(value = "memberList.do", method = RequestMethod.GET)
    public String userList(Model model) throws Exception {
        List<Member> memberList = memberService.memberList();
        model.addAttribute("memberList", memberList);
        System.out.println(memberList);
        return "/admin/userList";
    }

    @RequestMapping(value="memberDelete.do", method = RequestMethod.GET)
    public String userDelete(@RequestParam String id, Model model, HttpSession session) throws Exception {
        memberService.memberDelete(id);
        session.invalidate();
        return "redirect:/admin/memberList.do";
    }

    @RequestMapping(value = "GetMember", method = RequestMethod.GET)
    public String GetMember(Model model, HttpServletRequest request) throws Exception {
        String id = request.getParameter("id");
        Member member = memberService.getMember(id);
        model.addAttribute("member", member);
        return  "/admin/memberEdit";
    }

    @RequestMapping(value="memberUpdate.do", method = RequestMethod.POST)
    public String memberUpdate(Member member, Model model) throws Exception {
        String pwd = "";
        if(member.getPw().length()<=16) {
            pwd = passwordEncoder.encode(member.getPw());
            member.setPw(pwd);
        }
        memberService.memberEdit(member);
        return "/admin/memberList";
    }

    // 공지사항 관리자 페이지 연결
    @Autowired
    private NoticeService noticeService;

    @RequestMapping(value = "notice/list.do", method = RequestMethod.GET)
    public String getNoticeList(HttpServletRequest request, Model model) throws Exception {
        String type = request.getParameter("type");
        String keyword = request.getParameter("keyword");
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        Page page = new Page();
        page.setSearchType(type);
        page.setSearchKeyword(keyword);
        int total = noticeService.totalCount(page);

        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        model.addAttribute("page", page);
        model.addAttribute("curPage", curPage);

        List<Notice> noticeList = noticeService.noticeList(page);
        model.addAttribute("noticeList", noticeList);

        return "admin/notice/noticeList";
    }


    // 후기 관리자 페이지 연결
    @Autowired
    private ReviewService reviewService;

    @RequestMapping(value = "review/list.do", method = RequestMethod.GET)
    public String getReviewList(HttpServletRequest request, Model model) throws Exception {
        String type = request.getParameter("type");
        String keyword = request.getParameter("keyword");
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        Page page = new Page();
        page.setSearchType(type);
        page.setSearchKeyword(keyword);
        int total = reviewService.totalCount(page);

        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        model.addAttribute("page", page);
        model.addAttribute("curPage", curPage);

        List<Review> reviewList = reviewService.reviewList(page);
        model.addAttribute("reviewList", reviewList);

        return "admin/review/reviewList";
    }
}