package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Apply;
import kr.ed.haebeop.domain.Lecture;
import kr.ed.haebeop.domain.Member;
import kr.ed.haebeop.util.Page;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface LectureMapper {
    public List<Lecture> getLectureList(Page page);
    public List<Lecture> lectureList();
    public List<Lecture> getUnFinishedLecture(Page page);
    public List<Lecture> unFinishedLecture();
    public List<Lecture> getNotFullLecture(Page page);
    public List<Lecture> notFullLecture();
    public Lecture getLecture(int lno);
    public List<Lecture> getNewLecture();
    public void insertLecture(Lecture lecture);
    public void updateLecture(Lecture lecture);
    public void deleteLecture(int lno);
    public int countLecture(Page page);
    public List<Lecture> getLectureAsc(Page page);
    public List<Lecture> getLectureDesc(Page page);


    public void updateStudentNumber(int lno) throws Exception;
    public List<Apply> getApplyList(Apply apply) throws Exception;
    public void endLecture(int ano) throws Exception;
    public Member getMemberName(String id) throws Exception;
    public Apply doApply(Apply apply);
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
