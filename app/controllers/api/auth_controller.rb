require 'http_status_code'
require 'github'
class Api::AuthController < ApplicationController

    def github_auth
        p = params.permit(:code)
        github = GitHub.new(p[:code])
        github.request_token
        info = github.get_info
        Log.info(info.to_s)
        user = User.find_or_initialize_by(email: info['email'])
        user.name = info['name']
        user.followers = info['followers']
        user.save!
        render HttpStatusCode.ok(user.as_json(except: [:created_at, :updated_at]))
    end

end
