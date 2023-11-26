package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.*;
import kr.ed.haebeop.domain.Record;
import kr.ed.haebeop.service.FreeService;
import kr.ed.haebeop.service.MemberService;
import kr.ed.haebeop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/free/*")
public class FreeController {

    @Autowired
    private FreeService freeService;

    @Autowired
    private MemberService memberService;

    @Autowired
    HttpSession session;

    @GetMapping("list.do")        //free/list.do
    public String getFreeList(HttpServletRequest request, Model model) throws Exception {
        String type = request.getParameter("type");
        String keyword = request.getParameter("keyword");
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        Page page = new Page();
        page.setSearchType(type);
        page.setSearchKeyword(keyword);
        int total = freeService.totalCount(page);

        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        model.addAttribute("page", page);
        model.addAttribute("curPage", curPage);

        List<Free> commentCount = freeService.freeCommentCount();
        Map<Integer, Integer> commentMap = new HashMap<>();
        for (Free fr : commentCount) {
            commentMap.put(fr.getFno(), fr.getCount());
        }

        List<Free> freeList = freeService.freeList(page);
        model.addAttribute("freeList", freeList);
        List<Free> freeBestList = freeService.freeBestList();
        model.addAttribute("freeBestList", freeBestList);
        List<Free> freeBestCommentList = freeService.freeBestCommentList();
        model.addAttribute("freeBestCommentList", freeBestCommentList);
        for (Free fr : freeBestCommentList) {
            fr.setCount(commentMap.get(fr.getFno()));
        }
        for (Free free : freeList) {
            int fno = free.getFno();
            free.setCount(commentMap.get(fno));
        }
        return "/free/freeList";
    }

    // board와 형태 유사 - domain 조심
    @GetMapping("detail.do")
    public String getfreeDetail(HttpServletRequest request, Model model) throws Exception {
        int fno = Integer.parseInt(request.getParameter("fno"));
        String id = (String) session.getAttribute("sid");
        Free free = freeService.freeDetail(fno);
        Record record = freeService.findRecord(fno, id);
        Member member = memberService.getMember(id);
        model.addAttribute("free", free);
        model.addAttribute("record", record);
        model.addAttribute("member", member);
        List<FreeComment> commentList = freeService.freeCommentList(fno);
        model.addAttribute("commentList", commentList);
        return "/free/freeDetail";
    }

    @PostMapping("detail.do")
    public String commentInsert(HttpServletRequest request, Model model) throws Exception {
        int fno = Integer.parseInt(request.getParameter("fno"));
        FreeComment dto = new FreeComment();
        dto.setContent(request.getParameter("content"));
        dto.setFno(fno);
        dto.setAuthor(request.getParameter("author"));
        freeService.freeCommentInsert(dto);
        return "redirect:detail.do?fno=" + fno;
    }

    @GetMapping("commentDelete.do")
    public String commentDelete(HttpServletRequest request, Model model) throws Exception {
        int fno = Integer.parseInt(request.getParameter("fno"));
        int cno = Integer.parseInt(request.getParameter("cno"));
        freeService.freeCommentDelete(cno);
        return "redirect:detail.do?fno=" + fno;
    }

    @GetMapping("insert.do")
    public String insertForm(HttpServletRequest request, Model model) throws Exception {
        return "/free/freeInsert";
    }

    @PostMapping("insert.do")
    public String freeInsert(HttpServletRequest request, Model model) throws Exception {
        Free dto = new Free();
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));
        dto.setId((String) session.getAttribute("sid"));
        freeService.freeInsert(dto);
        return "redirect:list.do";
    }

    @GetMapping("delete.do")
    public String freeDelete(HttpServletRequest request, Model model) throws Exception {
        int fno = Integer.parseInt(request.getParameter("fno"));
        freeService.freeDelete(fno);
        return "redirect:list.do";
    }

    @GetMapping("edit.do")
    public String editForm(HttpServletRequest request, Model model) throws Exception {
        int fno = Integer.parseInt(request.getParameter("fno"));
        Free dto = freeService.freeDetail(fno);
        model.addAttribute("dto", dto);
        return "/free/freeEdit";
    }

    @PostMapping("edit.do")
    public String freeEdit(HttpServletRequest request, Model model) throws Exception {
        int fno = Integer.parseInt(request.getParameter("fno"));
        Free dto = new Free();
        dto.setFno(fno);
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));
        freeService.freeEdit(dto);
        return "redirect:list.do";
    }

// ========================================================================================

    //ckeditor를 이용한 이미지 업로드
    @RequestMapping(value = "imageUpload.do", method = RequestMethod.POST)
    public void imageUpload(HttpServletRequest request,
                            HttpServletResponse response, MultipartHttpServletRequest multiFile
            , @RequestParam MultipartFile upload) throws Exception {
        // 랜덤 문자 생성
        UUID uid = UUID.randomUUID();

        OutputStream out = null;
        PrintWriter printWriter = null;

        //인코딩
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        try {
            //파일 이름 가져오기
            String fileName = upload.getOriginalFilename();
            byte[] bytes = upload.getBytes();

            //이미지 경로 생성
            String path = request.getRealPath("/resource/uploadckImage/");
            String ckUploadPath = path + uid + "_" + fileName;
            File folder = new File(path);
            System.out.println("path:" + path);    // 이미지 저장경로 console에 확인
            //해당 디렉토리 확인
            if (!folder.exists()) {
                try {
                    folder.mkdirs(); // 폴더 생성
                } catch (Exception e) {
                    e.getStackTrace();
                }
            }

            out = new FileOutputStream(new File(ckUploadPath));
            out.write(bytes);
            out.flush();

            String callback = request.getParameter("CKEditorFuncNum");
            printWriter = response.getWriter();
            String fileUrl = "/pro04_1/free/ckImgSubmit.do?uid=" + uid + "&fileName=" + fileName; // 작성화면

            // 업로드시 메시지 출력
            printWriter.println("{\"filename\" : \"" + fileName + "\", \"uploaded\" : 1, \"url\":\"" + fileUrl + "\"}");
            printWriter.flush();

        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (out != null) {
                    out.close();
                }
                if (printWriter != null) {
                    printWriter.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return;
    }

    //ckeditor를 이용한 서버에 전송된 이미지 뿌려주기
    @RequestMapping(value = "ckImgSubmit.do")
    public void ckSubmit(@RequestParam(value = "uid") String uid
            , @RequestParam(value = "fileName") String fileName
            , HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String path = request.getRealPath("/resource/uploadckImage/");
        System.out.println("path:" + path);
        String sDirPath = path + uid + "_" + fileName;

        File imgFile = new File(sDirPath);

        if (imgFile.isFile()) {
            byte[] buf = new byte[1024];
            int readByte = 0;
            int length = 0;
            byte[] imgBuf = null;

            FileInputStream fileInputStream = null;
            ByteArrayOutputStream outputStream = null;
            ServletOutputStream out = null;

            try {
                fileInputStream = new FileInputStream(imgFile);
                outputStream = new ByteArrayOutputStream();
                out = response.getOutputStream();

                while ((readByte = fileInputStream.read(buf)) != -1) {
                    outputStream.write(buf, 0, readByte);
                }

                imgBuf = outputStream.toByteArray();
                length = imgBuf.length;
                out.write(imgBuf, 0, length);
                out.flush();

            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                outputStream.close();
                fileInputStream.close();
                out.close();
            }
        }
    }

    @PostMapping("rec")
    @ResponseBody
    public int rec(@ModelAttribute Record reco) throws Exception {
        int result = freeService.insertRecord(reco);
        System.out.println("result : " + result);
        //reco.

        return result;
    }
}