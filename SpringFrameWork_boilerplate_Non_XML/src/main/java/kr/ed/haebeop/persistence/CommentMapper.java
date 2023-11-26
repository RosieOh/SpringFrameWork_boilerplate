package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Comment;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CommentMapper {
    public List<Comment> commentList(int par);
    public void commentInsert(Comment domain);
    public void commentDelete(int cno);

}
