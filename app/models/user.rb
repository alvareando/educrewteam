class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :sessions_as_student, foreign_key: 'tutor_id'
  has_many :sessions_as_tutor, foreign_key: 'user_id'
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
