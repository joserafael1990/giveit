class AddStatusToItem < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :status, :boolean
  end
end
