console.log('ANGULAR!!')

angular.module('puppy_app', ['ui.router'])
  .config(PostRouter)
  .controller('PostController',PostController);

  function PostRouter($stateProvider, $urlRouterProvider){
    $urlRouterProvider.otherwise('gohome');

    $stateProvider
      .state('login', {
        url: '/',
        templateUrl: '../templates/login/login.html'
      })
      .state('gohome', {
        url: 'home',
        templateUrl: '../templates/login/newtemp.html'
      })

  }

  function PostController() {

  }
