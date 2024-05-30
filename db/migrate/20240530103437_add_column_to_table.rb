class AddColumnToTable < ActiveRecord::Migration[6.1]
  def change
    add_column :enquiries, :status, :integer, default: 0
  end
end
