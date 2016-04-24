class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @debatsuser = @user.debats.order('created_at DESC').page(params[:page]).per_page(10)
    end
end