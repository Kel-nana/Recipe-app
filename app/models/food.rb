# top-level documentation comment
class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods
end
