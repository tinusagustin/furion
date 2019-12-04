require './lib/random_parser_dota_role.rb'

class RandomDotaRole
  def self.dota_role
    dota_role = RandomParserDotaRole.random_entry(file)
    <<-MESSAGE
#{dota_role['what']} #{dota_role['who']}
    MESSAGE
  end

  def self.count
    RandomParserDotaRole.new(file).dota_roles.count
  end

  def self.file
    file ||= File.read './quotes/dota_role.json'
  end
end
