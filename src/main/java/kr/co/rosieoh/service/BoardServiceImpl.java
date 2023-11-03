package kr.co.rosieoh.service;

import kr.co.rosieoh.dao.BoardDAO;
import kr.co.rosieoh.dto.Board;
import kr.co.rosieoh.dto.BoardComment;
import kr.co.rosieoh.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardServiceImpl implements BoardService {

    @Autowired
    private BoardDAO boardDAO;

    @Override
    public List<Board> boardList(Page page) throws Exception {
        return boardDAO.boardList(page);
    }

    @Override
    public Board boardDetail(int bno) throws Exception {
        return boardDAO.boardDetail(bno);
    }

    @Override
    public void boardInsert(Board dto) throws Exception {
        boardDAO.boardInsert(dto);
    }

    @Override
    public void boardDelete(int bno) throws Exception {
        boardDAO.boardDelete(bno);
    }

    @Override
    public void boardEdit(Board dto) throws Exception {
        boardDAO.boardEdit(dto);
    }

    @Override
    public int totalCount(Page page) throws Exception {
        return boardDAO.totalCount(page);
    }

    @Override
    public List<BoardComment> boardCommentList(int bno) throws Exception {
        return boardDAO.boardCommentList(bno);
    }

    @Override
    public void commentInsert(BoardComment dto) throws Exception {
        boardDAO.commentInsert(dto);
    }

    @Override
    public void commentDelete(int cno) throws Exception {
        boardDAO.commentDelete(cno);
    }

    @Override
    public List<Board> selectComment() throws Exception {
        return boardDAO.selectComment();
    }

    @Override
    public List<Board> countComment() throws Exception {
        return boardDAO.commentCount();
    }

    @Override
    public List<Board> newBoard() throws Exception {
        return boardDAO.newBoard();
    }
}
