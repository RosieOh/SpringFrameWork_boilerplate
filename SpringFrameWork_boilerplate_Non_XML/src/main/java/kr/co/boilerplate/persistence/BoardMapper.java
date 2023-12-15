package kr.co.boilerplate.persistence;

import kr.co.boilerplate.util.Page;
import kr.co.boilerplate.domain.Board;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardMapper {
    public List<Board> boardList(Page page);
    public Board boardDetail(int bno);
    public void boardInsert(Board domain);
    public void boardDelete(int bno);
    public void boardEdit(Board domain);
    public void visitCount(int bno);
    public int totalCount(Page page);
}
