class ChangeStatusToItem < ActiveRecord::Migration[5.0]
  def change
  	rename_column :Items, :status, :available
  	change_column_default :Items, :available, true
  end
end
