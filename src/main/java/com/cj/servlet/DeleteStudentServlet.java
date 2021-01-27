package com.cj.servlet;

import com.alibaba.fastjson.JSON;
import com.cj.pojo.Student;
import com.cj.service.StudentService;
import com.cj.service.impl.StudentServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 * @author chenjun
 * @description 删除学生信息
 * @create 2021-01-26 14:22
 **/
@WebServlet("/deleteStudentServlet")
public class DeleteStudentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=utf-8");
        String id = req.getParameter("id");
        StudentService studentService = new StudentServiceImpl();
        //获取所有学生信息
        ArrayList<Student> students = StudentServiceImpl.getZrange(0,-1);
        for (Student student : students) {
            //判断该id是否存在于redis中
            if(student.getId().equals(id)){
                studentService.deleteStudent(JSON.toJSONString(student));
            }
        }
        req.setAttribute("notify_msg","删除成功");
        req.getRequestDispatcher("index.jsp").forward(req,resp);
    }
}
