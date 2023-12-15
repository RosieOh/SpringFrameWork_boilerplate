package kr.co.boilerplate.persistence;

import kr.co.boilerplate.util.Page;
import kr.co.boilerplate.domain.Notice;
import org.apache.ibatis.annotations.Mapper;

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
