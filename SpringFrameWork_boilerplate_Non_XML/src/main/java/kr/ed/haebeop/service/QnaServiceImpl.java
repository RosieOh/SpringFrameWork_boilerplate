package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Qna;
import kr.ed.haebeop.domain.QnaComment;
import kr.ed.haebeop.persistence.QnaMapper;
import kr.ed.haebeop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QnaServiceImpl implements QnaService{

    @Autowired
    private QnaMapper qnaMapper;

    @Override
    public List<Qna> QnaList(Page page) throws Exception {
        return qnaMapper.QnaList(page);
    }

    @Override
    public Qna qnaDetail(int qno) throws Exception {
        return qnaMapper.qnaDetail(qno);
    }

    @Override
    public void qnaInsert(Qna domain) throws Exception {
        qnaMapper.qnaInsert(domain);
    }

    @Override
    public void qnaDelete(int qno) throws Exception {
        qnaMapper.qnaDelete(qno);
    }

    @Override
    public void qnaEdit(Qna domain) throws Exception {
        qnaMapper.qnaEdit(domain);
    }

    @Override
    public int totalCount(Page page) throws Exception {
        return qnaMapper.totalCount(page);
    }

    @Override
    public List<Qna> qnaSelectBest() throws Exception {
        return qnaMapper.qnaSelectBest();
    }

    @Override
    public List<Qna> qnaSelectVisit() throws Exception {
        return qnaMapper.qnaSelectVisit();
    }

    @Override
    public List<QnaComment> qnaCommentList(int qno) throws Exception {
        return qnaMapper.qnaCommentList(qno);
    }

    @Override
    public void qnaCommentInsert(QnaComment domain) throws Exception {
        qnaMapper.qnaCommentInsert(domain);
    }

    @Override
    public void qnaCommentDelete(int cno) throws Exception {
        qnaMapper.qnaCommentDelete(cno);
    }

    @Override
    public List<Qna> qnaCommentCount() throws Exception {
        return qnaMapper.qnaCommentCount();
    }
}
