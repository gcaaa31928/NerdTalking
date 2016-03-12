class GitLab
    attr_accessor :code, :access_token, :refresh_token, :scope, :expires_at

    def initialize(code)
        @code = code
    end

    def self.new_by_auth_data(access_token, refresh_token, scope, expires_at)
        gitlab = GitLab.new
        gitlab.access_token = access_token
        gitlab.refresh_token = refresh_token
        gitlab.scope = scope
        gitlab.expires_at = expires_at
        gitlab
    end


    def to_params
        {
            'client_id' => APP_CONFIG['gitlab_client_id'],
            'client_secret' => APP_CONFIG['gitlab_client_secret'],
            'redirect_uri' => APP_CONFIG['gitlab_callback_url'],
            'code' => @code,
            'grant_type' => 'authorization_code'
        }
    end

    def to_params_by_refresh_token
        {
            'client_id' => APP_CONFIG['gitlab_client_id'],
            'client_secret' => APP_CONFIG['gitlab_client_secret'],
            'redirect_uri' => APP_CONFIG['gitlab_callback_url'],
            'refresh_token' => @refresh_token,
            'grant_type' => 'refresh_token'
        }
    end

    def request_token
        uri = URI.parse(APP_CONFIG['gitlab_auth_url'])
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        request = Net::HTTP::Post.new(APP_CONFIG['gitlab_auth_url'])
        request.set_form(to_params)
        response = http.request(request)
        data = JSON.parse(response.body)
        @access_token = data['access_token']
        @refresh_token = data['refresh_token']
        @scope = data['scope']
        @expires_at = Time.now + 7200.seconds
        if @access_token.nil?
            return false
        end
        true
    end

    def refresh_token!
        uri = URI.parse(APP_CONFIG['gitlab_auth_url'])
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        request = Net::HTTP::Post.new(APP_CONFIG['gitlab_auth_url'])
        request.set_form(to_params_by_refresh_token)
        response = http.request(request)
        data = JSON.parse(response.body)
        @access_token = data['access_token']
        @expires_at = Time.now + 7200.seconds
    end

    def expired?
        @expires_at < Time.now
    end

    def fresh_token
        refresh_token! if expired?
        @access_token
    end

    def get_info
        uri = URI.parse("https://gitlab.com/api/v3/user?access_token=#{@access_token}")
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        request = Net::HTTP::Get.new(uri)
        response = http.request(request)
        JSON.parse(response.body)
    end

end