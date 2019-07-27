# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#

class User < ApplicationRecord
    validates :email, :password, presence: true
    validates :email, uniqueness: true

    after_initialize :ensure_session_token

    
    def generate_session_token
        SecureRandom::urlsafe_base64(16)
    end

    def reset_session_token!
        self.update!(session_token: self.class.generate_session_token)
        self.session_token
    end

    def ensure_session_token
        self.session_token ||= User.generate_session_token
    end

    def self.find_by_credentials(email, password)
        user = User.find_by(email: email)
        return nil unless user && user.is_password?(password)
        user
    end

    def password=(password)
        # debugger
        self.password_digest = BCrypt::Password.create(password).to_s
    end

    def is_password?(password)
        digest = BCrypt::Password.new(self.password_digest)
        digest.is_password?(password)
    end


end
