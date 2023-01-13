class AddColumnReminds < ActiveRecord::Migration[7.0]
  def change
    add_column :reminds, :notified, :boolean, :default => false
  end
end
