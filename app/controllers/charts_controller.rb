class ChartsController < ApplicationController
  before_action :authenticate_user!
  
  def index
      @visit_count = Home.find(1).count_view
  end
  
  def new_users
      render json: Impression.group(:referrer).where("referrer like ?", "%facebook.com%").or(Impression.group(:referrer).where("referrer like ?", "%everytime.kr%")).or(Impression.group(:referrer).where("referrer like ?", "%blog.naver.com/kbs4674%")).count
      #render json: Impression.group(:referrer).where("referrer like ?", "%everytime%").count
  end
end
