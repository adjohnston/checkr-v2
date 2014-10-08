'use strict';

angular.module('checkr.test', [])
  .controller('testCtrl', ['$http', '$scope', function ($http, $scope) {
    var users    = {},
        getUsers = $http.get('http://localhost:9292/users');

    getUsers.success(function (users) {
      $scope.users = users;
    });
  }]);