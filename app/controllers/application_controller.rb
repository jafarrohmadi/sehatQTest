class ApplicationController < ActionController::API
  before_action :authenticate_request
  attr_reader :current_user

  def return_success(datum)
    render json: {status: 'true', message: 'Success', data: datum}, status: 200
  end

  def return_failed(messages, datum = [])
    render json: {status: 'false', message: messages, data: datum}, status: 200
  end

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    return_failed('Not Authorized') unless @current_user
  end

end
