class ChartsController < ApplicationController
  def index
      
  end
  
  def new_users
      #render json: Impression.where("referrer like ?", "%facebook%").or(Impression.where("referrer like ?", "%everytime%")).count
      render json: Impression.group(:referrer).where("referrer like ?", "%everytime%").count
  end
end
