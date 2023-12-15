package kr.co.boilerplate.service;

import kr.co.boilerplate.persistence.NoticeMapper;
import kr.co.boilerplate.util.Page;
import kr.co.boilerplate.domain.Notice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeServiceImpl implements NoticeService {

    @Autowired
    private NoticeMapper noticeMapper;

    @Override
    public List<Notice> noticeList(Page page) throws Exception {
        return noticeMapper.noticeList(page);
    }

    @Override
    public Notice noticeDetail(int nno) throws Exception {
        noticeMapper.visitedCount(nno);
        return noticeMapper.noticeDetail(nno);
    }

    @Override
    public void noticeInsert(Notice domain) throws Exception {
        noticeMapper.noticeInsert(domain);
    }

    @Override
    public void noticeDelete(int nno) throws Exception {
        noticeMapper.noticeDelete(nno);
    }

    @Override
    public void noticeEdit(Notice domain) throws Exception {
        noticeMapper.noticeEdit(domain);
    }

    @Override
    public int totalCount(Page page) throws Exception {
        return noticeMapper.totalCount(page);
    }
}