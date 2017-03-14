(function() {
  "use strict";
  angular.module("app").controller("pagesCtrl", function($scope, $http) {
    $scope.setup = function() {
      $http.get("/api/v1/students.json").then(function(response) {
        $scope.students = response.data;
      });
    }

    window.$scope = $scope;
  });
})();