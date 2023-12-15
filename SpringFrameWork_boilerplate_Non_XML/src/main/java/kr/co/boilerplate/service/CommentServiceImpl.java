package kr.co.boilerplate.service;

import kr.co.boilerplate.persistence.CommentMapper;
import kr.co.boilerplate.domain.Comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService{

    @Autowired
    private CommentMapper commentMapper;


    @Override
    public List<Comment> commentList(int par) throws Exception {
        return commentMapper.commentList(par);
    }

    @Override
    public void commentInsert(Comment domain) throws Exception {
        commentMapper.commentInsert(domain);
    }

    @Override
    public void commentDelete(int cno) throws Exception {
        commentMapper.commentDelete(cno);
    }
}
