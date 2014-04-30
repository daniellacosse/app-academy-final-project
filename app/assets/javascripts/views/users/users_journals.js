DArt.Views.UsersJournals = Backbone.View.extend({

  tagName: "section",

  className: "journals",

  template: JST["users/journals"],

  render: function () {

    var that = this

    DArt.user._journals.each(function(journal){
        that.$el.append(
          JST['journals/preview']({
            model: journal
          })
        )
      })

    return this
  }

})