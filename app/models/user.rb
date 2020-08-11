class User < ActiveRecord::Base
  has_secure_password
  has_many :budgets
  has_many :purchases, through: :budgets
end
