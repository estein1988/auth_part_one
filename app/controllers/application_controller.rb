class ApplicationController < ActionController::API

    before_action :authorized

    def authorized
        render json: {message: "Please Log In"} unless logged_in
    end

    def logged_in
        !!current_user 
    end

    def current_user
        auth_header = request.headers["Authorization"]
        if auth_header
            token = auth_header.split(" ")[1]
            begin
                @user_id = JWT.decode(token, secret_key)[0]["user_id"]
            rescue JWT::DecodeError
                nil
            end
        end
        @user = User.find(@user_id)
    end

    def secret_key
        Rails.application.secrets.secret_key_base[0]
    end

end

#double bang turns into a boolean
#if logged_in is true, do no hit the authorized method

#rescue avoids entire app shutting down if one user messess up a token