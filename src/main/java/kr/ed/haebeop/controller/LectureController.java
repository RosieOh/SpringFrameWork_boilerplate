package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.Apply;
import kr.ed.haebeop.domain.Lecture;
import kr.ed.haebeop.domain.Member;
import kr.ed.haebeop.domain.Teacher;
import kr.ed.haebeop.service.LectureService;
import kr.ed.haebeop.service.MemberService;
import kr.ed.haebeop.service.TeacherService;
import kr.ed.haebeop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class LectureController {
    @Autowired
    private LectureService lectureService;

    @Autowired
    private MemberService memberService;

    @Autowired
    private TeacherService teacherService;

    @Autowired
    HttpSession session;

    //------------------------------------------------------------------------------------------------------------------------------------
    @GetMapping("list.do")
    public String getLectureList(HttpServletRequest request, Model model) throws Exception {
        String type = request.getParameter("type");
        String keyword = request.getParameter("keyword");
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
        String sort = request.getParameter("sort");

        Page page = new Page();
        page.setSearchType(type);
        page.setSearchKeyword(keyword);
        int total = lectureService.countLecture(page);

        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        model.addAttribute("page", page);
        model.addAttribute("curPage", curPage);

        List<Lecture> lectureList = lectureService.getLectureList(page);
        if("asc".equals(sort)) {
            lectureList = lectureService.getLectureAsc(page);
        } else if("desc".equals(sort)) {
            lectureList = lectureService.getLectureDesc(page);
        }

        Map<Integer, Boolean> lectureMapping = new HashMap<>();
        for (Lecture lecture : lectureList) {
            int lectureNumber = lecture.getLec_number();
            int totalLectureNumber = lecture.getTot_number();
            boolean DeadLineLecture = lectureNumber >= totalLectureNumber * 0.9 && lectureNumber < totalLectureNumber;
            lectureMapping.put(lecture.getLno(), DeadLineLecture);
        }

        model.addAttribute("lecutureList", lectureList);
        model.addAttribute("lecuremapping", lectureMapping);
        return "/lecture/lectureList";
    }

    @GetMapping("getLecture")
    public String getLecture(@RequestParam int lno, Model model, HttpServletRequest request) throws Exception {
        Lecture lecture = lectureService.getLecture(lno);
        model.addAttribute("lecture", lecture);
        Apply apply = new Apply();
        if (session.getAttribute("sid") != null) {
            String id = (String) session.getAttribute("sid");
            apply.setId(id);
            apply.setLno(lno);
            boolean doApply = false;
            if (lectureService.doApply(apply) != null) {
                doApply = true;
            }
            model.addAttribute("doApply", doApply);
        }
        return "/lecture/getLecture";
    }

    @GetMapping("apply")
    public String signInCourse(@RequestParam int lno, @RequestParam int book, Model model) throws Exception {
        Lecture lecture = lectureService.getLecture(lno);
        String id = (String) session.getAttribute("sid");
        Member member = memberService.getMember(id);
        model.addAttribute("lecture", lecture);
        model.addAttribute("book", book);
        model.addAttribute("member", member);
        return "/lecture/applyLecture";
    }

    @PostMapping("apply")
    @Transactional
    public String insertApply(HttpServletRequest request, Model model) throws Exception {
        Apply apply = new Apply();
        apply.setLno(Integer.parseInt(request.getParameter("lno")));
        apply.setId(request.getParameter("id"));
        apply.setA_price(Integer.parseInt(request.getParameter("a_price")));
        apply.setBname("bname");
        apply.setApply_mn(Integer.parseInt(request.getParameter("apply_mn")));
        apply.setBook(Boolean.parseBoolean(request.getParameter("book")));

        int a_price = Integer.parseInt(request.getParameter("a_price"));
        int pt = Integer.parseInt(request.getParameter("pt"));
        lectureService.insertApply(apply);
        lectureService.updateStudentNumber(apply.getAno());
        String id = (String) session.getAttribute("sid");
        Member member = new Member();
        member.setId(id);
        member.setPt(pt);
        lectureService.updateMemberPoint(member);
        return "redirect:/lecture/mypageLecture?complete=0";
    }

    @GetMapping("mypageLecture")
    public String memberApplyLecture(Model model, HttpServletRequest request, int complete) throws Exception {
        String id = (String) session.getAttribute("sid");
        Apply apply = new Apply();

        if (complete == 0) {
            apply.setId(id);
            apply.setComplete(false);
            List<Apply> getApplyList = lectureService.getApplyList(apply);
            Member member = lectureService.getMemberName(id);
            model.addAttribute("getApplyList", getApplyList);
            model.addAttribute("member", member);

            int size = lectureService.getApplyList(apply).size();
            model.addAttribute("size", size);
            apply.setComplete(true);
            size += lectureService.getApplyList(apply).size();

            if(size != 0) {
                int applyNumber = (int) Math.ceil(100.0 / (double) size);
                model.addAttribute("applyNumber", applyNumber);
            }
            return "/lecture/mypageLecture";
        } else {
            apply.setId(id);
            apply.setComplete(true);
            List<Apply> getApplyList = lectureService.getApplyList(apply);
            Member member = lectureService.getMemberName(id);
            model.addAttribute("getApplyList", getApplyList);
            model.addAttribute("member", member);
            int size = lectureService.getApplyList(apply).size();
            model.addAttribute("size", size);
            apply.setComplete(false);
            size += lectureService.getApplyList(apply).size();

            if (size != 0) {
                int applyNumber = (int) Math.ceil(100.0 / (double) size);
                model.addAttribute("applyNumber", applyNumber);
            }
            return "/lecture/completLecture";
        }
    }

    @PostMapping("complete")
    public String completeLecture(int ano) throws Exception {
        lectureService.endLecture(ano);
        return "redirect:/lecture/mypageLecture?endLecture=0";
    }

    @PostMapping("cancelLecture")
    public String canceLecture(int ano) throws Exception {
        lectureService.cancelApply(ano);
        return "redirect:/lecture/mypageLecture?completeLecture=0";
    }

    @GetMapping("insert.do")
    public String insertForm(HttpServletRequest request, Model model) throws Exception {
        List<Teacher> teacherList = teacherService.teacherList();
        model.addAttribute("teacherList", teacherList);
        return "/lecture/lectureInsert";
    }

    // 강사님 이미지 3개 추가요
    @PostMapping("insert.do")
    public String insertLecture(HttpServletRequest request, Model model) throws Exception {
        MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
        MultipartFile imgFile1 = multipartHttpServletRequest.getFile("imgsrc1");
        MultipartFile imgFile2 = multipartHttpServletRequest.getFile("imgsrc2");
        MultipartFile imgFile3 = multipartHttpServletRequest.getFile("imgsrc3");

        Lecture lecture = new Lecture();
        lecture.setLname(multipartHttpServletRequest.getParameter("title"));
        lecture.setPrice(Integer.parseInt(multipartHttpServletRequest.getParameter("price")));
        lecture.setSdate(multipartHttpServletRequest.getParameter("sdate"));
        lecture.setEdate(multipartHttpServletRequest.getParameter("edate"));
        lecture.setTot_number(Integer.parseInt(multipartHttpServletRequest.getParameter("tot_number")));
        lecture.setLec_number(0);
        lecture.setT_name(multipartHttpServletRequest.getParameter("t_name"));
        lecture.setContent(multipartHttpServletRequest.getParameter("content"));
        lecture.setBname(multipartHttpServletRequest.getParameter("bname"));
        lecture.setBprice(Integer.parseInt(multipartHttpServletRequest.getParameter("bprice")));

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyMMddHHmmssSSS");
        String[] timeFileNames = new String[2];

        if(!imgFile1.isEmpty()) {   // 문자열의 길이가 0인 경우에, true를 리턴
            System.out.println("imgFile1.getOriginFileName():" + imgFile1.getOriginalFilename());
            String realFileName = imgFile1.getOriginalFilename();
            String[] names = realFileName.split("\\.");
            String timeFileName = names[0] + "_" + simpleDateFormat.format(new Date()) +"," + names[1];
            timeFileNames[0] = timeFileName;
            lecture.setImgsrc1(timeFileName);
        }

        if(!imgFile2.isEmpty()) {   // 문자열의 길이가 0인 경우에, true를 리턴
            System.out.println("imgFile2.getOriginFileName():" + imgFile2.getOriginalFilename());
            String realFileName = imgFile2.getOriginalFilename();
            String[] names = realFileName.split("\\.");
            String timeFileName = names[0] + "_" + simpleDateFormat.format(new Date()) +"," + names[1];
            timeFileNames[1] = timeFileName;
            lecture.setImgsrc2(timeFileName);
        }

        if(!imgFile3.isEmpty()) {   // 문자열의 길이가 0인 경우에, true를 리턴
            System.out.println("imgFile3.getOriginFileName():" + imgFile1.getOriginalFilename());
            String realFileName = imgFile3.getOriginalFilename();
            String[] names = realFileName.split("\\.");
            String timeFileName = names[0] + "_" + simpleDateFormat.format(new Date()) +"," + names[1];
            timeFileNames[1] = timeFileName;
            lecture.setImgsrc3(timeFileName);
        }

        lectureService.insertLecture(lecture);

        String uploadServerComputer = request.getRealPath("/resources/upload/");
        try {
            if (!imgFile1.isEmpty()) {
                imgFile1.transferTo(new File(uploadServerComputer + timeFileNames[0]));
            }
            if (!imgFile2.isEmpty()) {
                imgFile2.transferTo(new File(uploadServerComputer + timeFileNames[1]));
            }
            if (!imgFile3.isEmpty()) {
                imgFile3.transferTo(new File(uploadServerComputer + timeFileNames[2]));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "redirect:list.do";
    }

    @GetMapping("delete.do")
    public String deleteLecture(HttpServletRequest request, Model model) throws Exception {
        int lno = Integer.parseInt(request.getParameter("lno"));
        lectureService.deleteLecture(lno);
        return "redirect:list.do";
    }

    @GetMapping("schedule.do")
    public String lectureScheduleList(HttpServletRequest request, Model model) throws Exception {
        List<Lecture> lecture = lectureService.lectureList();
        request.setAttribute("lecture", lecture);
        return "/lecture/lectureScheduleList";
    }

    @PostMapping("list.do")
    public String applyFilters(HttpServletRequest request, Model model) throws Exception {
        // 요청 파라미터에서 강좌 필터링 옵션(excludeFull, excludeFinished)을 읽어옵니다.
        String excludeFullParameter = request.getParameter("excludeFull");
        String excludeFinishedParameter = request.getParameter("excludeFinished");

        // 문자열로 전달된 필터링 옵션을 Boolean 값으로 변환합니다.
        Boolean excludeFull = Boolean.parseBoolean(excludeFullParameter);
        Boolean excludeFinished = Boolean.parseBoolean(excludeFinishedParameter);

        // 요청 파라미터에서 검색 조건(type), 검색어(keyword), 현재 페이지(curPage) 값을 읽어옵니다.
        String type = request.getParameter("type");
        String keyword = request.getParameter("keyword");
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        // Page 객체를 생성하여 검색 조건과 현재 페이지 정보를 설정합니다.
        Page page = new Page();
        page.setSearchType(type);
        page.setSearchKeyword(keyword);

        // 강좌 목록을 저장할 리스트를 초기화합니다.
        List<Lecture> filterLectureList = new ArrayList<>();

        if (excludeFull && excludeFinished) {
            // '마감임박 + 수강 가능' 필터링을 선택한 경우

            // 수강 가능한 강좌와 마감임박한 강좌를 따로 가져와서 교집합을 구합니다.
            List<Lecture> tempList1 = lectureService.notFullLecture();
            List<Lecture> tempList2 = lectureService.unFinishedLecture();
            List<Lecture> intersection = new ArrayList<>(tempList1);
            intersection.retainAll(tempList2);

            int total = intersection.size();
            page.makeBlock(curPage, total);
            page.makeLastPageNum(total);
            page.makePostStart(curPage, total);

            // 필터링된 강좌 목록을 설정합니다.
            filterLectureList = intersection;
        } else if (excludeFull) {
            // '수강 가능' 필터링을 선택한 경우

            int total = lectureService.notFullLecture().size();
            page.makeBlock(curPage, total);
            page.makePostStart(curPage, total);
            page.makeLastPageNum(total);

            // 필터링된 강좌 목록을 설정합니다.
            filterLectureList = lectureService.getNotFullLecture(page);
        } else if (excludeFinished) {
            // '마감임박' 필터링을 선택한 경우

            int total = lectureService.unFinishedLecture().size();
            page.makeBlock(curPage, total);
            page.makePostStart(curPage, total);
            page.makeLastPageNum(total);

            // 필터링된 강좌 목록을 설정합니다.
            filterLectureList = lectureService.getUnFinishedLecture(page);
        } else {
            // 어떤 필터도 선택하지 않은 경우

            int total = lectureService.countLecture(page);
            page.makeBlock(curPage, total);
            page.makePostStart(curPage, total);
            page.makeLastPageNum(total);

            // 모든 강좌를 표시합니다.
            filterLectureList = lectureService.getLectureList(page);
        }

        // 필터링 및 검색 결과를 모델에 추가합니다.
        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        model.addAttribute("page", page);
        model.addAttribute("curPage", curPage);
        model.addAttribute("lectureList", filterLectureList);

        // 각 강좌에 대해 마감 임박 여부를 계산하여 lectureMapping에 저장합니다.
        Map<Integer, Boolean> lectureMapping = new HashMap<>();
        for (Lecture lecture : filterLectureList) {
            int lectureNumber = lecture.getLec_number();
            int totalLectureNumber = lecture.getTot_number();
            boolean isClosingSoon = lectureNumber >= totalLectureNumber * 0.9 && lectureNumber < totalLectureNumber;
            lectureMapping.put(lecture.getLno(), isClosingSoon);
        }
        model.addAttribute("lectureMapping", lectureMapping);

        // "/lecture/lectureList" 뷰로 이동하며, 필터링된 강좌 목록을 표시합니다.
        return "/lecture/lectureList";
    }
}
