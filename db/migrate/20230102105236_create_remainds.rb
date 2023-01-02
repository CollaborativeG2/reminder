class CreateRemainds < ActiveRecord::Migration[7.0]
  def change
    create_table :remainds do |t|
t.timestamp :remaind_at
t.references :remaind_item, foreign_key: true
      t.timestamps
    end
  end
end
