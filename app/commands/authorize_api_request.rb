class AuthorizeApiRequest
  prepend SimpleCommand

  def initialize(headers = {})
    @headers = headers
  end

  def call
    hunter
  end

  private
    attr_reader :headers

    def hunter
      @hunter ||= Hunter.find(decoded_auth_token[:hunter_id]) if decoded_auth_token
      @hunter || errors.add(:token, 'Invalid token') && nil
    end

    def decoded_auth_token
      @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
    end

    def http_auth_header
      if headers['Authorization'].present?
        return headers['Authorization'].split(' ').last
      else
        errors.add(:token, 'Missing token')
      end
      nil
    end
end
