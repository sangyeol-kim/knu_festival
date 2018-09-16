class FleamarketsController < ApplicationController
  before_action :set_fleamarket, only: [:show, :edit, :update, :destroy]

  # GET /fleamarkets
  # GET /fleamarkets.json
  def index
    @fleamarkets = Fleamarket.all
  end
  
  def index2
    @fleamarkets = Fleamarket.all
  end
  
  def index3
    @fleamarkets = Fleamarket.all
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
  
  $iconlist1 = (1..20).to_a.reverse
  $iconlist2 = (1..20).to_a.reverse
  $iconlist3 = (1..20).to_a.reverse

  def create
    @fleamarket = Fleamarket.new(fleamarket_params)
    if @fleamarket.number == '1'
      @fleamarket.iconid = $iconlist1.pop
    elsif @fleamarket.number == '2'
      @fleamarket.iconid = $iconlist2.pop
    elsif @fleamarket.number == '3'
      @fleamarket.iconid = $iconlist3.pop
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
        format.html { redirect_to @fleamarket, notice: 'Fleamarket was successfully updated.' }
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
      params.require(:fleamarket).permit(:title, :content, :image, :modal, :number)
    end
end
