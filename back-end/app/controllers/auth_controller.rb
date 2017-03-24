class AuthController < ApplicationController


  def user_login

    if params[:password] && params[:email]

        user = User.where(email: params[:email]).first

        if user && user.authenticate(params[:password])
            api_key = ApiKey.new
            api_key.user_id = user.id
            api_key.save
            token = api_key.secret_key

            render json: {status: 200, access_token: token}
        else
          notice = "Invalid email or password"
        end
    else
        notice = "Invalid Params"
    end
    render json: {status: "error", notice: notice} unless token

  end

  def office_login

  end

  def logout

  end


end