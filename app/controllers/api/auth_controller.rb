class Api::AuthController < ApplicationController

    def github_auth
        p = params.permit(:code)

    end

end
