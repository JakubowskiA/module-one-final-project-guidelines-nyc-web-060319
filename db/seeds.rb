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
