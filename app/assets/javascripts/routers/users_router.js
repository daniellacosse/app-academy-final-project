DArt.Routers.Users = Backbone.Router.extend({

  initialize: function (options) {
    this.$rootEl = options.$rootEl,
    this.$info = options.$info,
    this.$contentMenu = options.$contentMenu
  },

  routes: {
    "/api/users/:user_id/journals" : "journals",
    "/api/users/:user_id/journal/new" : "newJournal",
    "/api/users/:user_id/galleries" : "galleries",
    "/api/users/:user_id/gallery/new" : "newGallery",
    "/api/users/:user_id/deviation/new" : "newDeviation",
    "/api/users/:id/edit" : "edit",
    "/api/users/:id" : "show"
  },

  edit: function (id) {
    debugger
    var view = new DArt.Views.UsersEdit({
      model: DArt.user
    })

    that._swapView(view)

  },

  show: function (id) {

    var view = new DArt.Views.UsersShow({
      model: DArt.user
    })

    that._swapView(view)

  },

  journals: function (user_id) {

    var view = new DArt.Views.UsersJournals({
      model: DArt.user
    })

    this._swapView(view)

  },

  newJournal: function (user_id) {

    var view = new DArt.Views.UsersJournalCreate({
      model: DArt.user
    })

    this._swapView(view)

  },

  galleries: function (user_id) {

    var view = new DArt.Views.UsersGalleries({
      model: DArt.user
    })

    this._swapView(view)

  },

  newGallery: function (user_id) {

    var view = new DArt.Views.UsersGalleryCreate({
      model: DArt.user
    })

    this._swapView(view)

  },

  newDeviation: function (user_id) {

    var view = new DArt.Views.UsersDeviationCreate({
      model: DArt.user
    })

    this._swapView(view)

  },

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currenView = view;
    this.$rootEl.html(view.render().$el);
  }

});
