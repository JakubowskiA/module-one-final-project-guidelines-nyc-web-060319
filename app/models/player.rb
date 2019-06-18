class Player < ActiveRecord::Base
  def my_reviews
    Review.all.select do |review|
      review.user == self
    end
  end

  def update_review #SEE Pages document
    #find review from own reviews (my_reviews)
    #Look at review's @game attribute (game object)
    #See if the game_name argument matches the game object's @name attribute
    #game_review_to_change = my_reviews.find_by(game.name: game_name) #review to update
    game_review_to_change.update(content: new_content)
  end

  def delete_review
    puts "Please choose the review to delete by entering the name of the game."

    game_name = gets.chomp

    #game_review_to_delete = my_reviews.find_by(game.name: game_name)

    if game_review_to_delete == nil
      puts "No game by that name found in your reviews. Please try again."
      #How to try again? Recursion?
    else
      game_review_to_delete.destroy
    end
  end

  def delete_all_reviews
    puts "Are you sure you want to delete all reviews? Y/N"
    if gets.chomp =~ /[yY]/
      puts "All reviews deleted."
      my_reviews.destroy_all #clear? But that would just delete array, not objs?
    elsif gets.chomp =~ /[nN]/
      nil #go back to main menu?
    end
  end

  def see_all_reviews_for_game
    puts "Please enter the name of the game you would like to see all the reviews for."
    game_name = gets.chomp
    #if-else bullshit
    #Look thru all reviews, see if any of their Game obj's @name == game_name
    #first, get all game objects (Review.all_games)
    #if Review.all_games.any? {|game| game.name = game_name} <-- is there any game with that name?
    #    Review.all.select {|review| review.game.name: game_name} <--Select all reviews whose @game(obj)'s @name = game_name
    #else
    # puts "No reviews found for a game named #{game_name}.Try again? Type Y for yes, type any other key to exit to main menu."
    #   if gets.chomp=~ /[yY]/
    #      see_all_reviews_for_game
    #   else
    #      #go back to main menu
    #   end
    #
    #
    #end
  end
end
