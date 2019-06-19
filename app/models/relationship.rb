class Relationship < ActiveRecord::Base
  belongs_to :friender, class_name: "Player"
  belongs_to :friendee, class_name: "Player"
end
