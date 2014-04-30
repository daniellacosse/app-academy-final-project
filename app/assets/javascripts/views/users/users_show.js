DArt.Views.UsersShow = Backbone.View.extend({

  tagName: "section",

  className: "deviation-grid shrinkwrap-center",

  template: JST['users/show'],

  render: function () {

    _(DArt.user.get("deviations")).each(function(deviation){
        this.$el.append(
          JST['deviation/preview'].template({
            model: deviation
          })
        )
      })

    return this

  }

});
