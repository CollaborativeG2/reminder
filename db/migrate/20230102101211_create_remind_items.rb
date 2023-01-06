class CreateRemindItems < ActiveRecord::Migration[7.0]
  def change
    create_table :remind_items do |t|
      t.string :description
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
