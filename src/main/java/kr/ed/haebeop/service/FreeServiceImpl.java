package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Free;
import kr.ed.haebeop.domain.FreeComment;
import kr.ed.haebeop.domain.Record;
import kr.ed.haebeop.persistence.FreeMapper;
import kr.ed.haebeop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FreeServiceImpl implements FreeService {

    @Autowired
    private FreeMapper freeMapper;


    @Override
    public List<Free> freeList(Page page) throws Exception {
        return freeMapper.freeList(page);
    }

    @Override
    public Free freeDetail(int fno) throws Exception {
        return freeMapper.freeDetail(fno);
    }

    @Override
    public void freeInsert(Free domain) throws Exception {
        freeMapper.freeInsert(domain);
    }

    @Override
    public void freeDelete(int fno) throws Exception {
        freeMapper.freeDelete(fno);
    }

    @Override
    public void freeEdit(Free domain) throws Exception {
        freeMapper.freeEdit(domain);
    }

    @Override
    public int totalCount(Page page) throws Exception {
        return freeMapper.totalCount(page);
    }

    @Override
    public List<Free> freeCommentCount() throws Exception {
        return freeMapper.freeCommentCount();
    }

    @Override
    public List<Free> freeBestList() throws Exception {
        return freeMapper.freeBestList();
    }

    @Override
    public List<Free> freeBestCommentList() throws Exception {
        return freeMapper.freeBestCommentList();
    }

    @Override
    public List<FreeComment> freeCommentList(int fno) throws Exception {
        return freeMapper.freeCommentList(fno);
    }

    @Override
    public void freeCommentInsert(FreeComment domain) throws Exception {
        freeMapper.freeCommentInsert(domain);
    }

    @Override
    public void freeCommentDelete(int cno) throws Exception {
        freeMapper.freeCommentDelete(cno);
    }

    @Override
    public Record findRecord(int fno, String id) throws Exception {
        return freeMapper.findRecord(fno, id);
    }

    @Override
    public int insertRecord(Record record) throws Exception {
        int result = 0;
        // 추천이 이미 있는지 확인하는 코드
        Record find = freeMapper.memberFindRecord(record);

        // find가 null이면 추천이 없는 상태이므로 정보 저장
        // find가 null이 아니면 추천이 있는 상태이므로 정보 삭제
        System.out.println("find:" + find);

        if (find == null) {
            result = freeMapper.insertRecord(record);
            freeMapper.increaseRecord(record);
        } /*else {
            freeDAO.deleteReco(reco);
            freeDAO.decreaseRec(reco);
        }*/
        return result;
    }
}
