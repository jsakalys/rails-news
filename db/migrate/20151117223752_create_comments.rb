class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body
      t.references :user, index: true, foreign_key: true
      t.references :post, index: true, foreign_key: true
      t.references :votable, polymorphic: true, index: true
      t.references :commentable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
