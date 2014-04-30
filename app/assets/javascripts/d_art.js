window.DArt = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function(options) {
    console.log('Hello from Backbone!');

    DArt.isUser = options.isUser;
    DArt.user = new DArt.Models.User(options.user, {parse: true});

    DArt.router = new DArt.Routers.Users({
      $rootEl: $(".main-content"),
      $info: $(".user-info"),
      $contentMenu: $(".user-content")
    });

    Backbone.history.start();
  }
};

