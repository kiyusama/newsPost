class ArticlesController < ApplicationController


  before_action :authenticate_user!


  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article, notice: "記事が正常に投稿されました"
    else
      render 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article, notice: "記事が正常に更新されました"
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to root_path, notice: "記事が正常に削除されました"
  end

  private
    def article_params
      params.require(:article).permit(:title, :body, :genre)
    end
end
