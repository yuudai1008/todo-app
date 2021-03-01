class AddStatusToGoals < ActiveRecord::Migration[5.2]
  def change
    add_column :goals, :status, :integer, null: false, default: 1
  end
end
