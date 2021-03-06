class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :value
      t.references :user, index: true, foreign_key: true
      t.references :votable, polymorphic: true, index: true
      t.references :commentable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
