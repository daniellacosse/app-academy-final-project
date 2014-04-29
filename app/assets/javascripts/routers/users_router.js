DArt.Routers.Users = Backbone.Router.extend({

  initialize: function (options) {
    this.$rootEl = options.$rootEl,
    this.$info = options.$info,
    this.$contentMenu = options.$contentMenu
  },

  routes: {
    "users/:user_id/journals" : "journals",
    "users/:user_id/galleries" : "galleries",
    "journal/new" : "newJournal",
    "gallery/new" : "newGallery",
    "deviation/new" : "newDeviation",
    "edit" : "edit",
    "users/:id" : "show"
  },

  edit: function (id) {
    var view = new DArt.Views.UsersEdit({
      model: DArt.user
    })

    this._swapView(view)
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
