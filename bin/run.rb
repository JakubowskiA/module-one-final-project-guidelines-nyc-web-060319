# require "pry"
require_relative "../config/environment"
require_relative "../app/models/game.rb"

def divider
  puts "☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆ ☆"
end

def start
  system("clear")
  hello_animation
  puts ""
  divider
  puts "Please submit your username or create a new account."
  puts ""
  puts 'To create a new account, type "new" or enter "login" if you already have an account.'
  puts ""
  puts "To exit, type exit."
  divider
  input = gets.chomp
  if input == "new"
    new_player
  elsif input == "login"
    login
  elsif input == "exit"
    exit_program
  else
    puts "Please submit a valid response."
    sleep (1)
    start
  end
end

def new_player
  puts "Please choose a username"
  new_username = gets.chomp
  if Player.all.any? { |player| player.name == new_username }
    puts "This user already exists. Please choose a different username."
    sleep(2)
    start
  else
    @user = Player.create(name: new_username)
    welcome(@user)
  end
end

def login
  divider
  login_animation
  puts "Please enter your username"
  input = gets.chomp

  if Player.all.any? { |player| player.name == input }
    @user = Player.all.find do |user|
      input == user.name
    end
    welcome(@user)
  else
    puts "Invalid username. Please try again."
    sleep (1)
    start
  end
end

def welcome(user)
  welcome_animation
  puts ""
  puts "Welcome #{user.name}!"
  puts ""
  main_menu
end

def main_menu
  divider
  puts "What would you like to do?"
  puts ""
  puts "[1] Add a new game"
  puts "[2] Create new game review"
  puts "[3] See all of my reviews"
  puts "[4] Find a review by game"
  puts "[5] Delete all of your reviews"
  puts "[6] Add a friend"
  puts "[7] See my friends"
  puts "[8] Exit"
  divider

  choice = gets.chomp
  main_menu_action(choice)
end

def main_menu_action(choice)
  case choice
  when "1" #instantiates new game
    new_game
  when "2" #instantiate new review
    new_review
  when "3" #shows all reviews by user
    my_reviews_w_script
  when "4" #find review by name
    find_my_review_by_game_name
  when "5" #gives option to delete all reviews
    delete_all_reviews
  when "6" #prompts user to add new friend
    add_new_friend
  when "7" #shows user's friends
    my_friends
  when "8" #exits program
    exit_program
  else
    puts "Invalid response. Please enter a number from 1-8."
    sleep(2)
    main_menu
  end
end

def new_game
  divider
  puts "Please enter the name of your game."
  game_name = gets.chomp
  if Game.all.any? { |game| game.name == game_name }
    puts "We already have a record of this game. Returning to main menu."
    sleep(2)
    main_menu
  else
    puts "Please enter the genre of your game."
    game_genre = gets.chomp
    puts "Please enter the platforms on which your game is available."
    game_platforms = gets.chomp
    Game.create(name: game_name, genre: game_genre, platforms: game_platforms)
    puts "Your game has been created."
    sleep(1)
    puts "Returning to main menu."
    divider
    main_menu
  end
end

def new_review
  #binding.pry
  divider
  puts "What game are you reviewing?"
  game_name = gets.chomp

  if Game.all.any? { |game| game.name == game_name }
    game = Game.all.find do |game|
      game.name == game_name
    end
    game_id = game.id
    puts "Please write what you thought about this game."
    review_content = gets.chomp
    puts "Please put a rating for this game (1-10)."
    review_rating = gets.chomp
    new_review = Review.create(player_id: @user.id, game_id: game_id, rating: review_rating, text: review_content)
    puts "Your review has been created."
    puts "#{game_name}: Rating: #{new_review.rating} #{new_review.text}"
    sleep(5)
    main_menu
  else
    puts "Game name not recognized."
    puts "Enter 'new' to create a new game. Enter any other key to return to the main menu."
    divider
    input = gets.chomp
    if input == "new"
      new_game
    else
      main_menu
    end
  end
end

def game_name_by_id(game_id)
  Game.all.find do |game|
    game.id == game_id
  end.name
end

def my_reviews
  Review.all.select do |review|
    review.player_id == @user.id
  end
end

def my_reviews_w_script
  # binding.pry
  divider
  puts "Here are all reviews authored by you."
  puts ""
  my_reviews.each do |review|
    puts game_name_by_id(review.game_id) + ": " + review.text
    puts ""
  end
  divider
  puts "Enter 'main' to return to the main menu or enter anything else to exit the program."
  input = gets.chomp
  if input == "main"
    main_menu
  elsif input == "exit"
    exit_program
  end
end

def all_reviews
  puts Review.all
end

def find_my_review_by_game_name
  puts "Please enter the name of the game you want to find the review for."
  #binding.pry
  game_name = gets.chomp
  if Game.all.any? { |game| game.name == game_name }
    game = Game.all.find do |game|
      game.name == game_name
    end

    Review.all.find { |rev| rev.game_id == game.id }
    @review = Review.all.find { |rev| rev.game_id == game.id }
    puts "Here is your review: "
    puts "#{@review.text}"

    review_menu
  else
    puts "We couldn't find a record for this game."
    puts "Enter 'new' to create a new game, enter 'main' to return to the main menu or enter anything else to exit the program."
    input = gets.chomp
    if input == "main"
      main_menu
    elsif input == "new"
      new_game
    else
      exit_program
    end
  end
