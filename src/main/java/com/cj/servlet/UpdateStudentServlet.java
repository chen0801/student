package com.cj.servlet;

import com.alibaba.fastjson.JSON;
import com.cj.pojo.Student;
import com.cj.service.StudentService;
import com.cj.service.impl.StudentServiceImpl;
import lombok.SneakyThrows;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

/**
 * @author chenjun
 * @description 修改学生信息
 * @create 2021-01-26 14:21
 **/
@WebServlet("/updateStudentServlet")
public class UpdateStudentServlet extends HttpServlet {
    @SneakyThrows
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=utf-8");
        //获取参数
        String id = req.getParameter("id");
        String name = req.getParameter("name");
        String birthday = req.getParameter("birthday");
        String description = req.getParameter("description");
        String avgScore = req.getParameter("avgScore");

        StudentService studentService = new StudentServiceImpl();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = sdf.parse(birthday);
        Student student = new Student(id,name,date,description, Integer.parseInt(avgScore));
        //获取所有学生信息
        ArrayList<Student> students = StudentServiceImpl.getZrange(0,-1);
        for (Student s : students) {
            //判断修改的id是否存在于redis中
            if(s.getId().equals(id)){
                //先执行删除
                studentService.deleteStudent(JSON.toJSONString(s));
                req.setAttribute("notify_msg","修改成功");
            }
        }
        //再执行添加
        studentService.saveStudent(Integer.parseInt(avgScore),student);
        req.getRequestDispatcher("index.jsp").forward(req,resp);
    }
}
