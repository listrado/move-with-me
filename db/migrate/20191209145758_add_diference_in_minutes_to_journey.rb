class AddDiferenceInMinutesToJourney < ActiveRecord::Migration[5.2]
  def change
    add_column :journeys, :diference_in_minutes, :string
  end
end
