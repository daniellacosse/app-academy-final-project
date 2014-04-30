DArt.Views.UsersGalleries = Backbone.View.extend({

  tagName: "section",

  className: "galleries",

  template: JST["users/galleries"],

  render: function () {
    var that = this

     DArt.user._galleries.each(function(gallery){
        that.$el.append(
          JST['galleries/preview']({
            model: gallery
          })
        )
      })

    return this
  }

})