package kr.co.rosieoh.dao;

import kr.co.rosieoh.dto.Member;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class MemberDAOImpl implements MemberDAO{

    @Autowired
    SqlSession sqlSession;


    @Override
    public List<Member> memberList() throws Exception {
        return sqlSession.selectList("member.memberList");
    }

    @Override
    public Member getMember(String id) throws Exception {
        return sqlSession.selectOne("member.getMember", id);
    }

    @Override
    public int memberCount() throws Exception {
        return sqlSession.selectOne("member.memberCount");
    }

    @Override
    public void memberInsert(Member member) throws Exception {
        sqlSession.insert("member.memberInsert", member);
    }

    @Override
    public void memberEdit(Member member) throws Exception {
        sqlSession.update("member.memberEdit", member);
    }

    @Override
    public void memberDelete(String id) throws Exception {
        sqlSession.delete("member.memberDelete", id);
    }

    @Override
    public Member signIn(String id) throws Exception {
        return sqlSession.selectOne("member.signIn", id);
    }

    @Override
    public Member login(String id) throws Exception {
        return sqlSession.selectOne("member.login", id);
    }

    @Override
    public Member loginCheck(String id) throws Exception {
        return sqlSession.selectOne("member.loginCheck", id);
    }

    @Override
    public String findIdByEmail(String email) throws Exception {
        return sqlSession.selectOne("member.findIdByEmail", email);
    }

    @Override
    public String findPassword(String id, String email) throws Exception {
        Map<String, String> params = new HashMap<>();
        params.put("id", id);
        params.put("email", email);
        return sqlSession.selectOne("member.findPassword", params);
    }
}
