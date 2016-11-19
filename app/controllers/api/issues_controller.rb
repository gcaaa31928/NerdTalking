class Api::IssuesController < ApplicationController
    def create

    end


    def valid!
        require_headers
        retrieve_admin
        if @admin.nil?
            raise Errors::ForbiddenError.new('憑證失效', 403)
        end
    end

    def retrieve_admin
        if @access_token.present?
            @admin = Admin.find_by(access_token: @access_token)
        end
    end

    def require_headers
        @access_token = request.headers["AUTHORIZATION"]
    end
end
