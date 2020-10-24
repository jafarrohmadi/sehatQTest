class AuthController < ApplicationController
  skip_before_action :authenticate_request

  def login
    if params["provider_type"].nil? && params['provider_id'].nil?
      command = AuthenticateUser.call(params[:email], params[:password])
    else
      command = AuthenticateUserSosmed.call(params[:email], params[:provider_id], params[:provider_type])
    end

    if command.success?
      return_success({token: command.result, role: command.role})
    else
      return_failed('Unauthorized', [])
    end
  end

  def register
    if params["provider_type"].nil? && params['provider_id'].nil?
      @user = User.new(name: params[:name], email: params[:email], password: params[:password],
                       role: params[:role])
    else
      @user = User.new(name: params[:name], email: params[:email], password: params[:email] + params[:name],
                       provider_type: params["provider_type"], provider_id: params["provider_id"],
                       role: params[:role])
    end

    if @user.save
      return_success(@user)
    else
      return_failed('Failed created', @user.errors.full_messages)
    end
  end

end
