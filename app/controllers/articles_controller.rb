class ArticlesController < ApplicationController

before_action :find_article , only: [:show , :edit , :destroy , :update]

def index
	@articles = Article.all.order("created_at DESC")
end

def new 
	@article = Article.new
end

def create
	@article = Article.new(article_params)
	if @article.save
		redirect_to @article
	else
		render 'new'
	end
end

def show
	
end

def edit

end

def update
	if @article.update(article_params)
		redirect_to root_path
	else
		render 'edit'
	end
end

private

def find_article
	@article = Article.find(params[:id])
end

def article_params
	params.require(:article).permit(:title , :content)
end

end
