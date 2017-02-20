<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>angular material Demo</title>
<!-- angular and material -->
<!-- 新 Bootstrap 核心 CSS 文件 http://www.zhuxianfei.com/jishu/js/4141.html -->
<link rel="stylesheet" href="js/libs/bootstrap/css/bootstrap.min.css">
<style>
  #divMain {
    width: 500px;
    margin: 0 auto;
    margin-top: 100px;
  }
  nav {
    position: relative;
    width:100%;
    height: 50px;
  }
  .pagination {
    right: 0px;
    position: absolute;
    top: -30px;
  }
  nav li {
    cursor: pointer;
  }
</style>
</head>
<body>
<div class="container" ng-controller="formlayoutCtrl">
 <span>{{title}}</span>
 <form class="form-horizontal" style="width: 400px;" name="formlayout" w5c-form-validate="validateOptions" novalidate>
  <form-layout url="dataParamsUrl">
     
  </form-layout>
  <button type="submit" class="btn btn-sm btn-info">
   提交
  </button>
  <button type="reset" class="btn btn-sm btn-danger" ng-click="resetForm()">
   重置
  </button>
 </form>
</div>

<script src="js/libs/angular/angular.min.js"></script>

</body>
</html>