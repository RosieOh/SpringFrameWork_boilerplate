package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Review;
import kr.ed.haebeop.util.Page;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ReviewMapper {
    public List<Review> reviewList(Page page);
    public Review reviewDetail(int rno);
    public void reviewInsert(Review rno);
    public void reviewDelete(int rno);
    public void reviewEdit(Review domain);
    public int totalCount(Page page);

}
