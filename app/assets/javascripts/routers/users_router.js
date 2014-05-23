DArt.Routers.Users = Backbone.Router.extend({

  initialize: function (options) {
    this.$rootEl = options.$rootEl,
    this.$info = options.$info,
    this.$contentMenu = options.$contentMenu

    this.$contentMenu.html(
      JST["users/content"]()
    )
  },

  routes: {
    "journals" : "journals",
    "galleries" : "galleries",
    "notifications" : "notifications",
    "journal/new" : "newJournal",
    "gallery/new" : "newGallery",
    "deviation/new" : "newDeviation",
    "edit" : "edit",
    "" : "show"
  },

  edit: function () {
    var view = new DArt.Views.UsersEdit({
      model: DArt.user
    })

    this._swapView(view)
  },

  show: function () {

    var view = new DArt.Views.UsersShow({
      model: DArt.user
    })

    this._swapView(view)

  },

  journals: function () {

    var view = new DArt.Views.UsersJournals({
      model: DArt.user
    })

    this._swapView(view)

  },

  newJournal: function () {

    var view = new DArt.Views.UsersNewJournal({
      model: DArt.user
    })

    this._swapView(view)

  },

  galleries: function () {

    var view = new DArt.Views.UsersGalleries({
      model: DArt.user
    })

    this._swapView(view)

  },

  notifications: function () {

    var view = new DArt.Views.UsersNotifications({
      model: DArt.user
    })

    this._swapView(view)

  },

  newGallery: function () {

    var view = new DArt.Views.UsersNewGallery({
      model: DArt.user
    })

    this._swapView(view)

  },

  newDeviation: function () {

    var view = new DArt.Views.UsersNewDeviation({
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
