require 'pry'

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        }, {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        }, {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        }, {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        }, {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        }, {
          player_name: "Bismak Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        }, {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        }, {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        }, {
          player_name: "Brendan Haywood",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

# Return => Array of player Hashes
def all_players # self.all
  home_players = game_hash[:home][:players] # Array of player Hashes
  away_players = game_hash[:away][:players] # Array of player Hashes
  home_players + away_players # Array of player Hashes
end

# Arguments:
#   player_name => String
# Return => a player Hashes
def find_player(player_name)
  # Array of player Hashes
  all_players.find do |player| # player Hash
    # String                # String
    player[:player_name] == player_name # Boolean
  end
end

# Arguments:
#   player_name => String
# Return => Number
def num_points_scored(player_name)
  binding.pry
  # Hash       # String     #Symbol
  find_player(player_name)[:points] # Number
end

# Arguments:
#   player_name => String
# Return => Number
def shoe_size(player_name)
  # Hash       # String     #Symbol
  find_player(player_name)[:shoe] # Number
end


# WHY??????????
# oh, fixnum is special!
# Syntatic Sugar

jeff_adrien = {
  player_name: "Jeff Adrien",
  number: 4,
  shoe: 18,
  points: 10,
  rebounds: 1,
  assists: 1,
  steals: 2,
  blocks: 7,
  slam_dunks: 2
}

jason_terry = {
  player_name: "Jason Terry",
  number: 31,
  shoe: 15,
  points: 19,
  rebounds: 2,
  assists: 2,
  steals: 4,
  blocks: 11,
  slam_dunks: 1
}

bob = { name: "Bob", claws: true, weight: 10 }

# binding.pry

# PascalCase
# camelCase
# snake_case
# kebab-case
class BasketballPlayer # the capitalization is required
  # binding.pry
  # macro
  attr_reader :name, :number, :shoe_size #, :points, :rebounds, :assists, :steals, :blocks, :slam_dunks
  # attr_writer :points, :rebounds, :assists, :steals, :blocks, :slam_dunks
  attr_accessor :points, :rebounds, :assists, :steals, :blocks, :slam_dunks

  # binding.pry
  # attributes => instance variable => hold data for the instance
  # @name, @number

  # SHORTCUTS!!!
  # select some text, then press CMD + D to highlight the next matching one

  # this is kept on the class
  # @@class_variable
  @@all = [] # this is being "initialized" when the class is read by the program

  # instance method
  # def all
  #
  # end

  # binding.pry
  # Who should be doing the finding?
  def self.find_player(player_name)
    # Array of BasketballPlayer instances
    @@all.find do |player| # BasketballPlayer instance
      # String       # String
      player.name == player_name # Boolean
    end
  end

  # class method <= sadly, no better way
  def self.all
    @@all
  end

  # .new is called on the class => class method
  # looks like an instance method
  # this methods is called when you do BasketballPlayer.new
  def initialize(player_name, number, shoe, points, rebounds, assists, steals, blocks, slam_dunks)
    @name = player_name
    @number = number
    @shoe_size = shoe
    @points = points
    @rebounds = rebounds
    @assists = assists
    @steals = steals
    @blocks = blocks
    @slam_dunks = slam_dunks

    # local variable
    ps = points

    # binding.pry
    @@all << self # you are the thing (instance) being made at that point
  end

  # instance methods
  def slam_dunk
    binding.pry # self is super nifty and special
    # self # it gives you back the thing that called the method
    # self.two_pointer
    two_pointer # self.two_pointer
    # @points = @points + 2 # two_pointer
    @slam_dunks += 1
    "the crowd goes wild!!!"
  end

  def layup
    two_pointer
    # @points = @points + 2
    "boooo!"
  end

  # helper method
  def two_pointer
    @points = @points + 2
  end

  # instance method => getter
  # def name
  #   @name
  # end

  # def number
  #   @number
  # end

  # instance method => setter
  # def name=(name) # really nice sytantic sugar
  #   @name = name
  # end

end # end of BasketballPlayer class

jeff = BasketballPlayer.new(  "Jeff Adrien", 4, 18, 10, 1, 1, 2, 7, 2)
jason = BasketballPlayer.new("Jason Terry",31,15,19,2,2,4,11,1)

$all_basketball_players = [jeff, jason]

b1 = BasketballPlayer.new("Jason Terry",31,15,19,2,2,4,11,1)
$all_basketball_players << b1
b2 = BasketballPlayer.new("Jason Terry",31,15,19,2,2,4,11,1)
$all_basketball_players << b2
b3 = BasketballPlayer.new("Jason Terry",31,15,19,2,2,4,11,1)
$all_basketball_players << b3
b4 = BasketballPlayer.new("Jason Terry",31,15,19,2,2,4,11,1)
$all_basketball_players << b4

# GLOBAL VARIABLES OMG! NOT MONEYH!

# 🤔 think about how to first access our data?


bob = { name: "Bob", claws: true, weight: 10 }

class Cat
  attr_accessor :claws, :weight
  attr_reader :name

  def initialize(name, claws, weight)
    @name = name
    @claws = claws
    @weight = weight
  end
end # end of Cat class

better_bob = Cat.new("Bob", true, 10)
binding.pry

puts "bye bye!"
