class User < ActiveRecord::Base
  has_many :budgets
  has_many :purchases, through: :budgets
end
