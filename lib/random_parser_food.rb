require 'json'

class RandomParserFood
  def initialize(file)
    data_hash = JSON.parse(file)
    @foods = data_hash['foods']
  end

  def foods
    @foods
  end

  def random_entry
    @foods.sample
  end

  def self.random_entry(file)
    new(file).random_entry
  end
end
