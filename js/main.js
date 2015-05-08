---
---

angular.module('app', [
  'ngRoute',
  'templates',
  'ui.bootstrap'
])

.config(['$routeProvider',
  function($routeProvider) {
    $routeProvider.
      otherwise({
        template: function() {
          return "<any-page></any-page>";
        }
      });
  }])

.controller('navCtrl', [ '$scope', '$location',
  function($scope, $location) {
    $scope.navbarCollapsed = true;

    $scope.isActive = function (viewLocation) {
      return viewLocation === $location.path() + "/"; // To match permalinks
    };
  }])

.controller('mapCtrl', [ '$scope', '$modal',
  function($scope, $modal) {
    $scope.open = function() {
      $modal.open({
        animation: true,
        templateUrl: '/map.html'
      });
    }
  }])

.directive('anyPage', [ '$location',
  function($location) {
    return {
      restrict: 'EA',
      replace: true,
      templateUrl: function() {
        // return $location.path();
        return "/construction/";
      }
    };
  }])

;
