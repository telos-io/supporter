class Input < ActiveRecord::Base

  validates :name, presence: {message: "Company name must be provided"}

  validates :email, presence: {message: "Email must be provided"}

end
