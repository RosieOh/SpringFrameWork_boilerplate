package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Apply;
import kr.ed.haebeop.domain.Lecture;
import kr.ed.haebeop.domain.Member;
import kr.ed.haebeop.persistence.LectureMapper;
import kr.ed.haebeop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LectureServiceImpl implements LectureService{

    @Autowired
    LectureMapper lectureMapper;


    @Override
    public List<Lecture> getLectureList(Page page) throws Exception {
        return lectureMapper.getLectureList(page);
    }

    @Override
    public List<Lecture> getUnFinishedLecture(Page page) {
        return lectureMapper.getUnFinishedLecture(page);
    }

    @Override
    public List<Lecture> unFinishedLecture() {
        return lectureMapper.unFinishedLecture();
    }

    @Override
    public List<Lecture> getNotFullLecture(Page page) {
        return lectureMapper.getNotFullLecture(page);
    }

    @Override
    public List<Lecture> notFullLecture() {
        return lectureMapper.notFullLecture();
    }

    @Override
    public Lecture getLecture(int lno) throws Exception {
        return lectureMapper.getLecture(lno);
    }

    @Override
    public List<Lecture> lectureList() throws Exception {
        return lectureMapper.lectureList();
    }

    @Override
    public List<Lecture> getNewLecture() throws Exception {
        return lectureMapper.getNewLecture();
    }

    @Override
    public void insertLecture(Lecture lecture) throws Exception {
        lectureMapper.insertLecture(lecture);
    }

    @Override
    public void updateLecture(Lecture lecture) throws Exception {
        lectureMapper.updateLecture(lecture);
    }

    @Override
    public void deleteLecture(int lno) throws Exception {
        lectureMapper.deleteLecture(lno);
    }

    @Override
    public int countLecture(Page page) throws Exception {
        return lectureMapper.countLecture(page);
    }

    @Override
    public List<Lecture> getLectureAsc(Page page) throws Exception {
        return lectureMapper.getLectureAsc(page);
    }

    @Override
    public List<Lecture> getLectureDesc(Page page) throws Exception {
        return lectureMapper.getLectureDesc(page);
    }

    @Override
    public int insertApply(Apply apply) throws Exception {
        return lectureMapper.insertApply(apply);
    }

    @Override
    public void updateStudentNumber(int lno) throws Exception {
        lectureMapper.updateStudentNumber(lno);
    }

    @Override
    public List<Apply> getApplyList(Apply apply) throws Exception {
        return lectureMapper.getApplyList(apply);
    }

    @Override
    public void endLecture(int ano) throws Exception {
        lectureMapper.endLecture(ano);
    }

    @Override
    public Member getMemberName(String id) throws Exception {
        return lectureMapper.getMemberName(id);
    }


    @Override
    public Apply doApply(Apply apply) {
        return lectureMapper.doApply(apply);
    }

    @Override
    public List<Apply> applyList(Page page) throws Exception {
        return lectureMapper.applyList(page);
    }

    @Override
    public void deleteApply(int ano) throws Exception {
        lectureMapper.deleteApply(ano);
    }

    @Override
    public int countApply(Page page) throws Exception {
        return lectureMapper.countApply(page);
    }

    @Override
    public void updateMemberPoint(Member member) throws Exception {
        lectureMapper.updateMemberPoint(member);
    }

    @Override
    public void rollbackStudentNumber(int lno) throws Exception {
        lectureMapper.rollbackStudentNumber(lno);
    }

    @Override
    public void cancelApply(int ano) throws Exception {
        lectureMapper.cancelApply(ano);
    }

    @Override
    public List<Apply> cancelApplyList(Page page) throws Exception {
        return lectureMapper.cancelApplyList(page);
    }

    @Override
    public int countCancelApplyList(Page page) throws Exception {
        return lectureMapper.countCancelApplyList(page);
    }
}
