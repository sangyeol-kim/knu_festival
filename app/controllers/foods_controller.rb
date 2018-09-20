class FoodsController < ApplicationController
  before_action :set_food, only: [:show, :edit, :update, :destroy]

  # GET /foods
  # GET /foods.json
  def index
    @foods = Food.all
    # @boxcolor = ["dark","warning"]
    @all_notices = AllNotice.order("created_at DESC").all
    
    doc = Nokogiri::HTML(open("https://www.accuweather.com/ko/kr/chuncheon/223554/weather-forecast/223554"))
    weather_status = doc.css('.current div.info .cond')
    @weather_result_status = weather_status.map { |cur| cur.text }
  end
  
  def index2
    @foods = Food.all
    @all_notices = AllNotice.order("created_at DESC").all
    
    doc = Nokogiri::HTML(open("https://www.accuweather.com/ko/kr/chuncheon/223554/weather-forecast/223554"))
    weather_status = doc.css('.current div.info .cond')
    @weather_result_status = weather_status.map { |cur| cur.text }
  end

  def index3
    @foods = Food.all
    @all_notices = AllNotice.order("created_at DESC").all
    
    doc = Nokogiri::HTML(open("https://www.accuweather.com/ko/kr/chuncheon/223554/weather-forecast/223554"))
    weather_status = doc.css('.current div.info .cond')
    @weather_result_status = weather_status.map { |cur| cur.text }
  end
  
  def index4
    @foods = Food.all
    $iconlist4 = (1..20).to_a.reverse
    @all_notices = AllNotice.order("created_at DESC").all
    
    doc = Nokogiri::HTML(open("https://www.accuweather.com/ko/kr/chuncheon/223554/weather-forecast/223554"))
    weather_status = doc.css('.current div.info .cond')
    @weather_result_status = weather_status.map { |cur| cur.text }

  end

  # GET /foods/1
  # GET /foods/1.json
  def show
  end

  # GET /foods/new
  def new
    @food = Food.new
  end

  # GET /foods/1/edit
  def edit
    
  end

  # POST /foods
  # POST /foods.json
  $iconlist1 = (1..20).to_a.reverse
  $iconlist2 = (1..20).to_a.reverse
  $iconlist3 = (1..20).to_a.reverse

  def create
    @food = Food.new(food_params)
    if @food.number == 1
      @food.iconid = $iconlist1.pop
    elsif @food.number == 2
      @food.iconid = $iconlist2.pop
    elsif @food.number == 3
      @food.iconid = $iconlist3.pop
    end
    @food.randicon = (1..5).to_a.sample


    respond_to do |format|
      if @food.save
        if @food.number == 1
          format.html { redirect_to '/foods', notice: 'Food was successfully created.' }
          format.json { render :show, status: :created, location: @food }
        elsif @food.number == 2
          format.html { redirect_to index2_foods_path, notice: 'Food was successfully created.' }
          format.json { render :show, status: :created, location: @food }
        else
          format.html { redirect_to index3_foods_path, notice: 'Food was successfully created.' }
          format.json { render :show, status: :created, location: @food }
        end
      else
        format.html { render :new }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foods/1
  # PATCH/PUT /foods/1.json
  def update
    respond_to do |format|
      if @food.update(food_params)
        format.html { redirect_to '/foods', notice: 'Food was successfully updated.' }
        format.json { render :index, status: :ok, location: @food }
      else
        format.html { render :edit }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foods/1
  # DELETE /foods/1.json
  def destroy
    @food.destroy
    respond_to do |format|
      format.html { redirect_to foods_url, notice: 'Food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food
      @food = Food.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def food_params
      params.require(:food).permit(:title, :menu, :image, :number, :ps, :iconid)
    end
end
