class FleamarketsController < ApplicationController
  before_action :set_fleamarket, only: [:show, :edit, :update, :destroy]

  # GET /fleamarkets
  # GET /fleamarkets.json
  def index
    @fleamarkets = Fleamarket.all
    @all_notices = AllNotice.order("created_at DESC").all
    
    doc = Nokogiri::HTML(open("https://www.accuweather.com/ko/kr/chuncheon/223554/daily-weather-forecast/223554?day=1"))
    weather_status = doc.css('#feed-tabs ul li.fday1 .bg .info .cond')
    @weather_result_status = weather_status.map { |cur| cur.text }
  end
  
  def index2
    @fleamarkets = Fleamarket.all
    @all_notices = AllNotice.order("created_at DESC").all
    
    doc = Nokogiri::HTML(open("https://www.accuweather.com/ko/kr/chuncheon/223554/daily-weather-forecast/223554?day=1"))
    weather_status = doc.css('#feed-tabs ul li.fday1 .bg .info .cond')
    @weather_result_status = weather_status.map { |cur| cur.text }
  end
  
  def index3
    @fleamarkets = Fleamarket.all
    @all_notices = AllNotice.order("created_at DESC").all
    
    doc = Nokogiri::HTML(open("https://www.accuweather.com/ko/kr/chuncheon/223554/daily-weather-forecast/223554?day=1"))
    weather_status = doc.css('#feed-tabs ul li.fday1 .bg .info .cond')
    @weather_result_status = weather_status.map { |cur| cur.text }
  end

  # GET /fleamarkets/1
  # GET /fleamarkets/1.json
  def show
  end

  # GET /fleamarkets/new
  def new
    @fleamarket = Fleamarket.new
  end

  # GET /fleamarkets/1/edit
  def edit
  end

  # POST /fleamarkets
  # POST /fleamarkets.json
  
 
  def create
    @fleamarket = Fleamarket.new(fleamarket_params)
    if @fleamarket.number == '1'
      @fleamarket.iconid = 1
    elsif @fleamarket.number == '2'
      @fleamarket.iconid = 2
    elsif @fleamarket.number == '3'
      @fleamarket.iconid = 3
    end


    respond_to do |format|
      if @fleamarket.save
          if @fleamarket.number == '1'
            format.html { redirect_to fleamarkets_path, notice: 'Fleamarket was successfully created.' }
            format.json { render :show, status: :created, location: @fleamarket }

          elsif @fleamarket.number == '2'
            format.html { redirect_to index2_fleamarkets_path, notice: 'Fleamarket was successfully created.' }
            format.json { render :show, status: :created, location: @fleamarket }

          else
            format.html { redirect_to index3_fleamarkets_path, notice: 'Fleamarket was successfully created.' }
            format.json { render :show, status: :created, location: @fleamarket }
          end
      else
        format.html { render :new }
        format.json { render json: @fleamarket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fleamarkets/1
  # PATCH/PUT /fleamarkets/1.json
  def update
    respond_to do |format|
      if @fleamarket.update(fleamarket_params)
        format.html { redirect_to '/fleamarkets', notice: 'Fleamarket was successfully updated.' }
        format.json { render :show, status: :ok, location: @fleamarket }
      else
        format.html { render :edit }
        format.json { render json: @fleamarket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fleamarkets/1
  # DELETE /fleamarkets/1.json
  def destroy
    @fleamarket.destroy
    respond_to do |format|
      format.html { redirect_to fleamarkets_url, notice: 'Fleamarket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fleamarket
      @fleamarket = Fleamarket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fleamarket_params
      params.require(:fleamarket).permit(:title, :content, :image, :modal, :number, :ps)
    end
end
