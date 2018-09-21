class ChartsController < ApplicationController
  def index
      
  end
  
  def new_users
      render json: Impression.group(:referrer).where("referrer like ?", "%facebook.com").or(Impression.group(:referrer).where("referrer like ?", "%everytime.kr")).count
      #render json: Impression.group(:referrer).where("referrer like ?", "%everytime%").count
  end
end
