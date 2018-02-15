class Ingredient < ApplicationRecord
  validates :name, uniqueness: true
  validates :name, presence: true

  has_many :doses
end
