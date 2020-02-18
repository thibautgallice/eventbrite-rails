class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event

  after_create :new_participant

  def new_participant
    AdminMailer.new_participant(self.user_id, self.event_id).deliver_now
  end


end
