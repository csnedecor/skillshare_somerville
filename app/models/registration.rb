class Registration < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :user
  belongs_to :workshop

  def my_registration(current_workshop)
    current_user.registrations.find_by(workshop: current_workshop)
  end
end
