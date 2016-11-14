require 'bcrypt'
require 'securerandom'

class Admin < ApplicationRecord
    include BCrypt
    def password
        @password ||= Password.new(self.password_hash)
    end

    def password=(new_password)
        @password = Password.create(new_password)
        self.password_hash = @password
    end

    def update_token
        access_token = SecureRandom.uuid.to_s
        access_token.gsub!('-', '')
        self.update(access_token: access_token)
        access_token
    end

end
