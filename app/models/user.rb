require 'securerandom'
class User < ActiveRecord::Base

    def give_token!
        access_token = SecureRandom.uuid.to_s
        access_token.gsub!('-', '')
        self.access_token = access_token
    end

end
