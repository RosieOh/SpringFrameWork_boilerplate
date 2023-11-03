package kr.co.rosieoh.service;

import kr.co.rosieoh.dao.MemberDAO;
import kr.co.rosieoh.dto.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberServiceImpl implements MemberService{

    @Autowired
    private MemberDAO memberDAO;
    BCryptPasswordEncoder pwEncoder = new BCryptPasswordEncoder();


    @Override
    public List<Member> memberList() throws Exception {
        return memberDAO.memberList();
    }

    @Override
    public Member getMember(String id) throws Exception {
        return memberDAO.getMember(id);
    }

    @Override
    public int memberCount() throws Exception {
        return memberDAO.memberCount();
    }

    @Override
    public void memberInsert(Member member) throws Exception {
        memberDAO.memberInsert(member);
    }

    @Override
    public void memberEdit(Member member) throws Exception {
        memberDAO.memberEdit(member);
    }

    @Override
    public void memberDelete(String id) throws Exception {
        memberDAO.memberDelete(id);
    }

    @Override
    public Member signIn(String id) throws Exception {
        return memberDAO.signIn(id);
    }

    @Override
    public boolean loginCheck(String id, String pw) throws Exception {
        Member member = memberDAO.loginCheck(id);

        if (member != null) {
            boolean loginSuccess = pwEncoder.matches(pw, member.getPw());
            return loginSuccess;
        } else {
            return false;
        }
    }

    @Override
    public Member login(String id) throws Exception {
        return memberDAO.login(id);
    }

    @Override
    public String findByEmail(String email) throws Exception {
        return memberDAO.findIdByEmail(email);
    }

    @Override
    public String findPassword(String id, String email) throws Exception {
        return memberDAO.findPassword(id, email);
    }
}
