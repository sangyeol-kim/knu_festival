class CommentsController < ApplicationController
    def create
        comment = Comment.new
        comment.content = params[:input_content]
        comment.lost_id = params[:lost_id]
        comment.save
        
        redirect_back fallback_location: root_path
    end
    
    def destroy
    end
end
