package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Teacher;
import kr.ed.haebeop.persistence.TeacherMapper;
import kr.ed.haebeop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TeacherServiceImpl implements TeacherService{

    @Autowired
    TeacherMapper teacherMapper;


    @Override
    public List<Teacher> getTeacherList(Page page) throws Exception {
        return teacherMapper.getTeacherList(page);
    }

    @Override
    public List<Teacher> teacherList() throws Exception {
        return teacherMapper.teacherList();
    }

    @Override
    public Teacher getTeacer(int tno) throws Exception {
        return teacherMapper.getTeacher(tno);
    }

    @Override
    public int countTeacher(Page page) throws Exception {
        return teacherMapper.countTeacher(page);
    }

    @Override
    public void insertTeacher(Teacher teacher) throws Exception {
        teacherMapper.insertTeacher(teacher);
    }

    @Override
    public void deleteTeacher(int tno) throws Exception {
        teacherMapper.deleteTeacher(tno);
    }
}
