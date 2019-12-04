require './lib/random_parser_roll.rb'

class RandomRoll
  def self.roll
    roll = RandomParserRoll.random_entry(file)
    <<-MESSAGE
#{roll['what']} #{roll['who']}
    MESSAGE
  end

  def self.count
    RandomParserRoll.new(file).roll.count
  end

  def self.file
    file ||= File.read './quotes/rolls.json'
  end
end
