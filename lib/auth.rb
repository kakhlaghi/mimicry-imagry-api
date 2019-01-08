require 'jwt'
require 'pry'

class Auth
    def self.create_token(user_object)
        payload = { user: JSON.parse(user_object.to_json)}
        jwt.encode(payload, 'mimicry', 'HS256') #ENV[Auth] make more secret
        decode_token(token)
    end

    def self.decode_token
        jwt.decode(token, 'mimicry', true, { algorithm: 'HS256'})
    end

end
