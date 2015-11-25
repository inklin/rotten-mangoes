class DropProductsTable < ActiveRecord::Migration
  def change
    drop_table :searches
  end
end
