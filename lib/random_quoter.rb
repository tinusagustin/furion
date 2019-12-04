require './lib/random_parser.rb'

class RandomQuoter
  def self.quote
    quote = RandomParser.random_entry(file)
    <<-MESSAGE
#{quote['what']}
  - #{quote['who']}
    MESSAGE
  end

  def self.count
    RandomParser.new(file).quotes.count
  end

  def self.file
    file ||= File.read './quotes/quotes.json'
  end
end
