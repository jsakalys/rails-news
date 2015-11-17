class User < ActiveRecord::Base
	has_many :post

	validates :name,
	presence: true,
	length: {
    	minimum: 1,
    	maximum: 200,
    	too_short: "must have at least %{count} words",
    	too_long: "must have at most %{count} words"
  	}

	validates :email,
	presence: true,
	uniqueness: {case_sensitive: false},
	email: true

	validates_presence_of :password
  	has_secure_password

end