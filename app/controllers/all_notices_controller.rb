class AllNoticesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_all_notice, only: [:show, :edit, :update, :destroy]

  # GET /all_notices
  # GET /all_notices.json
  def index
    @all_notices = AllNotice.order("created_at DESC").all
  end

  # GET /all_notices/1
  # GET /all_notices/1.json
  def show
  end

  # GET /all_notices/new
  def new
    @all_notice = AllNotice.new
  end

  # GET /all_notices/1/edit
  def edit
  end

  # POST /all_notices
  # POST /all_notices.json
  def create
    @all_notice = AllNotice.new(all_notice_params)

    respond_to do |format|
      if @all_notice.save
        format.html { redirect_to @all_notice, notice: 'All notice was successfully created.' }
        format.json { render :show, status: :created, location: @all_notice }
      else
        format.html { render :new }
        format.json { render json: @all_notice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /all_notices/1
  # PATCH/PUT /all_notices/1.json
  def update
    respond_to do |format|
      if @all_notice.update(all_notice_params)
        format.html { redirect_to @all_notice, notice: 'All notice was successfully updated.' }
        format.json { render :show, status: :ok, location: @all_notice }
      else
        format.html { render :edit }
        format.json { render json: @all_notice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /all_notices/1
  # DELETE /all_notices/1.json
  def destroy
    @all_notice.destroy
    respond_to do |format|
      format.html { redirect_to all_notices_url, notice: 'All notice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_all_notice
      @all_notice = AllNotice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def all_notice_params
      params.require(:all_notice).permit(:title, :content)
    end
end
