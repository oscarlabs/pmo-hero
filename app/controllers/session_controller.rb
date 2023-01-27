class SessionController < ApplicationController

    skip_before_action :authenticate_user, only: %i[ login ]

    #POST /session/login
    def login
        @user = User.find_by_email(params[:email])

        if(@user&.authenticate(params[:password]))
            token = jwt_encode(uuid: @user.uuid)
            time = Time.now + 8.days.from_now.to_i
            render json: {
                token: token, 
                exp: time.strftime("%m-%d-%Y %H:%M"),  
                username: @user.user_name,
                uuid: @user.uuid
            }, status: 200
        else
            render json: {
                error: "Invalid username or password"
            }, status: 401
        end
    end
end
