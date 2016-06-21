class LandingsController < ApplicationController
  def index
    @bars = Bar.all
  end
end
