require 'json'

class RandomParserRoll
  def initialize(file)
    data_hash = JSON.parse(file)
    @rolls = data_hash['rolls']
  end

  def rolls
    @rolls
  end

  def random_entry
    @rolls.sample
  end

  def self.random_entry(file)
    new(file).random_entry
  end
end
