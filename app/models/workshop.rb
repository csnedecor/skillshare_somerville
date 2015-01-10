class Workshop < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :workshop_pic, WorkshopPicUploader
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true
  validates :date, presence: true
  validate :date_is_in_the_future, on: :create
  validates :street, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :user_id, presence: true

  def date_is_in_the_future
    errors.add(:date, "must be in the future") if (date < DateTime.now)
  end
end
