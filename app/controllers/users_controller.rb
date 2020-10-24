class UsersController < ApplicationController
    before_action :authenticate_request, except: :create
    before_action :find_user, except: %i[create index]
  
    def index
      @users = User.all
      render json: @users, status: :ok
    end
  
    private
  
    def find_user
      @user = User.find_by_email!(params[:email])
      rescue ActiveRecord::RecordNotFound
        render json: { errors: 'User not found' }, status: :not_found
    end
  
end
