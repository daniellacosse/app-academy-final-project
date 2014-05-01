DArt.Models.Tag = Backbone.Model .extend({
  parse: function (jsonResp) {
    jsonResp.url = "/search?query=" + jsonResp.tag
    debugger
    return jsonResp
  }
})