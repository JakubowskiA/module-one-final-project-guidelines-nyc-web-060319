class Review < ActiveRecord::Base

    def all_games #returns array of all game objects
        Review.all.map do |review|
            review.game
        end
    end

end
