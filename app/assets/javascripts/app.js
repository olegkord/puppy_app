console.log('ANGULAR!!')

angular.module('puppy_app', [])
  .controller('WelcomeController', WelcomeController);

  function WelcomeController() {
    self = this;
  }
