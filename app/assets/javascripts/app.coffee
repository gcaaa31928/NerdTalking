nerdTalking = angular.module 'nerdTalking', [
    'ngAnimate',
    'ngAria',
    'ui.router',
]

nerdTalking.config ($stateProvider, $urlRouterProvider) ->
    $stateProvider.state('main',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
    ).state('main.index',
        url: '/'
        templateUrl: 'views/index.html'
        controller: 'IndexCtrl'
    )