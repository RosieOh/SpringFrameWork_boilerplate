package kr.co.boilerplate.persistence;

import kr.co.boilerplate.util.Page;
import kr.co.boilerplate.domain.Qna;
import kr.co.boilerplate.domain.QnaComment;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface QnaMapper {
    public List<Qna> QnaList(Page page);
    public Qna qnaDetail(int qno);
    public void qnaInsert(Qna domain);
    public void qnaDelete(int qno);
    public void qnaEdit(Qna domain);
    public int totalCount(Page page);
    public List<Qna> qnaSelectBest();
    public List<Qna> qnaSelectVisit();
    public List<QnaComment> qnaCommentList(int qno);
    public void qnaCommentInsert(QnaComment domain);
    public void qnaCommentDelete(int cno);
    public List<Qna> qnaCommentCount();
}
