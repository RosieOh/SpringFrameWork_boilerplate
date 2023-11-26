package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Apply;
import kr.ed.haebeop.domain.Lecture;
import kr.ed.haebeop.domain.Member;
import kr.ed.haebeop.util.Page;

import java.util.List;

// 강의랑 수강신청이랑 같이 가야겠노
public interface LectureService {
    public List<Lecture> getLectureList(Page page) throws Exception;
    public List<Lecture> getUnFinishedLecture(Page page) throws Exception;
    public List<Lecture> unFinishedLecture() throws Exception;
    public List<Lecture> getNotFullLecture(Page page) throws Exception;
    public List<Lecture> notFullLecture() throws Exception;
    public Lecture getLecture(int lno) throws Exception;
    public List<Lecture> lectureList() throws Exception;
    public List<Lecture> getNewLecture() throws Exception;
    public void insertLecture(Lecture lecture) throws Exception;
    public void updateLecture(Lecture lecture) throws Exception;
    public void deleteLecture(int lno) throws Exception;
    public int countLecture(Page lecture) throws Exception;
    public List<Lecture> getLectureAsc(Page page) throws Exception;
    public List<Lecture> getLectureDesc(Page page) throws Exception;


    public void updateStudentNumber(int lno) throws Exception;
    public List<Apply> getApplyList(Apply apply) throws Exception;
    public void endLecture(int ano) throws Exception;
    public Member getMemberName(String id) throws Exception;
    public Apply doApply(Apply apply) throws Exception;
    public List<Apply> applyList(Page page) throws Exception;
    public int insertApply(Apply apply) throws Exception;
    public void deleteApply(int ano) throws Exception;
    public int countApply(Page page) throws Exception;
    public void updateMemberPoint(Member member) throws Exception;
    public void rollbackStudentNumber(int lno) throws Exception;
    public void cancelApply(int ano) throws Exception;
    public List<Apply> cancelApplyList(Page page) throws Exception;
    public int countCancelApplyList(Page page) throws Exception;
}