end

# def find_my_review_by_game_name
#   puts "Please enter the name of the game you want to find the review for."
#   #binding.pry
#   game_name = gets.chomp
#   if Game.all.any? { |game| game.name == game_name }
#     game = Game.all.find do |game|
#       game.name == game_name
#     end
#   else
#     puts "We do not have a review for that game."
#     puts "Enter 'new' to create a new record for your game or enter anything else to return to the main menu."
#     if input == "new"
#       new_review
#     else
#       main_menu
#     end
#   end

#   if Review.all.find { |rev| rev.game_id == game.id }
#     @review = Review.all.find { |rev| rev.game_id == game.id }
#     puts "Here is your review #{@review.text}"
#   else
#     puts "We couldn't find a review for that game."
#   end
#   review_menu
# end

def exit_program
  goodbye_wave
  #sleep(1)
  system("clear")
end

def review_menu
  divider
  puts "What would you like to do?"
  puts ""
  puts "[1] Update this review"
  puts "[2] Delete this review"
  puts "[3] Exit to main menu"
  divider

  choice = gets.chomp
  review_menu_action(choice)
end

def review_menu_action(choice)
  case choice
  when "1" #update review
    update_review
  when "2" # delete review
    delete_review
  when "3"
    main_menu
  end
end

def update_review
  divider
  puts "Please update your review content. If you do not want to update your content, enter 'next'."

  new_content = gets.chomp

  if new_content == "next"
    nil #nil should just skip to the next part.
  else
    @review.update(text: new_content)
  end

  puts "Please update your review rating (1-10)."
  puts "If you do not want to update your rating, type next."

  new_rating = gets.chomp

  if new_rating == "next"
    nil #nil should just skip to the next part.
  else (1..10).include?(new_rating.to_i) #ensures rating is a number between 1 and 10
    @review.update(rating: new_rating)   end
  puts "Your review has been updated."
  puts "Returning to main menu."
  divider
  sleep(1)
  main_menu
end

def delete_review
  divider
  puts "Are you sure you want to delete this review?"
  puts "Enter 'yes' to delete the review. Enter anything else to return to the main menu."
  if gets.chomp == "yes"
    @review.destroy
    puts "Review deleted. Returning to main menu"
    divider
    main_menu
  else
    main_menu
  end
end

def delete_all_reviews
  divider
  puts "Are you sure you want to delete all reviews? Enter 'yes' to delete, enter anything else to return to main menu."
  input = gets.chomp
  if input == "yes"
    Review.all.where(player_id: @user.id).destroy_all
    puts "All reviews deleted."
    puts "Returning to main menu."
    divider
    main_menu
  else
    main_menu
  end
end

def add_new_friend
  divider
  puts "Please enter your friend's username."
  friend_username = gets.chomp
  if Player.all.any? { |player| player.name == friend_username }
    @user.add_friend(friend_username)
    puts "Added #{friend_username} to your friends list!"
    sleep(3)
    main_menu
  else
    puts "We couldn't find a user by that name."
    puts "To try again, enter 1. To return to the main menu, enter any other key."

    input = gets.chomp

    if input == "1"
      add_new_friend
    else
      main_menu
    end
  end
end

def my_friends
  divider
  puts "Here are your friends."
  puts ""
  puts @user.friend_names
  puts ""
  friend_games
  # puts "Enter 'reviews' to see your friends' reviews."
  # puts "Type 'main' to return to main menu."
  # puts "Type 'exit' to exit"
  # divider
  # input = gets.chomp
  # if input == "reviews"
  #   friend_games
  # elsif input == "main"
  #   main_menu
  # elsif input == "exit"
  #   exit_program
  # else
  #   puts "Invalid input.Please try again."
  #   puts ""
  #   sleep(2)
  #   my_friends
  #end
end

def friend_games
  puts "Please enter your friend's username."
  friend_username = gets.chomp
  friend_id = Player.all.find do |player|
    player.name == friend_username
  end.id
  review_game_id = Review.all.where(player_id: friend_id).map do |review|
    review.game_id
  end
  review_games = Game.all.find(review_game_id).map do |game|
    game.name
  end
  divider
  puts "These are the games your friend has reviewed."
  puts ""
  puts review_games
  friend_reviews
end

def friend_reviews
  divider
  puts "Please enter the game you would like to see or enter 'main' to return to the main menu."
  input = gets.chomp
  if input == "main"
    main_menu
  elsif Game.all.any? { |game| game.name == input }
    game_id = Game.all.find do |game|
      game.name == input
    end.id
    game_review = Review.all.where(game_id: game_id).map do |review|
      review.text
    end
    puts game_review
    puts 'To return to the main menu enter "main". To return to your friend\'s games enter "friends".'
    input = gets.chomp
    if input == "main"
      main_menu
    elsif input == "friends"
      friend_games
    else
      puts "Invalid response, returning to main menu."
      main_menu
    end
  else
    puts "Your friend has not reviewed this game."
    friend_reviews
  end
end

start
