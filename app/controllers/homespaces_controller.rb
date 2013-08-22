class HomespacesController < ApplicationController
  before_action :set_homespace, only: [:show, :edit, :update, :destroy]

  # GET /homespaces
  # GET /homespaces.json
  def index
    @homespaces = Homespace.all
  end

  # GET /homespaces/1
  # GET /homespaces/1.json
  def show
  end

  # GET /homespaces/new
  def new
    @homespace = Homespace.new
  end

  # GET /homespaces/1/edit
  def edit
  end

  # POST /homespaces
  # POST /homespaces.json
  def create
    @homespace = Homespace.new(homespace_params)

    respond_to do |format|
      if @homespace.save
        format.html { redirect_to @homespace, notice: 'Homespace was successfully created.' }
        format.json { render action: 'show', status: :created, location: @homespace }
      else
        format.html { render action: 'new' }
        format.json { render json: @homespace.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /homespaces/1
  # PATCH/PUT /homespaces/1.json
  def update
    respond_to do |format|
      if @homespace.update(homespace_params)
        format.html { redirect_to @homespace, notice: 'Homespace was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @homespace.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /homespaces/1
  # DELETE /homespaces/1.json
  def destroy
    @homespace.destroy
    respond_to do |format|
      format.html { redirect_to homespaces_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_homespace
      @homespace = Homespace.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def homespace_params
      params.require(:homespace).permit(:user_id, :partner_id, :post_ids, :title)
    end
end
