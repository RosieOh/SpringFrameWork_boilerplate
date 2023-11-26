package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Member;

import java.util.List;

public interface MemberService {
    public List<Member> memberList() throws Exception;
    public Member getMember(String id) throws Exception;
    public int memberCount() throws Exception;
    public void memberInsert(Member member) throws Exception;
    public void memberEdit(Member member) throws Exception;
    public void memberDelete(String id) throws Exception;
    public Member signIn(String id) throws Exception;
    public boolean loginCheck(String id, String pw) throws Exception;
    public Member login(String id) throws Exception;

    //Ajax로 로그인 처리 -> 컨트롤러
    public Member loginAjax(Member member) throws Exception;
    public String findByEmail(String email) throws Exception;
    public String findPassword(String id, String email) throws Exception;
}
