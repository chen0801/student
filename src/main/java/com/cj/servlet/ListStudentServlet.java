package com.cj.servlet;

import com.alibaba.fastjson.JSONObject;
import com.cj.pojo.Student;
import com.cj.service.StudentService;
import com.cj.service.impl.StudentServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * @author chenjun
 * @description 查询所有学生信息
 * @create 2021-01-26 14:27
 **/
@WebServlet("/listStudentServlet")
public class ListStudentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=utf-8");
        //获取分页参数
        String page = req.getParameter("page");
        String limit = req.getParameter("limit");
        PrintWriter out = resp.getWriter();
        JSONObject tableData = new JSONObject();
        StudentService studentService = new StudentServiceImpl();
        //分页
        if(page != null && limit != null){
            List<Student> studentsByPage = studentService.listStudentByPage(Integer.parseInt(page),Integer.parseInt(limit));
            //获取总的数据条数，用于分页
            List<Student> studentAll = studentService.listStudent();
            tableData.put("count", studentAll.size());
            tableData.put("data", studentsByPage);
            tableData.put("msg", "查询成功");
        }else {
            tableData.put("msg", "查询失败");
        }

        tableData.put("code", 0);
        out.print(tableData.toJSONString());
    }
}
