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
<link rel="stylesheet" href="js/libs/material/angular-material.min.css" />
<script src="js/libs/angular/angular.min.js"></script>
<script src="js/libs/angular/angular-animate.min.js"></script>
<script src="js/libs/angular/angular-aria.min.js"></script>
<script src="js/libs/angular/angular-messages.min.js"></script>
<script src="js/libs/material/angular-material.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<style>
.box {color:white;padding:10px;text-align:center;border-style: inset;}
.green {background:green;}
.blue {background:blue;}
</style>
<script language="javascript">
    angular
      .module('firstApplication', ['ngMaterial'])
      .controller('layoutController', layoutController);

    function layoutController ($scope) {            
    }	  
</script>      

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
</head>
<body ng-app="firstApplication">
<p>分支</p><p>有效</p><p>有效2</p>
<div id="layoutContainer" ng-controller="layoutController as ctrl" layout="row" style="height:100px;" ng-cloak layout-wrap>
   <div flex="30" class="green box">
      [flex="30"]
   </div>
   <div flex="45" class="blue box">
      [flex="45"]
   </div>
   <div flex="25" class="green box">
      [flex="25"]
   </div>
   <div flex="33" class="green box">
      [flex="33"]
   </div>
   <div flex="66" class="blue box">
      [flex="66"]
   </div>
   <div flex="50" class="blue box">
      [flex="50"]
   </div>
   <div flex class="green box">
      [flex]
   </div>
</div>
</body>
</html>