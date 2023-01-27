class ApplicationController < ActionController::API
    include JsonWebToken
    include ExceptionHandler

    before_action :authenticate_user

    private

    def authenticate_user
        header = request.headers["Authorization"]
        header = header.split(' ').last if header
        begin
            @decoded = jwt_decode(header)
            @current_user = User.find_by(uuid: @decoded[:uuid])
            rescue ActiveRecord::RecordNotFound => e
                raise ExceptionHandler::RecordNotFound, e.message
            rescue JWT::DecodeError, JWT::VerificationError => e
                raise ExceptionHandler::DecodeError, e.message
        end
    end
end
