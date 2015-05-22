class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :body
      t.belongs_to :owner, index: true

      t.timestamps null: false
    end
    #add_foreign_key :messages, :owners
  end
end
