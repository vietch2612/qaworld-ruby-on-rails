class ArticlesController < ApplicationController

  http_basic_authenticate_with name: "dhh", password: "password", except: [:index, :show]

  def index
    @categories = Category.all.order('title')

    if params[:category_id].nil? then
      @articles = Article.all.order('created_at DESC')
      @list_content = "List of all articles"
    else
      @articles = Article.where(id: params[:category_id])
      @list_content = "Filter by " + Category.find(params[:category_id]).title
    end

  end

  def show
    @article = Article.find(params[:id])
    @category_title = Category.find(@article.category_id)
    @categories = Category.all.order('title')
  end

  def new
    @article = Article.new
    @categories = Category.all.order('title')
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @category = Category.find(params[:article][:category])
    @article = @category.articles.create(article_params)
    # @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :text, :img_url)
    end

end
