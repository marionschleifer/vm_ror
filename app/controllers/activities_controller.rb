class ActivitiesController < ApplicationController

  def index
    @articles = Article.sold
  end

end