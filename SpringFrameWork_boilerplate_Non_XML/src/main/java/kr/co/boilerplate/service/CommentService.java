package kr.co.boilerplate.service;

import kr.co.boilerplate.domain.Comment;

import java.util.List;

public interface CommentService{
    public List<Comment> commentList(int par) throws Exception;
    public void commentInsert(Comment domain) throws Exception;
    public void commentDelete(int cno) throws Exception;

}