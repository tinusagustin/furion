require './lib/random_parser_food.rb'

class RandomFood
  def self.food
    food = RandomParserFood.random_entry(file)
    <<-MESSAGE
#{food['what']} #{food['who']}
    MESSAGE
  end

  def self.count
    RandomParserFood.new(file).foods.count
  end

  def self.file
    file ||= File.read './quotes/foods.json'
  end
end
