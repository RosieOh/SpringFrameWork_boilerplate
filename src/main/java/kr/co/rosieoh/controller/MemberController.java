package kr.co.rosieoh.controller;

import kr.co.rosieoh.dto.Member;
import kr.co.rosieoh.service.MemberService;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;

@Controller
public class MemberController {
    private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

    @Autowired
    private MemberService memberService;

    @Autowired
    HttpSession session;

    BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    // 관리자만 뷰 가능
    @GetMapping("list.do")
    public String memberList(Model model) throws Exception {
        logger.info("Hello Sir~👩‍💼");
        List<Member> memberList = memberService.memberList();
        model.addAttribute("memberList", memberList);
        model.addAttribute("title", "회원 목록");
        return "/member/memberList";
    }

    @GetMapping("detail.do")
    public String memberDetail(String id, Model model) throws Exception {
        logger.info("Hello Sir~👩‍💼");
        Member member = memberService.getMember(id);
        model.addAttribute("member", member);
        return "/member/memberDetail";
    }

    // 일반 회원 본인 개인정보 확인
    @GetMapping("myPage.do")
    public String mypage(Model model) throws Exception {
        logger.info("Hello Sir~👩‍💼");
        String id = (String) session.getAttribute("sid");
        Member member = memberService.getMember(id);
        model.addAttribute("member", member);
        return "/member/mypage";
    }

    // 회원가입
    @GetMapping("term.do")
    public String getAgree(Model model) throws Exception {
        logger.info("Hello Sir~👩‍💼");
        return "/member/agree";
    }

    //회원 가입 - 회원가입폼 페이지 로딩
    @GetMapping("join.do")
    public String getJoin(Model model) throws Exception {
        logger.info("Hello Sir~👩‍💼");
        return "/member/memberInsert";
    }
    //회원 가입 - Ajax로 아이디 중복 체크
    @RequestMapping(value="idCheck.do", method=RequestMethod.POST)
    public void idCheck(HttpServletResponse response, HttpServletRequest request, Model model) throws Exception {
        logger.info("Hello Sir~👩‍💼");
        String id = request.getParameter("id");
        Member mem = memberService.getMember(id);
        boolean result = false;
        if(mem!=null){
            result = false;
        } else {
            result = true;
        }
        JSONObject json = new JSONObject();
        json.put("result", result);
        PrintWriter out = response.getWriter();
        out.println(json.toString());
    }

    // 회원 가입 폼 로딩 (GET 요청)
    @GetMapping("insert-form")
    public String getMemberInsertForm(Model model) {
        logger.info("Hello Sir~👩‍💼");
        // 폼을 로딩하는 로직 추가
        return "/member/memberInsert";
    }

    // 회원 가입 - 회원 가입 처리 (POST 요청)
    @PostMapping("insert.do")
    public String memberWrite(Member member, Model model) throws Exception {

        String ppw = member.getPw();
        String pw = passwordEncoder.encode(ppw);
        member.setPw(pw);
        memberService.memberInsert(member);
        return "redirect:/";
    }

    //로그인 폼 로딩
    @RequestMapping("login.do")
    public String memberLoginForm(Model model) throws Exception {
        logger.info("Hello Sir~👩‍💼");
        return "/member/loginForm";
    }

    //로그인을 컨트롤러에서 처리
    // 로그인 처리
    @PostMapping("signin.do")
    public String memberSignIn(@RequestParam String id, @RequestParam String pw, Model model) throws Exception {
        logger.info("Hello Sir~👩‍💼");
        Member mem = memberService.signIn(id);

        if (mem != null) {
            boolean loginSuccess = passwordEncoder.matches(pw, mem.getPw());
            if (loginSuccess) {
                session.setAttribute("sid", id); // 로그인 세션 설정
                return "redirect:/"; // 로그인 성공 시 메인 페이지로 리다이렉트
            }
        }

        // 로그인 실패 시 에러 메시지를 모델에 추가하고 로그인 페이지로 이동
        model.addAttribute("loginError", "아이디 또는 비밀번호가 일치하지 않습니다.");
        return "/member/loginForm";
    }
    //서비스에서 로그인 로직 처리
    @RequestMapping(value = "loginpro.do", method = RequestMethod.POST)
    public String memberLogin(@RequestParam String id, @RequestParam String pw, Model model) throws Exception {
        boolean ps = memberService.loginCheck(id, pw);
        if (ps) {
            session.setAttribute("sid", id);
            return "redirect:/main";
        } else {
            // 로그인 실패 시 메시지를 모델에 추가
            model.addAttribute("loginError", "아이디와 비밀번호가 일치하지 않습니다.");
            return "/member/loginForm"; // 로그인 실패 시 다시 로그인 페이지로 이동
        }
    }

    @GetMapping("logout.do")
    public String memberLogout(HttpSession session) throws Exception {
        logger.info("Hello Sir~👩‍💼");
        session.invalidate();
        return "redirect:/main";
    }

    // 아이디 찾기 폼 로딩
    @GetMapping("find_id.do")
    public String findIdForm() {
        logger.info("Hello Sir~👩‍💼");
        return  "/member/findIdForm";
    }

    // 아이디 찾기 처리
    @PostMapping("find_id_process.do")
    public String findIdProcess(@RequestParam String email, Model model) throws Exception {
        // 이메일을 기반으ㄹ 아이디를 찾음
        String foundId = memberService.findByEmail(email);
        if (foundId != null) {
            model.addAttribute("foundId", foundId);
            return "/member/foundId";
        } else {
            model.addAttribute("message", "일치하는 이메일 주소로 등록된 아이디가 없습니다.");
            return "/member/findIdForm";
        }
    }

    //회원정보 변경
    //회원정보 변경
    @RequestMapping(value="update.do", method=RequestMethod.POST)
    public String memberUpdate(Member mem, Model model) throws Exception {
        String pwd = "";
        if(mem.getPw().length()<=16) {
            pwd = passwordEncoder.encode(mem.getPw());
            mem.setPw(pwd);
        }
        memberService.memberEdit(mem);
        return "redirect:/";
    }
    //회원 탈퇴
    @RequestMapping(value="delete.do", method = RequestMethod.GET)
    public String memberDelete(@RequestParam String id, Model model, HttpSession session) throws Exception {
        memberService.memberDelete(id);
        session.invalidate();
        return "redirect:/";
    }

    // 비밀번호 찾기 폼 로딩
    @GetMapping("find_pw.do")
    public String findPwForm() {
        return  "/member/findPwForm";
    }

    // 비밀번호 찾기 처리
    @PostMapping("find_pw_process.do")
    public String findPasswordProcess(@RequestParam String id, @RequestParam String email, Model model) throws Exception {
        // 아이디와 이메일을 기반으로 비밀번호를 찾음
        String newPassword = memberService.findPassword(id, email);
        if (newPassword != null) {
            // 새로운 비밀번호를 생성하여 사용자에게 보여줄 수도 있음
            model.addAttribute("newPassword", newPassword);
            return "/member/foundPassword"; // 비밀번호를 찾은 페이지로 이동
        } else {
            model.addAttribute("message", "일치하는 정보로 등록된 비밀번호가 없습니다.");
            return "/member/findPasswordForm"; // 비밀번호를 찾지 못한 경우 다시 비밀번호 찾기 폼으로 이동
        }
    }
}
