class JwtService

  def self.encode(payload)
    secret_key = Rails.application.credentials.secret_key_base
    JWT.encode(payload, secret_key, 'HS256')
  end

  def self.decode(token)
    secret_key = Rails.application.credentials.secret_key_base
    body, = JWT.decode(token, secret_key,
                       true, algorithm: 'HS256')
    HashWithIndifferentAccess.new(body)
  rescue JWT::ExpiredSignature
    nil
  end

end