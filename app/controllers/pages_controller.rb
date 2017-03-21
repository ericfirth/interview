class PagesController < ApplicationController
  def show
    page = params[:id]
    @props = ScoreboardProps.new.props_with_page(page)
  end
end
