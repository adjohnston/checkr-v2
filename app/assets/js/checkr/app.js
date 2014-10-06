;(function () {

  'use strict';

  angular.module('checkr', ['ngRoute'])
    .config(function ($routeProvider, $locationProvider) {
      $routeProvider
        .when('/', {
          templateUrl: '/views/home/index.html'
        });

      $locationProvider.html5Mode(true);
    });

} ());