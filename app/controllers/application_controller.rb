class ApplicationController < ActionController::Base
    rescue_from Errors::BaseResponseError, :with => :render_standard_error

    before_action :set_cors_header

    def set_cors_header
        headers['Access-Control-Allow-Origin'] = '*'
        headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
        headers['Access-Control-Request-Method'] = '*'
        headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    end

    def options
        head :status => 200,
             :'Access-Control-Allow-Headers' => 'accept, content-type',
             :'Access-Control-Allow-Origin' => '*'
    end

    def render_standard_error(error)
        unless Rails.env.test?
            Log.exception(error)
        end
        render json: {error: error.message, status: error.error_code}, status: error.error_code
    end
end
