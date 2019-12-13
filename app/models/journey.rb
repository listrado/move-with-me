class Journey < ApplicationRecord
  belongs_to :user
  belongs_to :group

  def time_zone
    diference_in_minutes.to_i
  end
end
