# app/models/user.rb
class User < ApplicationRecord
    has_secure_password
    has_many :images

    validates :name, :email, uniqueness: true
    def self.from_token_payload payload
      payload['sub']
    end
  end