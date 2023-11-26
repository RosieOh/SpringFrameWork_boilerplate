package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Teacher;
import kr.ed.haebeop.util.Page;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TeacherMapper {
    public List<Teacher> getTeacherList(Page page);
    public List<Teacher> teacherList();
    public Teacher getTeacher(int tno);
    public int countTeacher(Page page);
    public void insertTeacher(Teacher teacher);
    public void deleteTeacher(int tno);
}
