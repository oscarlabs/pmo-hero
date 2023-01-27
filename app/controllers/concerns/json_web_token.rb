require "jwt"

module JsonWebToken

    extend ActiveSupport::Concern

    SECRET_KEY = ENV["JWT_SECRET"]

    def jwt_encode(payload, exp = 8.days.from_now)
        payload[:exp] = exp.to_i
        JWT.encode(payload, SECRET_KEY, "HS256")
    end

    def jwt_decode(token)
        if token
            begin
                decoded = JWT.decode(token, SECRET_KEY, true, { :algorithm => "HS256"})[0]
                HashWithIndifferentAccess.new decoded
            rescue JWT::ExpiredSignature, JWT::VerificationError => e
                raise ExceptionHandler::ExpiredSignature, e.message
            rescue JWT::DecodeError, JWT::VerificationError => e
                raise ExceptionHandler::DecodeError, e.message
            end
        else
            raise ExceptionHandler::DecodeError, "Token Not Found"
        end
    end

end
