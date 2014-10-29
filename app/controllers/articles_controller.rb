class ArticlesController < ApplicationController
	def index
		@articles = Article.order(updated_at: :desc).limit(25)
	end

	def show
		@article = Article.find(params[:id])
		# render view articles/show and pass forward any instance variables (eg @article)
		# take the info here and pop it in a bag and send it to the layout
		# Render layout called 'application' unless a layout of name article exists then render thatoerthwise state one explicityly.
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
 		if @article.save
   			redirect_to @article
 		else
   			render "new"
 		end
	end

private
 	def article_params
   		params.require(:article).permit(:title, :content, :category_ids => [])
 	end

end