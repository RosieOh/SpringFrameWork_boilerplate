package kr.co.rosieoh.service;

import kr.co.rosieoh.dto.Free;
import kr.co.rosieoh.dto.FreeComment;
import kr.co.rosieoh.dto.Reco;
import kr.co.rosieoh.util.Page;

import java.util.List;

public interface FreeService {
    public List<Free> freeList(Page page) throws Exception;
    public Free freeDetail(int fno) throws Exception;
    public void hitsDown(int fno) throws Exception;
    public void freeInsert(Free dto) throws Exception;
    public void freeDelete(int fno) throws Exception;
    public void freeEdit(Free dto) throws Exception;
    public int totalCount(Page page) throws Exception;
    public List<Free> freeBestRecList() throws Exception;
    public List<Free> freeBestCmtList() throws Exception;
    public List<FreeComment> freeCommentList(int fno) throws Exception;
    public void commentInsert(FreeComment dto) throws Exception;
    public void commentDelete(int cno) throws Exception;
    public List<Free> commentCount() throws Exception;
    public Reco findReco(int bno, String id) throws Exception;
    public int insertReco(Reco like) throws Exception;
}