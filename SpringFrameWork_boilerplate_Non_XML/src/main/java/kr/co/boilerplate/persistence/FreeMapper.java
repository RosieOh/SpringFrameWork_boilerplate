package kr.co.boilerplate.persistence;

import kr.co.boilerplate.util.Page;
import kr.co.boilerplate.domain.Free;
import kr.co.boilerplate.domain.FreeComment;
import org.apache.ibatis.annotations.*;
import java.util.List;

@Mapper
public interface FreeMapper {
    public List<Free> freeList(Page page) throws Exception;
    public Free freeDetail(int fno) throws Exception;
    public void freeInsert(Free domain) throws Exception;
    public void freeDelete(int fno) throws Exception;
    public void freeEdit(Free domain) throws Exception;
    public int totalCount(Page page) throws Exception;
    public List<Free> freeCommentCount() throws Exception;
    public List<Free> freeBestList() throws Exception;
    public List<Free> freeBestCommentList() throws Exception;
    public List<FreeComment> freeCommentList(int fno) throws Exception;
    public void freeCommentInsert(FreeComment domain) throws Exception;
    public void freeCommentDelete(int cno) throws Exception;
    public Record findRecord(int fno, String id) throws Exception;
    public int insertRecord(Record like) throws Exception;
    public Record memberFindRecord(Record record) throws Exception;
    public void increaseRecord(Record reco) throws Exception;
    public void decreaseRecord(Record reco) throws Exception;
}
