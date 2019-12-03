class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.datetime :start_at
      # t.references :location, foreign_key: true # location_id => locations
      t.references :start_location, foreign_key: { to_table: :locations } # start_location_id => locations
      t.references :end_location, foreign_key: { to_table: :locations } # end_location_id => locations

      t.timestamps
    end
  end
end
