'use strict';
sxlcApp.controller('formlayoutCtrl', ['$scope', '$filter', '$http', function($scope, $filter, $http){
 $scope.title = '表单布局中';
 $scope.dataParamsUrl = './php/formlayout.json';
  
 $scope.resetForm = function(num){
  console.log(num)
 }
}]);