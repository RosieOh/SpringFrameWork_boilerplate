package kr.co.boilerplate.service;

import kr.co.boilerplate.util.Page;
import kr.co.boilerplate.domain.Qna;
import kr.co.boilerplate.domain.QnaComment;

import java.util.List;

public interface QnaService {
    public List<Qna> QnaList(Page page) throws Exception;
    public Qna qnaDetail(int qno) throws Exception;
    public void qnaInsert(Qna domain) throws Exception;
    public void qnaDelete(int qno) throws Exception;
    public void qnaEdit(Qna domain) throws Exception;
    public int totalCount(Page page) throws Exception;
    public List<Qna> qnaSelectBest() throws Exception;
    public List<Qna> qnaSelectVisit() throws Exception;
    public List<QnaComment> qnaCommentList(int qno) throws Exception;
    public void qnaCommentInsert(QnaComment domain) throws Exception;
    public void qnaCommentDelete(int cno) throws Exception;
    public List<Qna> qnaCommentCount() throws Exception;
}
