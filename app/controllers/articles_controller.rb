class ArticlesController < ApplicationController
  def index
  	@article=Article.all
  end


  def new
  	#@article = Article.new
    @article= current_user.articles.build
  end

  def create
  	#@article = Article.new (article_params)
  	#if @article.save
  	#	redirect_to @article
  	#else 
  	#	render "new"
  	#end
    @article= current_user.articles.build(article_params)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  # for edit action, first locate the target article, then direct to the edit view which will 
  # have a form to take user inputs
  def edit
  	@target=Article.find(params[:id])
  end

  def update
  	@target = Article.find(params[:id])

    if @target.update(article_params) # will return a boolean
    	redirect_to @target
    else 
    	render "edit"
    end

  end

  def show
  	@target= Article.find(params[:id])
  end


  # for destroy action need to modify the code in index' view and anywhere the delete action is used
  #  eg. <%= link_to "delete" , article_path(sth.id) , method: delete , data: {confirm: "msg"} %>
  def destroy
  	@target= Article.find(params[:id])
  	@target.destroy
  	redirect_to articles_path
  end

  private 
  	def article_params
  		params.require(:article).permit(:title , :author , :description)
  	end
  	# the argument for require is the object from form_for

end
