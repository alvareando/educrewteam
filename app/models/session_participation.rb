class SessionParticipation < ApplicationRecord
  belongs_to :student
  belongs_to :session
end
