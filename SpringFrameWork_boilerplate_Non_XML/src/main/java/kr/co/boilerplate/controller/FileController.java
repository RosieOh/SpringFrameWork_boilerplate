package kr.co.boilerplate.controller;

import kr.co.boilerplate.util.Page;
import kr.co.boilerplate.domain.FileBoard;
import kr.co.boilerplate.domain.FileDTO;
import kr.co.boilerplate.domain.FileVO;
import kr.co.boilerplate.service.FileService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.annotation.*;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.*;

@Controller
@RequestMapping("/file/*")
public class FileController {

    private static final Logger log = LoggerFactory.getLogger(FileController.class);

    @Resource(name="uploadPath")
    String uploadPath;

    @Autowired
    private FileService fileService;

    @Autowired
    HttpSession session;

    @GetMapping("fileupload1.do")
    public String fileUploadForm(){
        return "/file/fileupload";
    }

    @PostMapping("fileupload1.do")
    public String fileUpload1(MultipartHttpServletRequest files, HttpServletRequest req, Model model) throws Exception {

        //파라미터 분리
        Enumeration<String> e = files.getParameterNames();
        Map map = new HashMap();
        while (e.hasMoreElements()) {
            String name = e.nextElement();
            String value = files.getParameter(name);
            map.put(name, value);
        }

        //제목 및 내용 분리
        FileBoard board = new FileBoard();
        board.setTitle((String) map.get("title"));
        board.setContent((String) map.get("content"));
        String devFolder = uploadPath + "/resources/upload";
        String uploadFolder = req.getRealPath("/resources/upload");
        log.info("-----------------------------------");
        log.info(" 현재 프로젝트 홈 : "+req.getContextPath());
        log.info(" dispatcher-servlet에서 지정한 경로 : "+uploadPath);
        log.info(" 요청 URL : "+req.getServletPath());
        log.info(" 프로젝트 저장 경로 : "+req.getRealPath("/resources/upload"));
        //여러 파일 반복 저장
        List<FileDTO> fileList = new ArrayList<>();
        Iterator<String> it = files.getFileNames();
        while(it.hasNext()){
            String paramfName = it.next();
            MultipartFile file = files.getFile(paramfName);
            log.info("-----------------------------------");
            log.info("name : "+file.getOriginalFilename());
            log.info("size : "+file.getSize());
            log.info("path : ");

            File saveFile = new File(uploadFolder, file.getOriginalFilename()); //실제 파일 객체 생성
            //File devFile = new File(devFolder, file.getOriginalFilename()); //개발자용 컴퓨터에 해당파일 생성

            FileDTO data = new FileDTO();
            data.setSaveFolder(uploadFolder);
            data.setOriginFile(file.getOriginalFilename());
            data.setSaveFile(saveFile.getPath());
            data.setFileSize(file.getSize());
            Date today = new Date();
            data.setUploadDate(today.toString());
            fileList.add(data);
            try {
                file.transferTo(saveFile);  //실제 디렉토리에 해당파일 저장
                //file.transferTo(devFile); //개발자용 컴퓨터에 해당파일 저장
            } catch(IllegalStateException e1){
                log.info(e1.getMessage());
            } catch(IOException e2){
                log.info(e2.getMessage());
            }
        }

        FileVO fileboard = new FileVO();
        fileboard.setFileList(fileList);
        fileboard.setFileBoard(board);

        fileService.insertFileboard(fileboard);

        return "redirect:list.do";
    }

    @GetMapping("list.do")
    public String getFileList(HttpServletRequest request, Model model) throws Exception {
        String type = request.getParameter("type");
        String keyword = request.getParameter("keyword");
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        Page page = new Page();
        page.setSearchType(type);
        page.setSearchKeyword(keyword);
        int total = fileService.totalCount(page);

        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        model.addAttribute("page", page);
        model.addAttribute("curPage", curPage);


        List<FileVO> fileboardList = fileService.getFileList(page);
        model.addAttribute("fileboardList", fileboardList);
        return "/file/filelist";
    }

    //getFileboard.do
    @GetMapping("getFileboard.do")
    public String getFileboard(@RequestParam int postNo, Model model) throws Exception {
        FileVO fileboard = fileService.getFilebord(postNo);
        model.addAttribute("fileboard", fileboard);
        return "/file/getFileboard";
    }

    @GetMapping("removeFileboard.do")
    public String removeFileboard(@RequestParam int postNo, HttpServletRequest req) throws Exception {

        //실제 파일 삭제 로직
        //파일 경로 지정
        String path = req.getRealPath("/resources/upload");
        List<FileDTO> fileList = fileService.getFileGroupList(postNo);
        for(FileDTO fileobj : fileList) {
            File file = new File(path + "/" + fileobj.getOriginFile());
            if (file.exists()) { // 해당 파일이 존재하면
                file.delete(); // 파일 삭제
            }
        }
        //데이터베이스의 파일 자료실과 파일의 내용 삭제
        fileService.removeFileboard(postNo);
        return "redirect:list.do";
    }

