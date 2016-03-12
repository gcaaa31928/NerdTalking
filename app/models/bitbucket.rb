class Bitbucket
    attr_accessor :access_token, :refresh_token, :expires_at

    def initialize(code)
        @code = code
    end

    def to_params
        {
            'code' => @code,
            'grant_type' => 'authorization_code'
        }
    end

    def to_params_by_refresh_token
        {
            'refresh_token' => @refresh_token,
            'grant_type' => 'refresh_token'
        }
    end

    def request_token
        uri = URI.parse(APP_CONFIG['bitbucket_auth_url'])
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        request = Net::HTTP::Post.new(APP_CONFIG['bitbucket_auth_url'])
        request.basic_auth(APP_CONFIG['bitbucket_client_id'], APP_CONFIG['bitbucket_client_secret'])
        request.set_form(to_params)
        response = http.request(request)
        data = JSON.parse(response.body)
        @access_token = data['access_token']
        @refresh_token = data['refresh_token']
        @scope = data['scope']
        @expires_at = Time.now + (data['expires_in'].to_i).seconds
        @token_type = data['token_type']
        if @access_token.nil?
            return false
        end
        true
    end

    def get_email
        uri = URI.parse("https://api.bitbucket.org/2.0/user/emails?access_token=#{@access_token}")
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        request = Net::HTTP::Get.new(uri)
        response = http.request(request)
        data = JSON.parse(response.body)
        data['values'][0]['email']
    end

    def get_user
        uri = URI.parse("https://api.bitbucket.org/2.0/user?access_token=#{@access_token}")
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        request = Net::HTTP::Get.new(uri)
        response = http.request(request)
        JSON.parse(response.body)
    end

    def get_followers(follower_url)
        uri = URI.parse(follower_url)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        request = Net::HTTP::Get.new(uri)
        response = http.request(request)
        JSON.parse(response.body)['size']
    end

    def get_info
        data = {}
        data['email'] = get_email
        data['user'] = get_user
        data['followers'] = get_followers(data['user']['links']['followers']['href'])
        data
    end

    def refresh_token!
        uri = URI.parse(APP_CONFIG['bitbucket_auth_url'])
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        request = Net::HTTP::Post.new(APP_CONFIG['bitbucket_auth_url'])
        request.basic_auth(APP_CONFIG['bitbucket_client_id'], APP_CONFIG['bitbucket_client_secret'])
        request.set_form(to_params_by_refresh_token)
        response = http.request(request)
        data = JSON.parse(response.body)
        @access_token = data['access_token']
        @refresh_token = data['refres_token']
        @token_type = data['token_type']
        @expires_at = Time.now + (data['expires_in'].to_i).seconds
        @scope = data['scopes']
    end

    def expired?
        @expires_at < Time.now
    end

    def fresh_token
        refresh_token! if expired?
        @access_token
    end
end