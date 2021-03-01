class AddStatusToTodos < ActiveRecord::Migration[5.2]
  def change
    add_column :todos, :status, :integer, null: false, default: 1
  end
end
