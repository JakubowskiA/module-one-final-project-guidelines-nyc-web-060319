# require "pry"
require_relative "../config/environment"
require_relative "../app/models/game.rb"

def start
  puts 'Please submit your username or create a new account. To create a new account, type "new" or enter "login" if you already have an account.'
  puts "To exit, type exit."
  input = gets.chomp
  if input == "new"
    new_player
  elsif input == "login"
    login
  elsif input == "exit"
    fancy_goodbye
    exit
  else
    puts "Please submit a valid response."
    start
  end
end

def new_player
  puts "Please choose a username"
  new_username = gets.chomp
  @user = Player.create(name: new_username)
  welcome(@user)
end

def login
  puts "Please enter your username"
  input = gets.chomp

  if Player.all.any? { |player| player.name == input }
    @user = Player.all.find do |user|
      input == user.name
    end
    welcome(@user)
  else
    puts "Invalid username. Please try again."
    start
  end
end

def welcome(user)
  fancy_welcome
  puts "Welcome #{user.name}!"
  main_menu
end

def main_menu
  puts "What would you like to do?"
  puts ""
  puts "[1] Add a new game"
  puts "[2] Create new game review"
  puts "[3] See all of my reviews"
  puts "[4] Find a review by game"
  puts "[5] Delete all reviews"
  puts "[6] Add a friend"
  puts "[7] See my friends"
  puts "[8] Exit"

  choice = gets.chomp
  main_menu_action(choice)
end

def main_menu_action(choice)
  case choice
  when "1" #instantiates new game
    new_game
  when "2" #instantiate new review
    new_review
  when "3" #shows all reviews
    my_reviews
  when "4" #find review by name
    find_my_review_by_game_name
  when "5"
    delete_all_reviews
  when "6"
    add_new_friend
  when "7"
    my_friends
  when "8"
    fancy_goodbye
    exit
  end
end

def new_game
  puts "Please enter the name of your game."
  game_name = gets.chomp
  puts "Please enter the genre of your game."
  game_genre = gets.chomp
  puts "Please enter the platforms on which your game is available."
  game_platforms = gets.chomp
  Game.create(name: game_name, genre: game_genre, platforms: game_platforms)
end

def new_review
  #binding.pry
  puts "What game are you reviewing?"
  game_name = gets.chomp
  game = Game.all.find do |game|
    game.name == game_name
  end
  game_id = game.id
  puts "Please write what you thought about this game."
  review_content = gets.chomp
  puts "Please put a rating for this game (1-10)."
  review_rating = gets.chomp
  new_review = Review.create(player_id: @user.id, game_id: game_id, rating: review_rating, text: review_content)
end

def my_reviews_w_script
  # binding.pry
  puts "Here are all reviews authored by you: 
    #{Review.all.select do |review|
         review.player_id == @user.id
       end}"
  puts "Return to main menu? Y/N"
  if gets.chomp =~ /[yY]/
    main_menu
  end
end

def my_reviews
  Review.all.select do |review|
    review.player_id == @user.id
  end
end

def all_reviews
  puts Review.all
end

def find_my_review_by_game_name
  puts "Please enter the name of the game you want to find the review for."
  #binding.pry
  game_name = gets.chomp
  game = Game.all.find do |game|
    game.name == game_name
  end

  if Review.all.find { |rev| rev.game_id == game.id }
    @review = Review.all.find { |rev| rev.game_id == game.id }
    puts "Here is your review #{@review.text}"
  else
    puts "We couldn't find a game you reviewed by that name. To try again, type Y. To return to the main menu, type any other key."
    # if gets.chomp =~ /[yY]/
    #   find_my_review_by_game_name
    # else
    #   main_menu
    # end
  end

  review_menu
end

def exit_program
  puts "Goodbye!"
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
  puts "Please update your review content. If you do not want to update your content, type n."

  new_content = gets.chomp

  if new_content == "n"
    nil #nil should just skip to the next part.
  else #gets.chomp = new_content (new_content != n)
    @review.update(text: new_content)
  end

  puts "Please update your review rating (1-10). If you do not want to update 
        your rating, type n."

  new_rating = gets.chomp

  if new_rating == "n"
    nil #nil should just skip to the next part.
  else (1..10).include?(new_rating.to_i) #ensures rating is a number between 1 and 10
    @review.update(rating: new_rating)
 # else #new_rating wasn’t “n”, or a number between 1-10
       #   puts "Incorrect entry. Please enter a number between 1 and 10."
       #   #How would you make it so user is able to re-input a new rating value?
      end

  #show the newly updated review using puts and string interpolation?
  puts "Your review has been updated."
end

def delete_review
  puts "Are you sure you want to delete this review? Y/N (N will return to main menu)"
  if gets.chomp =~ /[yY]/
    @review.destroy
    puts "Review deleted. Returning to main menu"
    main_menu
  else
    main_menu
  end
end

def delete_all_reviews
  puts "Are you sure you want to delete all reviews? Press Y to delete, press any other key to return to main menu."
  if gets.chomp =~ /[yY]/
    Review.all.where(player_id: @user.id).destroy_all
    #my_reviews.destroy_all
    puts "All reviews deleted."
  elsif gets.chomp =~ /[nN]/
    main_menu
  end
end

def fancy_welcome
  puts " _    _   ____   _      _____    ___    _    _   ____   ____"
  puts "| |  | | |  __/ | |    /  _  \\  / _ \\  | \\  / | |  __/ \\    /"
  puts "| |  | | | |__  | |    | | |_/ | / \\ | |  \\/  | | |__   \\  /"
  puts "| |  | | |  __| | |    | |  _  | | | | | |\\/| | |  __|   \\/"
  puts "| \\/\\/ | | |__  | |__  | |_| \\ | \\_/ | | |  | | | |__    __ "
  puts " \\_/\\_/  |____\\ |____\\ \\_____/  \\___/  |_|  |_| |____\\  |__|"
end

def fancy_goodbye
  puts " ______     ____    ____   _____   _____ __     __ ______  _______"
  puts "/  ___ \\   / __ \\  / __ \\ |  __ \\ |  _  \\\\ \\   / /|  ____| \\     /"
  puts "| /   \\_\\ | /  \\ || /  \\ || |  \\ || | | | \\ \\ / / | |       \\   /"
  puts "| |  ____ | |  | || |  | || |  | || |/  /  \\ ` /  |  --.     \\_/"
  puts "| | |_  _|| |  | || |  | || |  | ||  _  \\   | |   |  --‘      _"
  puts "| \\__/  | | \\__/ || \\__/ || |__/ || |_\\ |   | |   | |____    / \\"
  puts " \\____/_|  \\____/  \\____/ |_____/ |_____/   |_|   |______|   \\_/"
end

def add_new_friend
  puts "Please enter your friend's username."
  friend_username = gets.chomp
  @user.add_friend(friend_username)
end

def my_friends
  puts "Here are your friends."
  puts @user.friend_names
  puts ""
  puts "Enter 'reviews' to see your friends' reviews."
  input = gets.chomp
  if input == "reviews"
    friend_reviews
  end
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
  puts review_games
  friend_reviews
end

def friend_reviews
  puts "Please enter the game you would like to see."
  game_name = gets.chomp
  game_id = Game.all.find do |game|
    game.name == game_name
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
  end
end

start

#How to add user communications
#How to remove all reviews for a specific user
