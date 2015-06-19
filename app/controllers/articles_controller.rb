class ArticlesController < ApplicationController
  before_action :set_machine

  def new
    @article = Article.new
    @article.section_id = params[:section_id]
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @machine, notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.purchase!
    redirect_to @machine, notice: 'Article was successfully destroyed.'
  end

  private

  def set_machine
    @machine = Machine.find(params[:machine_id])
  end

  def article_params
    params.require(:article).permit(:name, :price, :expiry_date, :section_id)
  end
end
