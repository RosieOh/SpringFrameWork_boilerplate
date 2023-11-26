package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Notice;
import kr.ed.haebeop.util.Page;
import org.apache.ibatis.annotations.Mapper;
import org.checkerframework.checker.units.qual.N;

import java.util.List;

@Mapper
public interface NoticeMapper {
    public List<Notice> noticeList(Page page);
    public Notice noticeDetail(int nno);
    public void noticeInsert(Notice domain);
    public void noticeDelete(int nno);
    public void noticeEdit(Notice domain);
    public void visitedCount(int nno);
    public int totalCount(Page page);
}
