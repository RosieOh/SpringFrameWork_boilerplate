package kr.co.rosieoh.controller;

import kr.co.rosieoh.dto.Notice;
import kr.co.rosieoh.dto.NoticeComment;
import kr.co.rosieoh.service.NoticeService;
import kr.co.rosieoh.util.Page;
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
import java.io.*;
import java.util.List;
import java.util.UUID;

@Controller
public class NoticeController {

    @Autowired
    private NoticeService noticeService;

    @GetMapping("list.do")
    public String getNoticeList(HttpServletRequest request, Model model) throws Exception {
        String type = request.getParameter("type");
        String keyword = request.getParameter("keyword");
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        Page page = new Page();
        page.setSearchKeyword(keyword);
        page.setSearchType(type);
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

        List<Notice> selectComment = noticeService.selectComment();
        model.addAttribute("selectComment", selectComment);

        List<Notice> commentCount = noticeService.commentCount();
        model.addAttribute("commentCount", commentCount);

        return "/notice/noticeList";
    }

    @GetMapping("detail.do")
    public String getNoticeDetail(HttpServletRequest request, Model model) throws Exception {
        int nno = Integer.parseInt(request.getParameter("nno"));
        Notice dto = noticeService.noticeDetail(nno);
        List<NoticeComment> commentList = noticeService.noticeCommentList(nno);
        model.addAttribute("dto", dto);
        model.addAttribute("commentList", commentList);
        return "/notice/noticeDetail";
    }

    @PostMapping("detail.do")
    public String commentInsert(HttpServletRequest request, Model model) throws Exception {
        int nno = Integer.parseInt(request.getParameter("nno"));
        NoticeComment dto = new NoticeComment();
        dto.setContent(request.getParameter("content"));
        dto.setNno(nno);
        dto.setAuthor(request.getParameter("author"));
        noticeService.commentInsert(dto);
        return "redirect:detail.do?nno="+nno;
    }

    @GetMapping("insert.do")
    public String insertForm(HttpServletRequest request, Model model) throws Exception {
        return "/notice/noticeInsert";
    }

    @PostMapping("insert.do")
    public String noticeInsert(HttpServletRequest request, Model model) throws Exception {
        Notice dto = new Notice();
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));
        noticeService.noticeInsert(dto);
        return "redirect:list.do";
    }

    @GetMapping("delete.do")
    public String noticeDelete(HttpServletRequest request, Model model) throws Exception {
        int nno = Integer.parseInt(request.getParameter("nno"));
        noticeService.noticeDelete(nno);
        return "redirect:list.do";
    }

    @GetMapping("commentDelete.do")
    public String commentDelete(HttpServletRequest request, Model model) throws Exception {
        int nno = Integer.parseInt(request.getParameter("nno"));
        int cno = Integer.parseInt(request.getParameter("cno"));
        noticeService.commentDelete(cno);
        return "redirect:detail.do?nno="+nno;
    }

    @GetMapping("edit.do")
    public String editForm(HttpServletRequest request, Model model) throws Exception {
        int nno = Integer.parseInt(request.getParameter("nno"));
        Notice dto = noticeService.noticeDetail(nno);
        model.addAttribute("dto", dto);
        return "/notice/noticeEdit";
    }

    @PostMapping("edit.do")
    public String noticeEdit(HttpServletRequest request, Model model) throws Exception {
        int nno = Integer.parseInt(request.getParameter("nno"));
        Notice dto = new Notice();
        dto.setNno(nno);
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));
        noticeService.noticeEdit(dto);
        return "redirect:list.do";
    }

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
            //String path = "C:\\hansun\\springframework\\pro31\\src\\main\\webapp\\resources\\upload" + "ckImage/";    // 이미지 경로 설정(폴더 자동 생성)
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
            out.flush(); // outputStram에 저장된 데이터를 전송하고 초기화

            String callback = request.getParameter("CKEditorFuncNum");
            printWriter = response.getWriter();
            String fileUrl = "/team23/free/ckImgSubmit.do?uid=" + uid + "&fileName=" + fileName; // 작성화면

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

        //서버에 저장된 이미지 경로
        //String path = "C:\\hansun\\springframework\\pro31\\src\\main\\webapp\\resources\\upload" + "ckImage/";    // 저장된 이미지 경로
        String path = request.getRealPath("/resource/uploadckImage/");
        System.out.println("path:" + path);
        String sDirPath = path + uid + "_" + fileName;

        File imgFile = new File(sDirPath);

        //사진 이미지 찾지 못하는 경우 예외처리로 빈 이미지 파일을 설정한다.
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
}
