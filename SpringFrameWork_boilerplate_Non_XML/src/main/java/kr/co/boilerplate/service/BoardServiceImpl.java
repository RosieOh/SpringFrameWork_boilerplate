package kr.co.boilerplate.service;
import java.util.List;

import kr.co.boilerplate.persistence.BoardMapper;
import kr.co.boilerplate.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.boilerplate.domain.Board;

@Service
public class BoardServiceImpl implements BoardService {

    @Autowired
    private BoardMapper boardMapper;

    @Override
    public List<Board> boardList(Page page) throws Exception {
        return boardMapper.boardList(page);
    }

    @Override
    public Board boardDetail(int bno) throws Exception {
        return boardMapper.boardDetail(bno);
    }

    @Override
    public void boardInsert(Board domain) throws Exception {
        boardMapper.boardInsert(domain);
    }

    @Override
    public void boardDelete(int bno) throws Exception {
        boardMapper.boardDelete(bno);
    }

    @Override
    public void boardEdit(Board domain) throws Exception {
        boardMapper.boardEdit(domain);
    }

    @Override
    public int totalCount(Page page) throws Exception {
        return boardMapper.totalCount(page);
    }
}