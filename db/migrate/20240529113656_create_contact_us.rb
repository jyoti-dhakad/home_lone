class CreateContactUs < ActiveRecord::Migration[6.1]
  def change
    create_table :contact_us do |t|
      t.string :phone
      t.string :email
      t.text :address

      t.timestamps
    end
  end
end
