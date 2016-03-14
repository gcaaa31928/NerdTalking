require 'http_status_code'
require 'github'
require 'gitlab'
require 'bitbucket'
class Api::AuthController < ApplicationController

    def github_auth
        p = params.permit(:code)
        github = GitHub.new(p[:code])
        github.request_token
        info = github.get_info
        Log.info(info.to_s)
        user = User.find_or_initialize_by(email: info['email'], domain: 'github')
        user.give_token!
        user.name = info['name']
        user.followers = info['followers']
        user.avatar = info['avatar_url']
        user.save!
        render HttpStatusCode.ok(user.as_json(only: [:id, :name, :followers, :access_token]))
    end

    def gitlab_auth
        p = params.permit(:code)
        gitlab = GitLab.new(p[:code])
        gitlab.request_token
        info = gitlab.get_info
        Log.info(info.to_s)
        user = User.find_or_initialize_by(email: info['email'], domain: 'gitlab')
        user.give_token!
        user.refresh_token = gitlab.refresh_token
        user.expires_at = gitlab.expires_at
        user.name = info['username']
        user.email = info['email']
        user.avatar = info['avatar_url']
        user.save!
        render HttpStatusCode.ok(user.as_json(only: [:id, :name, :followers, :access_token]))
    end

    def bitbucket_auth
        p = params.permit(:code)
        bitbucket = Bitbucket.new(p[:code])
        bitbucket.request_token
        info = bitbucket.get_info
        Log.info(info.to_s)
        user = User.find_or_initialize_by(email: info['email'], domain: 'bitbucket')
        user.give_token!
        user.refresh_token = bitbucket.refresh_token
        user.expires_at = bitbucket.expires_at
        user.name = info['user']['username']
        user.email = info['email']
        user.avatar = info['avatar']['href']
        user.followers = info['followers']
        user.save!
        render HttpStatusCode.ok(user.as_json(only: [:id, :name, :followers, :access_token]))
    end

end
