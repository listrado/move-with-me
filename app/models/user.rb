class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :journeys, dependent: :destroy
  has_many :groups, through: :journeys

  def upcoming_journey?
    has_upcoming_journey = journeys.last.group.start_at.localtime > Time.zone.now
    has_upcoming_journey
  end
end
