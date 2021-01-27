package com.cj.servlet;

import com.alibaba.fastjson.JSON;
import com.cj.pojo.Student;
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
 * @description 根据学生id查询信息
 * @create 2021-01-26 14:24
 **/
@WebServlet("/findStudentById")
public class FindStudentById extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=utf-8");
        String id = req.getParameter("id");
        ArrayList<Student> students = StudentServiceImpl.getZrange(0,-1);
        for (Student student : students) {
            if(student.getId().equals(id)){
                req.setAttribute("studentById",JSON.toJSONString(student));
            }
        }
        req.getRequestDispatcher("index.jsp").forward(req,resp);
    }
}
