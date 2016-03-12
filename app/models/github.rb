class GitHub
    attr_accessor :access_token

    def initialize(code)
        @code = code
    end

    def to_params
        {
            'client_id' => APP_CONFIG['github_client_id'],
            'client_secret' => APP_CONFIG['github_client_secret'],
            'code' => @code
        }
    end

    def request_token
        uri = URI.parse(APP_CONFIG['github_auth_url'])
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        request = Net::HTTP::Post.new(APP_CONFIG['github_auth_url'])
        request['ACCEPT'] = 'application/json'
        request.set_form(to_params)
        response = http.request(request)
        Log.info(response.body.to_s)
        data = JSON.parse(response.body)
        @access_token = data['access_token']
        @scope = data['scope']
        @token_type = data['token_type']
        if @access_token.nil?
            return false
        end
        true
    end

    def get_info
        uri = URI.parse("https://api.github.com/user?access_token=#{@access_token}")
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        request = Net::HTTP::Get.new(uri)
        response = http.request(request)
        JSON.parse(response.body)
    end

end