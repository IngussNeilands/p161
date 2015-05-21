class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.references :follower, index: true
      t.references :followed, index: true

      t.timestamps null: false
    end
    add_foreign_key :relationships, :followers
    add_foreign_key :relationships, :followeds
  end
end
