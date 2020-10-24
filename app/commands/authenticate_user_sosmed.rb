class AuthenticateUserSosmed
  prepend SimpleCommand

  def initialize(email, provider_id, provider_type)
    @email = email
    @provider_id = provider_id
    @provider_type = provider_type
  end

  def call
    JsonWebToken.encode(user_id: user.id) if user
  end

  attr_accessor :email, :provider_id, :provider_type

  def user
    user = User.find_by email :email, provider_id :provider_id, provider_type :provider_type

    return user if user && user.authenticate(user.email + user.name)

    errors.add :user_authentication, 'invalid credentials' && nil
  end
end