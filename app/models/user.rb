class User < ApplicationRecord
  has_many :messages, dependent: :destroy
  
  def self.find_or_create_from_auth_hash(auth_hash)
    find_or_initialize_by(provider: auth_hash.provider, uid: auth_hash.uid).tap do |user|
      user.name = auth_hash.info.name
      user.email = auth_hash.info.email
      user.avatar_url = auth_hash.info.image
      user.oauth_token = auth_hash.credentials.token
      user.oauth_expires_at = Time.at(auth_hash.credentials.expires_at) if auth_hash.credentials.expires
      user.save!
    end
  end
end