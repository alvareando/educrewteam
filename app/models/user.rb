class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :messages, foreign_key: 'sender_id', dependent: :nullify

  has_attachment :photo

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  def name
    "#{first_name} #{last_name}"
  end

  def picture
    self.facebook_picture_url || self.google_picture_url || "http://kitt.lewagon.com/placeholder/users/meredaul"
  end

  def participating_sessions(status = nil)
    case status
    when 'ongoing'
      Session.joins('JOIN session_participations ON session_participations.session_id = sessions.id').joins('JOIN users ON users.id = session_participations.student_id').where('session_participations.student_id = ?', self.id).where('sessions.date > ? OR sessions.date = ? AND sessions.time > ?', Date.today, Date.today, Time.now)
    when 'over'
      Session.joins('JOIN session_participations ON session_participations.session_id = sessions.id').joins('JOIN users ON users.id = session_participations.student_id').where('session_participations.student_id = ?', self.id).where('sessions.date < ? OR sessions.date = ? AND sessions.time < ?', Date.today, Date.today, Time.now)
    else
      Session.joins('JOIN session_participations ON session_participations.session_id = sessions.id').joins('JOIN users ON users.id = session_participations.student_id').where('session_participations.student_id = ?', self.id)
    end
  end

  def tutor_sessions(status = nil)
    case status
    when 'ongoing'
      Session.where(tutor_id: id).where('sessions.date > ? OR sessions.date = ? AND sessions.time > ?', Date.today, Date.today, Time.now)
    when 'over'
      Session.where(tutor_id: id).where('sessions.date < ? OR sessions.date = ? AND sessions.time < ?', Date.today, Date.today, Time.now)
    else
      Session.where(tutor_id: id)
    end
  end

  def participating_in?(session)
    participating_sessions.include?(session)
  end

  def self.find_for_facebook_oauth(auth)
    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :lastname)
    user_params['facebook_picture_url'] = auth.info.image
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

  def self.from_omniauth(auth)
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
