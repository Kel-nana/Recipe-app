RSpec.describe Recipe, type: :model do
    let(:user) { User.create(name: 'Test User') }
  
    describe 'validations' do
      it 'is valid with a name and description' do
        user = User.create(name: 'Test User') 
        recipe = Recipe.new(name: 'Spaghetti Bolognese', description: 'my delicious recipe', user: user) # Associate the user with the recipe
        expect(recipe).to be_valid
      end
  
      it 'is invalid without a name' do
        recipe = Recipe.new(name: nil) 
        expect(recipe).to be_invalid
        expect(recipe.errors[:name]).to include("can't be blank")
      end 
  
      it 'is invalid without a description' do
        recipe = Recipe.new(description: nil) 
        expect(recipe).to be_invalid
        expect(recipe.errors[:description]).to include("can't be blank")
      end            
    end
  end
  