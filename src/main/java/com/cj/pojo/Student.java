package com.cj.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import java.util.Date;

/**
 * @author  chenjun
 * @create  2021/1/26 11:18
 * @desc    学生实体类
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Student {
    /**
     * 学生id
     */
    private String id;
    /**
     * 学生姓名
     */
    private String name;
    /**
     * 学生出生日期
     */
    private Date birthday;
    /**
     * 备注
     */
    private String description;
    /**
     * 平均分
     */
    private int avgScore;
}
