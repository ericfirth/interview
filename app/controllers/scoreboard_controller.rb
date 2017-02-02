class ScoreboardController < ApplicationController
  def index
    page = params[:page] || 1
    @props = ScoreboardProps.new.props_with_page(page)
  end
end
