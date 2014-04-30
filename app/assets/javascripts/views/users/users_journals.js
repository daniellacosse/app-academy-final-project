DArt.Views.UsersJournals = Backbone.View.extend({

  tagName: "section",

  className: "journals"

  template: JST["users/journals"],

  render: function () {
    _(DArt.journals).each(function(journal){
        this.$el.append(
          JST['journal/preview'].template({
            model: journal
          })
        )
      })

    return this
  }

})