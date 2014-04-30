window.DArt = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function(user, isUser) {
    console.log('Hello from Backbone!');

    DArt.user = new DArt.Models.User(user);
    DArt.isUser = isUser;

    DArt.router = new DArt.Routers.Users({
      $rootEl: $(".main-content"),
      $info: $(".user-info"),
      $contentMenu: $(".user-content")
    });

    Backbone.history.start();
  }
};

