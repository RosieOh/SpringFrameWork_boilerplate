package kr.co.boilerplate.controller;

import kr.co.boilerplate.domain.Comment;
import kr.co.boilerplate.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/comment/")

public class CommentController {

    @Autowired
    private CommentService commentService; // CommentService 타입의 빈(Bean)을 자동으로 주입받습니다.

    @GetMapping("insert.do") // HTTP GET 요청에 대한 처리 메서드를 지정합니다.
    public String insertForm(HttpServletRequest request, Model model) throws Exception {
        return "/review/commentInsert"; // "/review/commentInsert" 뷰로 이동하도록 설정합니다.
    }

    @PostMapping("insert.do") // HTTP POST 요청에 대한 처리 메서드를 지정합니다.
    public String commentInsert(HttpServletRequest request, Model model) throws Exception {
        Comment comment = new Comment(); // Comment 객체를 생성합니다.

        // 요청 파라미터에서 값을 추출하여 Comment 객체에 설정합니다.
        comment.setAuthor(request.getParameter("author"));
        comment.setContent(request.getParameter("content"));
        comment.setPar(Integer.parseInt(request.getParameter("par")));

        // CommentService를 사용하여 Comment를 데이터베이스에 저장합니다.
        commentService.commentInsert(comment);

        // "redirect:/review/detail.do?no="로 리다이렉트하며, "no" 파라미터를 추가하여 상세 페이지로 이동합니다.
        return "redirect:/review/detail.do?no=" + request.getParameter("par");
    }

    @GetMapping("delete.do") // HTTP GET 요청에 대한 처리 메서드를 지정합니다.
    public ModelAndView commentDelete(HttpServletRequest request, Model model) throws Exception {
        int dno = Integer.parseInt(request.getParameter("dno")); // "dno" 파라미터를 추출합니다.
        int no = Integer.parseInt(request.getParameter("no")); // "no" 파라미터를 추출합니다.

        // CommentService를 사용하여 댓글을 삭제합니다.
        commentService.commentDelete(dno);

        model.addAttribute("no", no); // "no" 파라미터를 모델에 추가합니다.

        ModelAndView mav = new ModelAndView(); // ModelAndView 객체를 생성합니다.
        mav.setView(new RedirectView(request.getContextPath() + "/review/detail.do")); // 리다이렉트 뷰를 설정합니다.

        return mav; // ModelAndView 객체를 반환하여 리다이렉트 처리를 수행합니다.
    }
}
