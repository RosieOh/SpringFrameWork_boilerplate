package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.FileDTO;
import kr.ed.haebeop.domain.FileVO;
import kr.ed.haebeop.domain.Notice;
import kr.ed.haebeop.util.Page;

import java.io.File;
import java.util.List;

public interface FileService {

    public void insertFileboard(FileVO fileboard) throws Exception;

    public List<FileVO> getFileList(Page page) throws Exception;

    public List<FileDTO> getFileGroupList(int postNo) throws Exception;

    public FileVO getFilebord(int postNo) throws Exception;

    public FileVO getFileObject(int no) throws Exception;

    public void removeFileboard(int postNo) throws Exception;

    public void fileRemove(int no) throws Exception;

    public void editFileboard(FileVO fileboard) throws Exception;

    public FileDTO getFile(int no) throws Exception;

    public void removeAllFile(int postNo) throws Exception;

    public int totalCount(Page page) throws Exception;
}