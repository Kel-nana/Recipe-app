class Recipe < ApplicationRecord
 database
 
  belongs_to :user
  has_many :recipe_foods

  validates :name, presence: true
end
 
