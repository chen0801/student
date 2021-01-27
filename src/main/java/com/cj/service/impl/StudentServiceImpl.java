package com.cj.service.impl;

import com.alibaba.fastjson.JSON;
import com.cj.pojo.Student;
import com.cj.service.StudentService;
import com.cj.util.RedisConnection;
import redis.clients.jedis.Jedis;

import java.util.*;

/**
 * @author chenjun
 * @description 学生service实现类
 * @create 2021-01-26 11:40
 **/
public class StudentServiceImpl implements StudentService {

    /**
     * 添加学生信息
     * @param student 学生信息
     */
    @Override
    public void saveStudent(int score,Student student) {
        //获取jedis连接
        Jedis jedis = RedisConnection.getJedis();
        //添加数据
        //把student对象转换为json字符串
        //存入redis数据库
        jedis.zadd("student",score,JSON.toJSONString(student));
        jedis.close();

    }

    /**
     * 删除学生信息
     * @param value 对应的json字符串
     */
    @Override
    public void deleteStudent(String value) {
        //获取jedis连接
        Jedis jedis = RedisConnection.getJedis();
        jedis.zrem("student",value);
        jedis.close();
    }

    /**
     * 修改学生信息
     * @param student
     */
    @Override
    public void updateStudent(Student student) {
        //获取jedis连接
        Jedis jedis = RedisConnection.getJedis();
        //添加数据
        Map<String,String> map = new HashMap<String,String>(16);
        //把student对象转换为json字符串
        String s = JSON.toJSONString(student);
        //把数据存入map key:id value:json字符串
        map.put(student.getId(),s);
        //存入redis数据库
        jedis.hmset("student",map);
        jedis.close();
    }

    /**
     * 根据学生id查询学生信息
     * @param id
     * @return
     */
    @Override
    public String  findById(String id) {
        //获取jedis连接
        Jedis jedis = RedisConnection.getJedis();
        String s = jedis.hget("student",id);
        jedis.close();
        return s;
    }

    /**
     * 查询所有学生信息
     * @return
     */
    @Override
    public List<Student> listStudent() {
        //获取jedis连接
        Jedis jedis = RedisConnection.getJedis();
        ArrayList<Student> students = getZrange(0,-1);
        return students;
    }

    /**
     * 分页查询所有学生信息
     * @param pageNum 当前页
     * @param pageSize 每页条数
     * @return
     */
    @Override
    public List<Student> listStudentByPage(int pageNum, int pageSize) {
        int start = pageSize * (pageNum - 1);
        int end = start + pageSize - 1;
        ArrayList<Student> list = getZrange(start, end);
        return list;
    }

    /**
     * 遍历redis数据库
     * 从小到大排序
     * @param
     * @return
     */
    public static ArrayList<Student> getZrange(int start,int end){
        //获取jedis连接
        Jedis jedis = RedisConnection.getJedis();
        //根据score逆序 即从小到大排序
        Set<String> zrange = jedis.zrevrange("student", start, end);
        ArrayList<Student> list = new ArrayList<>();
        for (String s : zrange) {
            Student student = JSON.parseObject(s, Student.class);
            list.add(student);
        }
        jedis.close();
        return list;
    }
}
