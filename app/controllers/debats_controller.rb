class DebatsController < ApplicationController
  before_action :set_debat, only: [:show, :edit, :update, :destroy]

  # GET /debats
  # GET /debats.json
  def index
    @debats = Debat.all
  end

  # GET /debats/1
  # GET /debats/1.json
  def show
  end

  # GET /debats/new
  def new
    @debat = current_user.debats.build
  end

  # GET /debats/1/edit
  def edit
  end

  # POST /debats
  # POST /debats.json
  def create
    @debat = current_user.debats.build(debat_params)

    respond_to do |format|
      if @debat.save
        format.html { redirect_to @debat, notice: 'Debat was successfully created.' }
        format.json { render :show, status: :created, location: @debat }
      else
        format.html { render :new }
        format.json { render json: @debat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /debats/1
  # PATCH/PUT /debats/1.json
  def update
    respond_to do |format|
      if @debat.update(debat_params)
        format.html { redirect_to @debat, notice: 'Debat was successfully updated.' }
        format.json { render :show, status: :ok, location: @debat }
      else
        format.html { render :edit }
        format.json { render json: @debat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /debats/1
  # DELETE /debats/1.json
  def destroy
    @debat.destroy
    respond_to do |format|
      format.html { redirect_to debats_url, notice: 'Debat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def upvote
    @debat = Debat.find(params[:id])
    @debat.upvote_by current_user
    redirect_to :back
  end
  
  def downvote
    @debat = Debat.find(params[:id])
    @debat.downvote_by current_user
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_debat
      @debat = Debat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def debat_params
      params.require(:debat).permit(:title, :description)
    end
end
