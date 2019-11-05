<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../base.jsp"%>
<!DOCTYPE html>
<html>

<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>数据 - AdminLTE2定制版</title>
    <meta name="description" content="AdminLTE2定制版">
    <meta name="keywords" content="AdminLTE2定制版">
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
</head>

<body>
<div id="frameContent" class="content-wrapper" style="margin-left:0px;">
<section class="content-header">
    <h1>
        系统管理
        <small>用户管理</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="all-admin-index.html"><i class="fa fa-dashboard"></i> 首页</a></li>
    </ol>
</section>
<section class="content">
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title">用户列表</h3>
        </div>
        <div class="box-body">
            <div class="table-box">
                <div class="pull-left">
                    <div class="form-group form-inline">
                        <div class="btn-group">
                            <button type="button" class="btn btn-default" title="新建" onclick='location.href="${pageContext.request.contextPath}/pages/user/user-edit.jsp"'><i class="fa fa-file-o"></i> 新建</button>
                        </div>
                    </div>
                </div>
                <div class="box-tools pull-right">
                    <div class="has-feedback">
                        <input type="text" class="form-control input-sm" placeholder="搜索">
                        <span class="glyphicon glyphicon-search form-control-feedback"></span>
                    </div>
                </div>
                <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
                    <thead>
                    <tr>
                        <th class="sorting">用户名</th>
                        <th class="sorting">邮箱</th>
                        <th class="sorting">联系电话</th>
                        <th class="sorting">状态</th>
                        <th class="text-center">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${pageInfo.list}" var="item">
                    <tr>
                        <td>${item.username}</td>
                        <td>${item.email}</td>
                        <td>${item.phone }</td>
                        <td>${item.state  ==0?'停用':'启用'}</td>
                        <th class="text-center">
                            <button type="button" class="btn bg-olive btn-xs" onclick='location.href="${pageContext.request.contextPath}/user/toUpdate.do?id=${item.id}"'>编辑</button>
                        </th>
                    </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="box-footer">
            <div class="pull-left">
                <div class="form-group form-inline">
                    总共${pageInfo.pages}页，共${pageInfo.total}条数据。 每页
                    <select class="form-control" onchange="changePageSize(this.value)">
                        <option>--请选择--</option>
                        <option>5</option>
                        <option>10</option>
                        <option>20</option>
                    </select> 条
                </div>
            </div>

            <div class="box-tools pull-right">
                <ul class="pagination">
                    <li>
                        <a href="${pageContext.request.contextPath}/user/findAll.do?page=1&pageSize=${pageInfo.pageSize}" aria-label="Previous">首页</a>
                    </li>
                    <li><a href="${pageContext.request.contextPath}/user/findAll.do?page=${pageInfo.prePage}&pageSize=${pageInfo.pageSize}">上一页</a></li>
                    <c:forEach begin="${pageInfo.navigateFirstPage}" end="${pageInfo.navigateLastPage}" var="num">
                        <c:if test="${pageInfo.pageNum==num}">
                            <li><a href="${pageContext.request.contextPath}/user/findAll.do?page=${num}&pageSize=${pageInfo.pageSize}"><b>${num}</b></a></li>
                        </c:if>
                        <c:if test="${pageInfo.pageNum!=num}">
                            <li><a href="${pageContext.request.contextPath}/user/findAll.do?page=${num}&pageSize=${pageInfo.pageSize}">${num}</a></li>
                        </c:if>
                    </c:forEach>
                    <li><a href="${pageContext.request.contextPath}/user/findAll.do?page=${pageInfo.nextPage}&pageSize=${pageInfo.pageSize}">下一页</a></li>
                    <li>
                        <a href="${pageContext.request.contextPath}/user/findAll.do?page=${pageInfo.pages}&pageSize=${pageInfo.pageSize}" aria-label="Next">尾页</a>
                    </li>
                </ul>
            </div>

        </div>

        <script>
            function changePageSize(pageSize){
                location.href="${pageContext.request.contextPath}/user/findAll.do?page=1&pageSize="+pageSize;
            }
        </script>
    </div>

</section>
</div>
</body>

</html>