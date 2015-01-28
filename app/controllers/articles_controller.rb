class ArticlesController < ApplicationController

before_action :authenticate_user! , except: [:index , :show]
before_action :find_article , only: [:show , :edit , :destroy , :update]

def index
	if params[:category].blank?
		@articles = Article.all.order("created_at DESC")
	else
		@category = Category.find_by(name: params[:category])
		@category_id = @category.id
		@articles = Article.where(category_id: @category_id).order("created_at DESC")
	end
end

def new 
	@article = current_user.articles.build
end

def create
	@article = current_user.articles.build(article_params)
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
	params.require(:article).permit(:title , :content ,  :category_id)
end

end
