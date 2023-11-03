package kr.co.rosieoh.dao;

import kr.co.rosieoh.dto.Board;
import kr.co.rosieoh.dto.BoardComment;
import kr.co.rosieoh.util.Page;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BoardDAOImpl implements BoardDAO {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<Board> boardList(Page page) throws Exception {
        return sqlSession.selectList("board.boardList", page);
    }

    @Override
    public Board boardDetail(int bno) throws Exception {
        sqlSession.update("board.countUp", bno);
        return sqlSession.selectOne("board.boardDetail", bno);
    }

    @Override
    public void boardInsert(Board dto) throws Exception {
        sqlSession.insert("board.boardInsert", dto);
    }

    @Override
    public void boardDelete(int bno) throws Exception {
        sqlSession.delete("board.boardDelete", bno);
    }

    @Override
    public void boardEdit(Board dto) throws Exception {
        sqlSession.update("board.boardEdit", dto);
    }

    @Override
    public int totalCount(Page page) throws Exception {
        return sqlSession.selectOne("board.totalCount", page);
    }

    @Override
    public List<BoardComment> boardCommentList(int bno) throws Exception {
        return sqlSession.selectList("board.boardCommentList", bno);
    }

    @Override
    public void commentInsert(BoardComment dto) throws Exception {
        sqlSession.insert("board.commentInsert", dto);
    }

    @Override
    public void commentDelete(int cno) throws Exception {
        sqlSession.delete("board.commentDelete", cno);
    }

    @Override
    public List<Board> selectComment() throws Exception {
        return sqlSession.selectList("board.selectComment");
    }

    @Override
    public List<Board> commentCount() throws Exception {
        return sqlSession.selectList("board.commentCount");
    }

    @Override
    public List<Board> newBoard() throws Exception {
        return sqlSession.selectList("board.newBoard");
    }
}
