DArt.Models.Deviation = Backbone.Model.extend({

  parse: function (jsonResp) {
    if (jsonResp.tags){
      this._tags = new DArt.Collections.Tags(jsonResp.tags);

      delete jsonResp.tags;
    }

    if (jsonResp.comments){
      this._comments = new DArt.Collections.Comments(jsonResp.comments);

      delete jsonResp.comments;
    }

    return jsonResp
  }

});