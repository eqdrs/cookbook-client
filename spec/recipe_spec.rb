require 'spec_helper'

RSpec.describe Recipe do
  describe 'GET' do
    it 'should return all recipes' do
      stub_request(:get, 'http://localhost:3000/api/v1/recipes')
        .to_return(body: "#{ File.read('spec/support/all_recipes.json') }",
                  status: 200)

      recipes = Recipe.all

      expect(recipes.length).to eq 3
      expect(recipes.first.title).to eq('Salada')
      expect(recipes.last.title).to eq('Feijoada')
    end

    it 'should find a valid recipe' do
      stub_request(:get, 'http://localhost:3000/api/v1/recipes/3')
        .to_return(body: "#{ File.read('spec/support/find_recipe.json') }",
                  status: 200)

      recipe = Recipe.find(3)

      expect(recipe.title).to eq 'Feijoada'
      expect(recipe.difficulty).to eq 'Fácil'
      expect(recipe.cook_time).to eq 45
      expect(recipe.ingredients).to eq 'Feijão, carne e tempero.'
      expect(recipe.cook_method).to eq 'Misture tudo e ferva.'
    end
  end
end