    @GetMapping("modifyFileboard.do")
    public String modifyFileboard(@RequestParam int postNo, Model model) throws Exception {
        FileVO fileboard = fileService.getFilebord(postNo);
        model.addAttribute("fileboard", fileboard);
        model.addAttribute("postNo", postNo); // 수정 폼으로 postNo를 전달
        return "/file/modifyFileboard";
    }

    @PostMapping("modifyFileboard.do")
    public String modifyFileboard(@RequestParam(required = true) int postNo, MultipartHttpServletRequest files, HttpServletRequest req,Model model) throws Exception {
        FileVO fileboard = fileService.getFilebord(postNo);
        Enumeration<String> e = files.getParameterNames();
        Map map = new HashMap();
        while (e.hasMoreElements()) {
            String name = e.nextElement();
            String value = files.getParameter(name);
            map.put(name, value);
            System.out.println("map : "+map.toString());
        }
        //제목 및 내용 분리
        FileBoard board = new FileBoard();
        board.setPostNo(postNo);
        board.setTitle((String) map.get("title"));
        board.setContent((String) map.get("content"));


        //uploadPath; //dispatcher-servlet에서 지정한 경로
        //req.getContextPath(); //현재 프로젝트 홈 경로 - /pro3_war
        //req.getServletPath();   //요청된 URL - /pro3_war/file/fileupload1.do
        req.getRealPath("/resources/upload");  //현재 프로젝트에 저장될 실제 경로
        String devFolder = uploadPath + "/resources/upload/";    //개발자용 컴퓨터에 업로드 디렉토리 지정
        String uploadFolder = req.getRealPath("/resources/upload");
        log.info("-----------------------------------");
        log.info(" 현재 프로젝트 홈 : "+req.getContextPath());
        log.info(" dispatcher-servlet에서 지정한 경로 : "+uploadPath);
        log.info(" 요청 URL : "+req.getServletPath());
        log.info(" 프로젝트 저장 경로 : "+req.getRealPath("/resources/upload"));
        //여러 파일 반복 저장
        List<FileDTO> fileList = new ArrayList<>();
        Iterator<String> it = files.getFileNames();

        while(it.hasNext()){
            String paramfName = it.next();
            MultipartFile file = files.getFile(paramfName);
            log.info("-----------------------------------");
            log.info("name : "+file.getOriginalFilename());
            log.info("size : "+file.getSize());
            log.info("path : ");

            File saveFile = new File(uploadFolder, file.getOriginalFilename()); //실제 파일 객체 생성
            FileDTO data = new FileDTO();
            data.setSaveFolder(uploadFolder);
            data.setOriginFile(file.getOriginalFilename());
            data.setSaveFile(saveFile.getPath());
            data.setFileSize(file.getSize());
            Date today = new Date();
            data.setUploadDate(today.toString());
            data.setPostNo(postNo);
            fileList.add(data);

            try {
                file.transferTo(saveFile);  //실제 디렉토리에 해당파일 저장
            } catch(IllegalStateException e1){
                log.info(e1.getMessage());
            } catch(IOException e2){
                log.info(e2.getMessage());
            }
            if (!file.getOriginalFilename().equals("")) {
                fileService.removeAllFile(postNo);
            }
        }

        fileboard.setFileList(fileList);
        fileboard.setFileBoard(board); //글 제목 내용
        fileService.editFileboard(fileboard);

        return "redirect:getFileboard.do?postNo="+postNo;
    }


    @PostMapping("fileRemove.do")
    public String fileRemove(HttpServletRequest request, Model model) throws Exception {
        int no = Integer.parseInt(request.getParameter("no"));
        int postNo = Integer.parseInt(request.getParameter("postNo"));
        String path = request.getRealPath("/resources/upload");
        FileDTO fileobj = fileService.getFile(no);
        File file = new File(path + "/" + fileobj.getOriginFile());
        if (file.exists()) { // 해당 파일이 존재하면
            file.delete(); // 파일 삭제
        }
        return "/file/getFileboard.do?postNo="+postNo;
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
            String path = "E:\\springframework\\pro04_2\\src\\main\\webapp\\resources\\upload" + "ckImage/";    // 이미지 경로 설정(폴더 자동 생성)
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
            String fileUrl = "/pro04_1/file/ckImgSubmit.do?uid=" + uid + "&fileName=" + fileName; // 작성화면

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
        String path = "E:\\springframework\\pro04_2\\src\\main\\webapp\\resources\\upload" + "ckImage/";    // 저장된 이미지 경로
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