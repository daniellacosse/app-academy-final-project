DArt.Views.UsersGalleries = Backbone.View.extend({

  tagName: "section",

  className: "galleries",

  template: JST["users/galleries"],

  render: function () {
    _(DArt.galleries).each(function(gallery){
        this.$el.append(
          JST['gallery/preview'].template({
            model: gallery
          })
        )
      })

    return this
  }

})