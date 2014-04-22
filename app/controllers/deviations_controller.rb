class DeviationsController < ApplicationController
  def index
    @deviations = Deviation.all
  end
end
