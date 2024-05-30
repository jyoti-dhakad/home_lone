class CreateEnquiries < ActiveRecord::Migration[6.1]
  def change
    create_table :enquiries do |t|
      t.text :message
      t.references :user, null: false, foreign_key: true
      t.references :loan_application, null: false, foreign_key: true

      t.timestamps
    end
  end
end
