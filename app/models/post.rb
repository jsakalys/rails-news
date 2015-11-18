class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :votes, as: :votable

  validates :title,
  presence: true,
  length: {
    minimum: 10,
    maximum: 100,
    too_short: "must have at least %{count} words",
    too_long: "must have at most %{count} words"
  }

	validates :link, :url => true

end
