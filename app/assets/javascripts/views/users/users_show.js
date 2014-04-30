DArt.Views.UsersShow = Backbone.View.extend({

  tagName: "section",

  className: "deviation-grid shrinkwrap-center",

  template: JST['users/show'],

  render: function () {

    var that = this

    DArt.user._deviations.each(function(deviation){

        that.$el.append(
          JST['deviations/preview']({
            model: deviation
          })
        )
      })

    return this

  }

});
