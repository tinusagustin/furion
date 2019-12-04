require 'json'

class RandomParserDotaRole
  def initialize(file)
    data_hash = JSON.parse(file)
    @dota_roles = data_hash['dota_roles']
  end

  def dota_roles
    @dota_roles
  end

  def random_entry
    @dota_roles.sample
  end

  def self.random_entry(file)
    new(file).random_entry
  end
end
