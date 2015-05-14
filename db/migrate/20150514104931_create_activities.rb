class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :user_id, null: false
      t.string :verb, null: false
      t.integer :subject_id, null: false
      t.string :subject_type, null: false

      t.timestamps null: false
    end
  end
end
