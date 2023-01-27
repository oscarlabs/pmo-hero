module ExceptionHandler
    extend ActiveSupport::Concern

    class DecodeError < StandardError; end
    class ExpiredSignature < StandardError; end
    class RecordNotFound < StandardError; end

    included do
        rescue_from ExceptionHandler::DecodeError do |_error|
            render json:{
                message: "Access Denied! Invalid Token :("
            }, status: 401
        end

            rescue_from ExceptionHandler::ExpiredSignature do |_error|
                render json:{
                    message: "Access Denied! Token Expired"
                }, status: 401
        end

            rescue_from ExceptionHandler::RecordNotFound do |_error|
                render json:{
                    message: "Not Found"
                }, status: 404
        end
    end
end