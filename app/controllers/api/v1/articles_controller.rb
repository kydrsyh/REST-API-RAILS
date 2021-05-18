
class Api::V1::ArticlesController < ApplicationController
    def index
        articles = Article.order('created_at DESC')
        render json: {
            status: 'SUCCESS', 
            message:'Loaded articles', 
            data: articles.as_json(:include => :author)
        }, status: :ok
    end

    def show
        article = Article.find(params[:id])
        render json: {
            status: 'SUCCESS', 
            message:'Loaded article', 
            data: article.as_json(:include => :author)
        }, status: :ok
    end

    def create
        article = Article.new(article_params)
        if article.save
            render json: {
                status: 'SUCCESS', 
                message:'Loaded article', 
                data: article.as_json(:include => :author)
            }, status: :ok
        else
            render json: {
                status: 'ERROR', 
                message:'Saved article', 
                data: article.errors
            }, status: :unprocessable_entity
        end
    end
    
    def destroy
        article = Article.find(params[:id])
        article.destroy
        render json: {
            status: 'SUCCESS', 
            message:'Deleted article', 
            data: article.as_json(:include => :author)
        }, status: :ok
    end
    
    def update
        article = Article.find(params[:id])
        if article.update_attributes(article_params)
            render json: {
                status: 'SUCCESS', 
                message:'Updated article', 
                data: article.as_json(:include => :author)
            }, status: :ok
        else
            render json: {
                status: 'ERROR', 
                message:'Cannot update article', 
                data: article.errors
            }, status: :unprocessable_entity
        end
    end

    private
    def article_params
        params.permit(:title, :body, :author_id)
    end
end
