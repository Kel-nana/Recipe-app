require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  jane = User.new(name: 'Jane', email: 'jane@example.com', password: 'password123')

  recipe = Recipe.new(name: 'otomboro',
                      preparation_time: '1 hour',
                      cooking_time: '30mins',
                      description: 'Description is here',
                      public: true,
                      user: jane)

  food = Food.new(name: 'Goatie',
                  measurement_unit: 'kg',
                  price: 45)

  subject do
    RecipeFood.new(recipe_id: recipe.id, food_id: food.id, quantity: 5)
  end

  before { subject.save }

  it 'should have a recipe' do
    subject.recipe_id = nil
    expect(subject).to_not be_valid
  end

  it 'should have a food' do
    subject.food_id = nil
    expect(subject).to_not be_valid
  end

  it 'should have a number' do
    subject.quantity = 'abc'
    expect(subject).to_not be_valid
  end
end
