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
    elsif args[0].include?('/info')
      <<-MESSAGE
Right now there are #{RandomQuoter.count} different quotes that this bot will respond with.
      MESSAGE
    elsif args[0].include?('/te')
      'Hoy, ada yang nyariin tuh @tinusagustin @izul683'
    elsif args[0].include?('/fe')
      `Hoy, ada yang nyariin tuh @andrewmanullang @maulshh @arfandiw`
    elsif args[0].include?('/be')
      'Hoy, ada yang nyariin tuh @farhanadha @sagaramahardikas'
    elsif args[0].include?('/product')
      'Hai hai, kalian dicariin nih @vebyregina @juliantivalentini @pflarasati'
    elsif args[0].include?('/standup')
      'SU jam 16.00!'
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
    elsif args[0].start_with? '/'
      'Sorry, but I do not know that command'
    else
    end
  end
end
