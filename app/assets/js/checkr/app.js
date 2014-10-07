;(function () {

  'use strict';

  angular.module('checkr', [
    'checkr.test',
    'ngRoute'
  ])
    .config(function ($routeProvider, $locationProvider) {
      $routeProvider
        .when('/', {
          templateUrl: '/views/home/index.html',
          controller:  'testCtrl'
        });

      $locationProvider.html5Mode(true);
    });

} ());