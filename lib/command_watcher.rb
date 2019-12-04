require './lib/random_quoter.rb'
require './lib/random_food.rb'
require './lib/random_roll.rb'
require './lib/random_dota_role.rb'

class CommandWatcher
  def self.parse(text)
    args = text.split(' ')
    if args[0].include?('/start')
      <<-MESSAGE
Hello, nice yo meet you!
- ask me for a quote by typing /quote
- ask me for a food by typing /food
- ask me for a random roll by typing /roll
- ask me for a random dota role by typing /dota_role]
:)
      MESSAGE
    elsif args[0].include?('/help')
      <<-MESSAGE
/start     - startup message
/quote - get a mindful quote
      MESSAGE
    elsif args.include?('abcd')
      <<-MESSAGE
gqjigqejoiqejqeopj
      MESSAGE
    elsif args[0].include?('/info')
      <<-MESSAGE
Right now there are #{RandomQuoter.count} different quotes that this bot will respond with.
      MESSAGE
    elsif args[0].include?('/cc_te')
      <<-MESSAGE
Hoy, ada yang nyariin tuh @tinusagustin @izul683
      MESSAGE
    elsif args[0].include?('/cc_fe')
      <<-MESSAGE
Hoy, ada yang nyariin tuh @andrewmanullang @maulshh @arfandiw
      MESSAGE
    elsif args[0].include?('/cc_be')
      <<-MESSAGE
Hoy, ada yang nyariin tuh @farhanadha @sagaramahardikas
      MESSAGE
    elsif args[0].include?('/cc_product')
      <<-MESSAGE
Hai hai, kalian dicariin nih @vebyregina @juliantivalentini @pflarasati
      MESSAGE
    elsif args[0].include?('/quote')
      RandomQuoter.quote
    elsif args[0].include?('/food')
      RandomFood.food
    elsif args[0].include?('/roll')
      RandomRoll.roll
    elsif args[0].include?('/dota_role')
      RandomDotaRole.dota_role
    elsif ['what?', 'wat', 'wat?'].include? args[0].downcase
      'Think about it man!'
    elsif ['product'].include? args[0].downcase
      'veby puti juli'
    elsif 'cc product'.include? args[0].downcase
      <<-MESSAGE
veby puti juli
      MESSAGE
    elsif args[0].start_with? '/'
      'Sorry, but I do not know that command'
    else
    end
  end
end
