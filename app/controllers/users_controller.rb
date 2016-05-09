class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @debatsuser = @user.debats.order("cached_votes_total").page(params[:page]).per_page(10)
        @reactionsuser = @user.reactions.order("created_at")
    end
end