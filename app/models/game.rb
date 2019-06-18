class Game < ActiveRecord::Base
  def self.new_game
    self.create(name, genre, platforms)
  end
end
