class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :journeys, dependent: :destroy
  has_many :groups, through: :journeys

  def upcoming_journey?
    if journeys.last
      journeys.last.group.start_at > Time.current
    else
      false
    end
  end
end
