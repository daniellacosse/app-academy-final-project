window.DArt = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function(options) {
    console.log('Hello from Backbone!');

    DArt.isUser = options.isUser;
    DArt.user = new DArt.Models.User(options.user);
    DArt.deviations = new DArt.Collections.Deviations(options.userDeviations);
    DArt.galleries = new DArt.Collections.Galleries(options.userGalleries);
    DArt.journals = new DArt.Collections.Journals(options.userJournals);

    DArt.router = new DArt.Routers.Users({
      $rootEl: $(".main-content"),
      $info: $(".user-info"),
      $contentMenu: $(".user-content")
    });

    Backbone.history.start();
  }
};

