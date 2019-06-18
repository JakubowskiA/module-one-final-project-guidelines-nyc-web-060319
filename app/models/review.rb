class Review < ActiveRecord::Base
  def create_review
    puts "Please create your review. First, what game are you reviewing?"
    game_name = gets.chomp
    puts "Please write what you thought about this game."
    review_content = gets.chomp
    puts "Please put a rating for this game (1-10)"
    review_rating = gets.chomp
    Review.create(user: user_id, game: game_name, content: review_content, rating: review_rating)
  end
end
