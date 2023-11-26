package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Board;
import kr.ed.haebeop.util.Page;

import java.util.List;

public interface BoardService {
    public List<Board> boardList(Page page) throws Exception;
    public Board boardDetail(int bno) throws Exception;
    public void boardInsert(Board domain) throws Exception;
    public void boardDelete(int bno) throws Exception;
    public void boardEdit(Board domain) throws Exception;
    public int totalCount(Page page) throws Exception;
}
