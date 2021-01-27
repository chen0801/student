<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE HTML>
<html lang="zh">
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8" />
    <title>学生中心</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link href="./static/layuiadmin/layui/css/layui.css" rel="stylesheet" type="text/css" media="all">
    <link href="./static/css/styles.css" rel="stylesheet" type="text/css" >
    <script src="./static/layuiadmin/layui/layui.js" type="text/javascript"></script>
    <script type="text/javascript" src="./static/js/jquery-3.3.1.min.js"></script>
</head>

<body>
<div class="layui-container">
    <button class="layui-btn" id="addStudent">添加</button>
    <%--<div class="demoTable">
        用户名：
        <div class="layui-inline">
            <input class="layui-input" name="name" id="demoReload" autocomplete="off">
        </div>
        <button class="layui-btn" data-type="reload">搜索</button>
    </div>--%>
    <div class="layui-fluid" >
        <div class="layui-card">
            <div class="layui-card-header fontsize16">编辑删除学生信息</div>
            <div class="layui-card-body">
                <table class="layui-hide" id="user_table" lay-filter="user-operate"></table>
                <script type="text/html" id="user-operate">
                    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="edit">编辑</a>
                    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">删除</a>
                </script>
            </div>
        </div>
    </div>
    <!-- 添加编辑用户部分 -->
    <div class="hidden" id="edituser" style="display: none">
        <form class="layui-form" id="user_form">
            <div class="layui-row layui-col-space10 layui-form-item">
                <div class="layui-col-lg7">
                    <label class="layui-form-label">id:</label>
                    <div class="layui-input-block">
                        <input type="text" name="id"  id="id" readonly="readonly"  class="layui-input"/>
                    </div>
                </div>
                <div class="layui-col-lg5">
                </div>
            </div>
            <div class="layui-row layui-col-space10 layui-form-item">
                <div class="layui-col-lg7">
                    <label class="layui-form-label">用户名:</label>
                    <div class="layui-input-block">
                        <input type="text" name="name"  id="name" placeholder="请输入用户名" class="layui-input"/>
                    </div>
                </div>
                <div class="layui-col-lg5">
                </div>
            </div>
            <div class="layui-row layui-col-space10 layui-form-item">
                <div class="layui-col-lg7">
                    <label class="layui-form-label">出生日期:</label>
                    <div class="layui-input-block">
                        <input type="text" class="layui-input" id="birthday2" name="birthday" placeholder="yyyy-MM-dd" readonly="readonly" autocomplete="off">
                    </div>
                </div>
                <div class="layui-col-lg5">
                </div>
            </div>
            <hr>
            <div class="layui-row layui-col-space10 layui-form-item">
                <div class="layui-col-lg7">
                    <label class="layui-form-label">备注:</label>
                    <div class="layui-input-block">
                        <input type="text" name="description"  id="description" placeholder="请输入备注" lay-verify="required" autocomplete="on" class="layui-input"/>
                    </div>
                </div>
                <div class="layui-col-lg5">
                </div>
            </div>
            <div class="layui-row layui-col-space10 layui-form-item">
                <div class="layui-col-lg7">
                    <label class="layui-form-label">平均分:</label>
                    <div class="layui-input-block">
                        <input type="text" name="avgScore"  id="avgScore" placeholder="请输入平均分" lay-verify="required" autocomplete="on" class="layui-input"/>
                    </div>
                </div>
                <div class="layui-col-lg5">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button type="button" class="layui-btn" id="btn_save">保存</button>
                </div>
            </div>
        </form>
    </div>
    <div class="hidden" id="saveuser" style="display: none">
        <form class="layui-form" id="save_user_form">
            <div class="layui-row layui-col-space10 layui-form-item">
                <div class="layui-col-lg7">
                    <label class="layui-form-label">用户名:</label>
                    <div class="layui-input-block">
                        <input type="text" name="name"  id="save_name" placeholder="请输入用户名" class="layui-input"/>
                    </div>
                </div>
                <div class="layui-col-lg5">
                </div>
            </div>
            <div class="layui-row layui-col-space10 layui-form-item">
                <div class="layui-col-lg7">
                    <label class="layui-form-label">出生日期:</label>
                    <div class="layui-input-block">
                        <input type="text" class="layui-input" id="save_birthday2" name="birthday" placeholder="yyyy-MM-dd" readonly="readonly" autocomplete="off">
                    </div>
                </div>
                <div class="layui-col-lg5">
                </div>
            </div>
            <hr>
            <div class="layui-row layui-col-space10 layui-form-item">
                <div class="layui-col-lg7">
                    <label class="layui-form-label">备注:</label>
                    <div class="layui-input-block">
                        <input type="text" name="description"  id="save_description" placeholder="请输入备注" lay-verify="required" autocomplete="on" class="layui-input"/>
                    </div>
                </div>
                <div class="layui-col-lg5">
                </div>
            </div>
            <div class="layui-row layui-col-space10 layui-form-item">
                <div class="layui-col-lg7">
                    <label class="layui-form-label">平均分:</label>
                    <div class="layui-input-block">
                        <input type="text" name="avgScore"  id="save_avgScore" placeholder="请输入平均分" lay-verify="required" autocomplete="on" class="layui-input"/>
                    </div>
                </div>
                <div class="layui-col-lg5">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button type="button" class="layui-btn" id="save_btn_save">保存</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script>
    layui.config({
        base : 'static/layuiadmin/' //静态资源所在路径
    }).extend({
        index : 'lib/index' //主入口模块
    }).use([ 'index', 'layer','form','laydate', 'table', 'laypage'], function() {
        var $ = layui.$,
            layer = layui.layer,
            laypage = layui.laypage,
            form=layui.form,
            laydate=layui.laydate,
            table = layui.table;
        laydate.render({
            elem: '#birthday2'
            ,trigger: 'click'
        });
        laydate.render({
            elem: '#save_birthday2'
            ,trigger: 'click'
        });
        var usertable = table.render({
            elem : '#user_table',
            url : 'listStudentServlet',
            parseData:function(res){//res 即为原始返回的数据
                //res =$.parseJSON(res);
                console.log(res)
                return res;
            },
            cols : [ [
                {
                    field : 'id',
                    width : '30%',
                    title : 'id',
                    align : 'center'
                }
                , {
                    field : 'name',
                    width : '18%',
                    title : '用户名',
                    align : 'center'
                }
                , {
                    field : 'birthday',
                    width : '18%',
                    title : '出生日期',
                    align : 'center',
                    templet:"<div>{{layui.util.toDateString(d.birthday, 'yyyy-MM-dd')}}</div>"
                }
                , {
                    field : 'description',
                    width : '15%',
                    title : '备注',
                    align : 'center'
                }
                , {
                    field : 'avgScore',
                    width : '15%',
                    title : '平均分',
                    align : 'center'
                }
                , {
                    title : '操作',
                    width : '15%',
                    align : 'left',
                    fixed : 'right',
                    toolbar : '#user-operate'
                }
            ] ],
            id: 'testReload',
            limits: [3,5,10],
            limit: 5, //每页默认显示的数量
            page: true, //是否显示分页
            even:true,
            text : {
                none : '暂无相关数据'
            },
            loading : true,
            success:function () {
                layer.msg("查询成功");
            }
        });
        //监听工具条
        table.on('tool(user-operate)', function(obj) {
            var data = obj.data;
            if (obj.event === 'delete') {
                layer.confirm('您确定要删除该记录吗？', function(index) {
                    var url = 'deleteStudentServlet';
                    $.ajax({
                        url : url,
                        data : {
                            id:data.id
                        },
                        success : function(data, status) {
                            if (status == "success") {
                                if (data.code == -10) {
                                    //session过期，跳转
                                    window.top.location.href = "/" + data.data;
                                } else {
                                    usertable.reload();
                                    //var dataObj = JSON.parse(data);
                                    layer.msg("删除学生信息成功");
                                }
                            }
                        },
                        error : function(XMLHttpRequest, textStatus, errorThrown) {
                            layer.msg("删除学生信息失败");
                        }
                    });
                    layer.close(index);
                });
            }
            else if (obj.event === 'edit') {
                //显示弹出窗口
                $("#edituser").prop("style","display:block;margin:10px;");
                $('#id').val(data.id);
                $('#name').val(data.name);
                $('#birthday2').val(function () {
                    return layui.util.toDateString(data.birthday, 'yyyy-MM-dd')
                });
                $('#description').val(data.description);
                $('#avgScore').val(data.avgScore);
                form.render();
                layer.open({
                    title : '修改学生信息',
                    shadeClose : true,
                    area : ['650px', '450px'],
                    type: 1,
                    content: $('#edituser'),
                    //隐藏弹出窗口
                    end: function(){
                        $("#edituser").prop("style","display:none;");
                    }
                });
            }
        });
        $("body").on("click","#addStudent",function () {
            //显示弹出窗口
            $("#saveuser").prop("style","display:block;margin:10px;");
            $('#save_name').val(null)
            $('#save_birthday2').val(null)
            $('#save_description').val(null)
            $('#save_avgScore').val(null)
            layer.open({
                title : '添加学生信息',
                shadeClose : true,
                area : ['650px', '450px'],
                type: 1,
                content: $('#saveuser'),
                //隐藏弹出窗口
                end: function(){
                    $("#saveuser").prop("style","display:none;");
                }
            });
        })
        //点击了修改按钮
        $("body").on("click", "#btn_save", function() {
            var username=$('#name').val();
            if(username==null || username==undefined || username=="")
            {
                layer.msg("用户名不能为空",{icon:5});
                return;
            }
            if(!/^([\u4e00-\u9fa5]|[0-9_a-zA-Z]){2,8}$/.test(username))
            {
                layer.msg("用户名2-8位",{icon:5});
                return;
            }
            var birthday=$('#birthday2').val();
            if(birthday==null || birthday==undefined || birthday=="")
            {
                layer.msg("出生日期不能为空",{icon:5});
                return;
            }
            var description=$('#description').val();
            if(description==null || description==undefined || description=="")
            {
                layer.msg("备注不能为空",{icon:5});
                return;
            }
            if(!/^([\u4e00-\u9fa5]|[0-9_a-zA-Z]){1,50}$/.test(description))
            {
                layer.msg("备注请少于50个字",{icon:5});
                return;
            }
            var avgScore=$('#avgScore').val();
            if(avgScore==null || avgScore==undefined || avgScore=="")
            {
                layer.msg("平均分不能为空",{icon:5});
                return;
            }
            if(!/^100$|^(\d|[1-9]\d)$/.test(avgScore))
            {
                layer.msg("平均分不能超过100",{icon:5});
                return;
            }
            var data=$('#user_form').serialize();
            var url='updateStudentServlet';
            $.post(
                url,
                data,
                function(data,status,xhr){
                    if(status=="success"){
                        var dataObj = JSON.parse(data)
                        layer.msg(dataObj.msg);
                        layer.closeAll('page');
                        usertable.reload();
                        layer.msg("编辑学生信息成功！")
                    }
                    else
                    {
                        return layer.msg("编辑学生信息失败！");
                    }
                },"json")
                .fail(function() {
                    layer.closeAll('page');
                    usertable.reload();
                    return layer.msg("编辑学生信息成功！");
                });
        });
        //点击了修改按钮
        $("body").on("click", "#save_btn_save", function() {
            var username=$('#save_name').val();
            if(username==null || username==undefined || username=="")
            {
                layer.msg("用户名不能为空",{icon:5});
                return;
            }
            if(!/^([\u4e00-\u9fa5]|[0-9_a-zA-Z]){2,8}$/.test(username))
            {
                layer.msg("用户名2-8位",{icon:5});
                return;
            }
            var birthday=$('#save_birthday2').val();
            if(birthday==null || birthday==undefined || birthday=="")
            {
                layer.msg("出生日期不能为空",{icon:5});
                return;
            }
            var description=$('#save_description').val();
            if(description==null || description==undefined || description=="")
            {
                layer.msg("备注不能为空",{icon:5});
                return;
            }
            if(!/^([\u4e00-\u9fa5]|[0-9_a-zA-Z]){1,50}$/.test(description))
            {
                layer.msg("备注请少于50个字",{icon:5});
                return;
            }
            var avgScore=$('#save_avgScore').val();
            if(avgScore==null || avgScore==undefined || avgScore=="")
            {
                layer.msg("平均分不能为空",{icon:5});
                return;
            }
            if(!/^100$|^(\d|[1-9]\d)$/.test(avgScore))
            {
                layer.msg("平均分不能超过100",{icon:5});
                return;
            }
            var data=$('#save_user_form').serialize();
            var url='addStudentServlet';
            $.post(
                url,
                data,
                function(data,status,xhr){
                    if(status=="success"){
                        var dataObj = JSON.parse(data)
                        layer.msg(dataObj.msg);
                        layer.closeAll('page');
                        usertable.reload();
                        layer.msg("添加学生信息成功！")
                    }
                    else
                    {
                        return layer.msg("添加学生信息失败！");
                    }
                },"json")
                .fail(function() {
                    layer.closeAll('page');
                    usertable.reload();
                    return layer.msg("添加学生信息成功！");
                });
        });
    });
</script>
<!-- 清空session中提示信息 -->
<c:set var="notify_msg" value="" scope="request"/>
</body>
</html>
