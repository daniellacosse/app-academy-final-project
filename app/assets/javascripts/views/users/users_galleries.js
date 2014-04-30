DArt.Views.UsersGalleries = Backbone.View.extend({

  tagName: "section",

  className: "galleries",

  template: JST["users/galleries"],

  render: function () {
    var that = this

    _(DArt.galleries).each(function(gallery){
        that.$el.append(
          JST['gallery/preview']({
            model: gallery
          })
        )
      })

    return this
  }

})