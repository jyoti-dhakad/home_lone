class AddColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :date_of_birth, :string
    add_column :users, :present_address, :text
    add_column :users, :parmanent_address, :text
    add_column :users, :merital_status, :string
    add_column :users, :category, :string
    add_column :users, :income_source, :string
    add_column :users, :annual_income, :string
    add_column :users, :picture, :string
  end
end
