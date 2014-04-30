DArt.Views.UsersJournals = Backbone.View.extend({

  tagName: "section",

  className: "journals"

  template: JST["users/journals"],

  render: function () {

    var that = this

    _(DArt.journals).each(function(journal){
        that.$el.append(
          JST['journal/preview']({
            model: journal
          })
        )
      })

    return this
  }

})