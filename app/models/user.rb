class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :journeys, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :groups, through: :journeys
  after_create :send_welcome_email

  def upcoming_journey?
    if journeys.last
      journeys.last.group.start_at > Time.current - journeys.last.time_zone.hours
    else
      false
    end
  end

  def current_journeys
    if journeys.last
      current_journeys = []
      journeys.all.each do |journey|
        current_journeys.push(journey) if journey.group.start_at > Time.current - journey.time_zone.hours
      end
      current_journeys
    else
      false
    end
  end

  private

  def send_welcome_email
    UserMailer.send("welcome_email", self).deliver_now
  end
end



