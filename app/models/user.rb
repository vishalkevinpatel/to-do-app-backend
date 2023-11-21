class User < ApplicationRecord
  has_many :todos
  has_secure_password
  validates :email, presence: true, uniqueness: true
end
