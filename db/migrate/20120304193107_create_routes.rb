class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.integer :user_id
      t.integer :src_location_id
      t.integer :dst_location_id
      t.timestamp :departure_date
      t.timestamp :arrival_date
      t.integer :places
      t.string :details

      t.timestamps
    end
    add_index :routes, :created_at
    add_index :routes, :src_location_id
    add_index :routes, :dst_location_id
  end
end
