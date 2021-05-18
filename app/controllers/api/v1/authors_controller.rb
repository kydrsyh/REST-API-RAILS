class Api::V1::AuthorsController < ApplicationController
    def index
        authors = Author.order('created_at DESC')
        render json: {
            status: 'SUCCESS', 
            message:'Loaded authors', 
            data: authors.as_json(:include => :articles)
        }, status: :ok
    end
end