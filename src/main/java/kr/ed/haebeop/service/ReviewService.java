package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Review;
import kr.ed.haebeop.util.Page;

import java.util.List;

public interface ReviewService {
    public List<Review> reviewList(Page page) throws Exception;
    public Review reviewDetail(int rno) throws Exception;
    public void reviewInsert(Review domain) throws Exception;
    public void reviewDelete(int rno) throws Exception;
    public void reviewEdit(Review domain) throws Exception;
    public int totalCount(Page page) throws Exception;
}
