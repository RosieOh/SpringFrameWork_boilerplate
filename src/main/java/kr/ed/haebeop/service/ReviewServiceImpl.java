package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Review;
import kr.ed.haebeop.persistence.ReviewMapper;
import kr.ed.haebeop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReviewServiceImpl implements ReviewService{

    @Autowired
    private ReviewMapper reviewMapper;


    @Override
    public List<Review> reviewList(Page page) throws Exception {
        return reviewMapper.reviewList(page);
    }

    @Override
    public Review reviewDetail(int rno) throws Exception {
        return reviewMapper.reviewDetail(rno);
    }

    @Override
    public void reviewInsert(Review domain) throws Exception {
        reviewMapper.reviewInsert(domain);
    }

    @Override
    public void reviewDelete(int rno) throws Exception {
        reviewMapper.reviewDelete(rno);
    }

    @Override
    public void reviewEdit(Review domain) throws Exception {
        reviewMapper.reviewEdit(domain);
    }

    @Override
    public int totalCount(Page page) throws Exception {
        return reviewMapper.totalCount(page);
    }
}
