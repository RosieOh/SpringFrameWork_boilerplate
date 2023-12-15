package kr.co.boilerplate.service;

import kr.co.boilerplate.util.Page;
import kr.co.boilerplate.domain.Board;

import java.util.List;

public interface BoardService {
    public List<Board> boardList(Page page) throws Exception;
    public Board boardDetail(int bno) throws Exception;
    public void boardInsert(Board domain) throws Exception;
    public void boardDelete(int bno) throws Exception;
    public void boardEdit(Board domain) throws Exception;
    public int totalCount(Page page) throws Exception;
}
