class ReactionsController < ApplicationController
  before_action :set_reaction, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  def create
    @debat = Debat.find(params[:debat_id])
    @reaction = @debat.reactions.new(reaction_params)
    @reaction.user = current_user

    respond_to do |format|
      if @reaction.save
        format.html { redirect_to @debat, notice: 'Reaction was successfully created.' }
        format.json { render json: @reaction, status: :created, location: @reaction }
      else
        format.html { render action: "new" }
        format.json { render json: @reaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reactions/1
  # DELETE /reactions/1.json
  def destroy
    @reaction.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Reaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

def upvote
    @reaction = Reaction.find(params[:id])
    @reaction.upvote_by current_user
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reaction
      @reaction = Reaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reaction_params
      params.require(:reaction).permit(:debat_id, :body, :user_id)
    end
end