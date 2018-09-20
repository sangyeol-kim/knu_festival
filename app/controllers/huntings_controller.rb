class HuntingsController < ApplicationController
  before_action :set_hunting, only: [:show, :edit, :update, :destroy, :edit_conf]

  # GET /huntings
  # GET /huntings.json
  def index
    @huntings = Hunting.all
    @all_notices = AllNotice.order("created_at DESC").all
    
    doc = Nokogiri::HTML(open("https://www.accuweather.com/ko/kr/chuncheon/223554/weather-forecast/223554"))
    weather_status = doc.css('#feed-tabs > ul > li.day.current.first.cl > div.bg.bg-c.c > div.info > span')
    @weather_result_status = weather_status.map { |cur| cur.text }
  end

  # GET /huntings/1
  # GET /huntings/1.json
  def show
    @hunting      = Hunting.find(params[:id])
    @new_comment  = Comment.build_from(@hunting, 1, "")
  end

  # GET /huntings/new
  def new
    @hunting = Hunting.new
  end

  # GET /huntings/1/edit
  def edit
  end

  # POST /huntings
  # POST /huntings.json
  def create
    @hunting = Hunting.new(hunting_params)

    respond_to do |format|
      if @hunting.save
        format.html { redirect_to huntings_path, notice: 'Hunting was successfully created.' }
        format.json { render :show, status: :created, location: @hunting }
      else
        format.html { render :new }
        format.json { render json: @hunting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /huntings/1
  # PATCH/PUT /huntings/1.json
  def update
    respond_to do |format|
      if @hunting.update(hunting_params)
        format.html { redirect_to @hunting, notice: 'Hunting was successfully updated.' }
        format.json { render :show, status: :ok, location: @hunting }
      else
        format.html { render :edit }
        format.json { render json: @hunting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /huntings/1
  # DELETE /huntings/1.json
  def destroy
      @hunting.destroy
      respond_to do |format|
        format.html { redirect_to huntings_url, notice: 'Hunting was successfully destroyed.' }
        format.json { head :no_content }
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hunting
      @hunting = Hunting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hunting_params
      params.require(:hunting).permit(:title, :content, :writer)
    end
end
