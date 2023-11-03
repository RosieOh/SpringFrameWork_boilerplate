package kr.co.rosieoh.service;

import kr.co.rosieoh.dao.FreeDAO;
import kr.co.rosieoh.dto.Free;
import kr.co.rosieoh.dto.FreeComment;
import kr.co.rosieoh.dto.Reco;
import kr.co.rosieoh.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FreeServiceImpl implements FreeService {

    @Autowired
    private FreeDAO freeDAO;

    @Override
    public List<Free> freeList(Page page) throws Exception {
        return freeDAO.freeList(page);
    }

    @Override
    public Free freeDetail(int fno) throws Exception {
        return freeDAO.freeDetail(fno);
    }

    @Override
    public void hitsDown(int fno) throws Exception {
        freeDAO.hitsDown(fno);
    }

    @Override
    public void freeInsert(Free dto) throws Exception {
        freeDAO.freeInsert(dto);
    }

    @Override
    public void freeDelete(int fno) throws Exception {
        freeDAO.freeDelete(fno);
    }

    @Override
    public void freeEdit(Free dto) throws Exception {
        freeDAO.freeEdit(dto);
    }

    @Override
    public int totalCount(Page page) throws Exception {
        return freeDAO.totalCount(page);
    }

    @Override
    public List<Free> freeBestRecList() throws Exception {
        return freeDAO.freeBestRecList();
    }

    @Override
    public List<Free> freeBestCmtList() throws Exception {
        return freeDAO.freeBestCmtList();
    }

    @Override
    public List<FreeComment> freeCommentList(int fno) throws Exception {
        return freeDAO.freeCommentList(fno);
    }

    @Override
    public void commentInsert(FreeComment dto) throws Exception {
        freeDAO.commentInsert(dto);
    }

    @Override
    public void commentDelete(int cno) throws Exception {
        freeDAO.commentDelete(cno);
    }

    @Override
    public List<Free> commentCount() throws Exception {
        return freeDAO.commentCount();
    }

    @Override
    public Reco findReco(int fno, String id) throws Exception {
        return freeDAO.findReco(fno, id);
    }

    @Override
    public int insertReco(Reco reco) throws Exception {
        int result = 0;
        // 추천이 이미 있는지 확인하는 코드
        Reco find = freeDAO.memberFindReco(reco);

        // find가 null이면 추천이 없는 상태이므로 정보 저장
        // find가 null이 아니면 추천이 있는 상태이므로 정보 삭제
        System.out.println("find:" + find);

        if (find == null) {
            result = freeDAO.insertReco(reco);
            freeDAO.increaseRec(reco);
            //System.out.printf("추천 수 증가 확인 : %d\n", freeDAO.freeDetail(reco.getBno()).getRec());
        } else {
            result = freeDAO.deleteReco(reco) * -1;
            freeDAO.decreaseRec(reco);
            //System.out.printf("추천 수 감소 확인 : %d\n", freeDAO.freeDetail(reco.getBno()).getRec());
        }
        return result;
    }
}