package kr.co.boilerplate.repository;

import kr.co.boilerplate.util.Page;
import kr.co.boilerplate.domain.FileDTO;
import kr.co.boilerplate.domain.FileVO;

import java.util.List;

public interface FileRepository {
    public void insertFileboard(FileVO fileboard) throws Exception;
    public List<FileVO> getFileList(Page page) throws Exception;
    public List<FileDTO> getFileGroupList(int postNo) throws Exception;
    public FileVO getFilebord(int postNo) throws Exception;
    public FileVO getFileObject(int no) throws Exception;
    public void removeFileboard(int postNo) throws Exception;
    public void editFileboard(FileVO fileboard) throws Exception;
    public void fileRemove(int no) throws Exception;
    public FileDTO getFile(int no) throws Exception;
    public void removeAllFile(int postNo) throws Exception;
    public int totalCount(Page page) throws Exception;
}