class Category < ApplicationRecord
  has_many :todos
  validates :name, uniqueness: true
end
