class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :sessions_as_student, foreign_key: 'tutor_id'
  has_many :sessions_as_tutor, foreign_key: 'user_id'

  has_many :messages, foreign_key: 'sender_id', dependent: :destroy

  has_attachment :photo

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  def self.find_for_facebook_oauth(auth)
    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :lastname)
    user_params['facebook_picture_url'] = auth.info.image_size
    user_params['token'] = auth.credentials.token
    user_params['token_expiry'] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.find_by(provider: auth.provider, uid: auth.uid)
    user ||= User.find_by(email: auth.info.email)

    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0, 20]
      user.save
    end

    return user
  end

  def self.from_google_omniauth(auth)
    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:google_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h
    # data = auth.info ...
    user = User.find_by(provider: auth.provider, uid: auth.uid)
    user ||= User.find_by(email:auth.info.email)
    unless user
        user = User.new(user_params)
        user.password = Devise.friendly_token[0,20]
        user.save
    end
    user
  end


end
