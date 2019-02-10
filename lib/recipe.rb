require 'net/http'
require 'json'

class Recipe

  attr_accessor :title, :difficulty, :cook_time, :ingredients, :cook_method,
                :recipe_type_id, :cuisine_id, :user_id, :highlight,
                :created_at, :updated_at

  def initialize(params:)
    @title = params['title']
    @difficulty = params['difficulty']
    @cook_time = params['cook_time']
    @ingredients = params['ingredients']
    @cook_method = params['cook_method']
    @recipe_type_id = params['recipe_type_id']
    @cuisine_id = params['cuisine_id']
    @user_id = params['user_id']
    @highlight = params['highlight']
    @created_at = params['created_at']
    @updated_at = params['updated_at']
  end

  def self.all
    uri = URI('http://localhost:3000/api/v1/recipes')
    recipes = JSON.parse(Net::HTTP.get(uri))
    recipes = create_recipes(recipes)
  end

  def self.find(id)
    uri = URI("http://localhost:3000/api/v1/recipes/#{id}")
    recipe = JSON.parse(Net::HTTP.get(uri))
    recipe = Recipe.new(params: recipe)
  end

  def self.create_recipes(recipes)
    array = []
    recipes.each { |r| array << Recipe.new(params: r) }
    array
  end
end
