require 'spec_helper'

RSpec.describe Recipe do
  it 'GET all recipes' do
    stub_request(:get, 'http://localhost:3000/api/v1/recipes')
      .to_return(body: "#{ File.read('spec/support/all_recipes.json') }",
                 status: 200)

    recipes = Recipe.all

    expect(recipes.length).to eq 3
    expect(recipes.first.title).to eq('Salada')
    expect(recipes.last.title).to eq('Feijoada')
  end
end
