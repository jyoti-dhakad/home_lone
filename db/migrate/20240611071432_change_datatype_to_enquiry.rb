class ChangeDatatypeToEnquiry < ActiveRecord::Migration[6.1]
  def up
    change_column :enquiries, :status, :string, default: "unread"
  end

  def down
    change_column :enquiries, :status, :integer, default: 0
  end
end
