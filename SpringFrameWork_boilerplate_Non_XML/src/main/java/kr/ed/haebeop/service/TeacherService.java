package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Teacher;
import kr.ed.haebeop.util.Page;

import java.util.List;

public interface TeacherService {
    public List<Teacher> getTeacherList(Page page) throws Exception;
    public List<Teacher> teacherList() throws Exception;
    public Teacher getTeacer(int tno) throws Exception;
    public int countTeacher(Page page) throws Exception;
    public void insertTeacher(Teacher teacher) throws Exception;
    public void deleteTeacher(int tno) throws Exception;

}
