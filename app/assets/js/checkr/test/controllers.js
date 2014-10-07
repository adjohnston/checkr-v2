'use strict';

angular.module('checkr.test', [])
  .controller('testCtrl', ['$http', '$scope', function ($http, $scope) {
    var user = {},
        getUser = $http.get('http://localhost:9292/user');

    getUser.success(function (user) {
      $scope.user = user;
    });
  }]);