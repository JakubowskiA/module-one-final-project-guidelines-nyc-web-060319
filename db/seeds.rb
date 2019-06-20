Player.destroy_all
Relationship.destroy_all

#All players
p1 = Player.create(name: "AJabberwocky")
p2 = Player.create(name: "TheSlyOlive")
p3 = Player.create(name: "NightSwipe")
p4 = Player.create(name: "MsRHood")
p5 = Player.create(name: "Ghost")

#All reltionships
Relationship.create(friender_id: p1.id, friendee_id: p2.id)
Relationship.create(friender_id: p1.id, friendee_id: p3.id)
Relationship.create(friender_id: p1.id, friendee_id: p4.id)
Relationship.create(friender_id: p2.id, friendee_id: p3.id)
Relationship.create(friender_id: p2.id, friendee_id: p4.id)
Relationship.create(friender_id: p3.id, friendee_id: p4.id)

#All Games
g1 = Game.create(name: "Destiny", genre: "FPS", platforms: "PC, Playstation")
g2 = Game.create(name: "Rainbow 6 Siege", genre: "FPS", platforms: "PC")
g3 = Game.create(name: "Super Mario Odyssey", genre: "Platformer", platforms: "Switch")
g4 = Game.create(name: "Skyrim", genre: "Fantasy", platforms: "PC, Switch")
g5 = Game.create(name: "Fortnite", genre: "Battle Royale", platforms: "PC, Switch, PlayStation, Xbox")
g6 = Game.create(name: "Bloodborne", genre: "RPG", platforms: "PlayStation")
g7 = Game.create(name: "Dark Souls", genre: "RPG", platforms: "PlayStation, Xbox, Switch")
g8 = Game.create(name: "Dark Souls II", genre: "RPG", platforms: "PlayStation, Xbox, Switch")
g9 = Game.create(name: "Dark Souls III", genre: "RPG", platforms: "PlayStation, Xbox, Switch")
g10 = Game.create(name: "Anthem", genre: "Battle Royale", platforms: "PC, PlayStation, Xbox")
g11 = Game.create(name: "The Division", genre: "FPS", platforms: "PC, PlayStation, Xbox")
g12 = Game.create(name: "Destiny 2", genre: "FPS", platforms: "PC, Playstation")
g13 = Game.create(name: "Assassin's Creed", genre: "Action-adventure", platforms: "Playstation, Xbox")

#All reviews
r1 = Review.create(player_id: p1.id, game_id: g1.id, rating: 9, text: "I love this game! It creates such a cool world!")
r2 = Review.create(player_id: p2.id, game_id: g1.id, rating: 9, text: "This is the perfect game for playing with friends!")
r3 = Review.create(player_id: p3.id, game_id: g2.id, rating: 9, text: "This game is so cool! I love the new changes!")
r4 = Review.create(player_id: p4.id, game_id: g2.id, rating: 6, text: "It's fun but stressful.")
r5 = Review.create(player_id: p2.id, game_id: g3.id, rating: 9, text: "I always love some Mario!")
