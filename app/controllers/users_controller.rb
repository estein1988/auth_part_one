class UsersController < ApplicationController

    def index
        @users = User.all 
        render json: @users
    end

    def create
        @user = User.create(
            username: params[:username], 
            password: params[:password]
        )
        render json: @user
    end

end
