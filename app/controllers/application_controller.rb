class ApplicationController < ActionController::API
    def generate_token(data)
        JWT.encode(data, ENV["secret"] )
    end

    def decode_token
        token = request.headers["Authorization"]
        JWT.decode(token, ENV["secret"]).first["id"]
    end
end
