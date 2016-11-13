class Api::ArticlesController < ApplicationController
    def create
        retrieve
        permitted = params.permit(:title, :desc, :url, :date)

    end


    def retrieve
        require_headers
        retrieve_admin
        if @admin.nil?
            raise '憑證失效'
        end
    end

    def retrieve_admin
        if @access_token.present?
        end
    end

    def require_headers
        @access_token = request.headers["AUTHORIZATION"]
    end
end
