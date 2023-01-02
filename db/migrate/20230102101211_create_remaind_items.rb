class CreateRemaindItems < ActiveRecord::Migration[7.0]
  def change
    create_table :remaind_items do |t|
t.string :description
t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
