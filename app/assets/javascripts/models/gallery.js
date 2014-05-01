DArt.Models.Gallery = Backbone.Model.extend({

  parse: function (jsonResp) {
    if (jsonResp.deviations){
      this._deviations = new DArt.Collections.Deviations(jsonResp.deviations,
        {parse: true}
      );

      delete jsonResp.tags;
    }

    return jsonResp
  }

});