class AuthenticateHunter
  prepend SimpleCommand

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    JsonWebToken.encode(hunter_id: hunter.id) if hunter
  end

  private
    attr_accessor :email, :password

    def hunter
      hunter = Hunter.find_by_email(email)
      return hunter if hunter && hunter.authenticate(password)
      
      errors.add :hunter_authentication, 'invalid credentials'
      nil
    end
end
