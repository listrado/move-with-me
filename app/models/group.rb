class Group < ApplicationRecord
  belongs_to :start_location, class_name: 'Location'
  belongs_to :end_location, class_name: 'Location'

  has_many :journeys, dependent: :destroy
  has_many :groups, through: :journeys
end
