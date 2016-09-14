class ScoreboardController < ApplicationController
  def index
    @props = ScoreboardProps.new.props
  end
end
