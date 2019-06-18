require_relative "../config/environment"
require_relative "../app/models/game.rb"

def start
  puts 'Please submit your username or create a new account. To create a new account, type "new".'
  input = gets.chomp
  if input == "new"
    new_player
  else
    login
  end
end

def new_player
  puts "Please choose a username"
  new_username = gets.chomp
  Player.create(name: new_username)
  main_menu
end

def login
  puts "Please enter your username"
  input = gets.chomp

  Player.all.each do |user|
    if input == user.name
      main_menu
    else
      puts "Invalid username. Please try again or create a new account."
    end
  end
end

def main_menu(user)
  puts "Welcome #{user.name}! What would you like to do?"
  puts ""
  puts "[1] Add a new game"
  puts "[2] Create new game review"
  puts "[3] See all of my reviews"
  puts "[4] Find a review by game"
  puts "[5] Exit"

  choice = gets.chomp
  main_menu_action(choice)
end

def main_menu_action(choice)
  case choice
  when 1 #instantiates new game
    new_game
  when "2" #instantiate new review
    new_review
  when "3" #shows all reviews
    all_reviews
  when "4" #find review by name
    find_review_by_name
  when "5"
    exit
  end
end

def new_game
  puts "Please type the name of your game"
  Game.create
end

def new_review
  Review.create
end

def all_reviews
  Review.all
end

def find_review_by_name
end

def exit
  puts "Goodbye, #{user.name}!"
  system("clear")
  start
end

def review_menu
  puts "What would you like to do?"
  puts ""
  puts "[1] Update this review"
  puts "[2] Delete this review"
  puts "[3] Exit to main menu"

  choice = gets.chomp
  review_menu_action(choice)
end

def review_menu_action(choice)
  case input
  when "1" #update review
  when "2" # delete review
  when "3"
    main_menu
  end
end

start
