package kr.co.boilerplate.service;

import kr.co.boilerplate.persistence.MemberMapper;
import kr.co.boilerplate.domain.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberMapper memberMapper;

    BCryptPasswordEncoder pwEncoder = new BCryptPasswordEncoder();

    @Override
    public List<Member> memberList() throws Exception {
        return memberMapper.getMemberList3();
    }

    @Override
    public Member getMember(String id) throws Exception {
        return memberMapper.getMember3(id);
    }

    @Override
    public int memberCount() throws Exception {
        return memberMapper.memberCount();
    }

    @Override
    public void memberInsert(Member member) throws Exception {
        memberMapper.insert3(member);
    }

    @Override
    public void memberEdit(Member member) throws Exception {
        memberMapper.update3(member);
    }

    @Override
    public void memberDelete(String id) throws Exception {
        memberMapper.delete3(id);
    }

    //로그인을 컨트롤러에서 처리
    @Override
    public Member signIn(String id) throws Exception {
        return memberMapper.signIn(id);
    }

    //서비스에서 로그인 처리
    @Override
    public boolean loginCheck(String id, String pw) throws Exception {
        boolean comp = false;
        Member member = memberMapper.loginCheck(id);
        boolean loginSuccess = pwEncoder.matches(pw, member.getPw());
        if(member!=null && loginSuccess){
            comp = true;
        } else {
            comp = false;
        }
        return comp;
    }

    @Override
    public Member login(String id) throws Exception {
        return memberMapper.login(id);
    }
    //Ajax로 로그인 처리 -> 컨트롤러
    @Override
    public Member loginAjax(Member member) throws Exception {
        return memberMapper.loginAjax(member);
    }

    @Override
    public String findByEmail(String email) throws Exception {
        return memberMapper.findIdByEmail(email);
    }

    @Override
    public String findPassword(String id, String email) throws Exception {
        return memberMapper.findPassword(id, email);
    }
}