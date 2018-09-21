class ChartsController < ApplicationController
  def index
      
  end
  
  def new_users
      render json: Impression.group(:referrer).count
  end
end
