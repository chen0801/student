package com.cj.servlet;

import com.cj.pojo.Student;
import com.cj.service.StudentService;
import com.cj.service.impl.StudentServiceImpl;
import lombok.SneakyThrows;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

/**
 * @author chenjun
 * @description 添加学生信息
 * @create 2021-01-26 14:08
 **/
@WebServlet("/addStudentServlet")
public class AddStudentServlet extends HttpServlet {
    @SneakyThrows
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)  {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=utf-8");
        //获取参数
        UUID id = UUID.randomUUID();
        String name = req.getParameter("name");
        String birthday = req.getParameter("birthday");
        String description = req.getParameter("description");
        String avgScore = req.getParameter("avgScore");
        //日期转格式
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = sdf.parse(birthday);
        Student student = new Student(id.toString(),name,date,description, Integer.parseInt(avgScore));

        StudentService studentService = new StudentServiceImpl();
        studentService.saveStudent(Integer.parseInt(avgScore),student);
        req.setAttribute("notify_msg","添加成功");
        req.getRequestDispatcher("index.jsp").forward(req,resp);
    }
}
