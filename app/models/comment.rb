class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  belongs_to :votable, polymorphic: true
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
end
