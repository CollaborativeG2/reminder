class CreateReminds < ActiveRecord::Migration[7.0]
  def change
    create_table :reminds do |t|
      t.timestamp :remind_at
      t.references :remind_item, foreign_key: true
      t.timestamps
    end
  end
end
