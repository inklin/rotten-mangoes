class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :title
      t.string :director
      t.integer :duration_min
      t.integer :duration_max

      t.timestamps
    end
  end
end
