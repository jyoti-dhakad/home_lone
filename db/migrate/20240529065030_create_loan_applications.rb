class CreateLoanApplications < ActiveRecord::Migration[6.1]
  def change
    create_table :loan_applications do |t|
      t.integer :status, default: 0
      t.decimal :amount
      t.string :start_date
      t.string :end_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
