package com.cj.service;

import com.cj.pojo.Student;
import java.util.List;

/**
 * @author chenjun
 * @description 学生service层
 * @create 2021-01-26 11:36
 **/
public interface StudentService {
    /**
     * 添加学生信息
     * @param avgScore 平均分
     * @param student 学生信息
     */
    void saveStudent(int avgScore, Student student);

    /**
     * 删除学生信息
     * @param value 学生信息json字符串
     */
    void deleteStudent(String value);

    /**
     * 更新学生信息
     * @param student
     */
    void updateStudent(Student student);

    /**
     * 根据学生id查询学生信息
     * @param id
     * @return
     */
    String findById(String id);

    /**
     * 查询所有学生信息
     * @return
     */
    List<Student> listStudent();

    /**
     * 分页查询所有学生信息
     * @param start
     * @param end
     * @return
     */
    List<Student> listStudentByPage(int start,int end);
}
