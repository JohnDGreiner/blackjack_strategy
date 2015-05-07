#player_sum = 0
#hard = {}
#(2..11).each do |dealer_sum|
#  player_sum = 4
#  hard[dealer_sum] ="s" [player_sum] = "h"
#end
#p hard

#my_hash = {"hard" => {:dealer 2, :player 5, :move "H"}}

# puts my_hash["hard"]
hard = {2 => {}, 3 => {}, 4 => {}, 5 => {}, 6 => {}, 7 => {}, 8 => {}, 9 => {},
10 => {}, 11 => {} }

(2..11).each { |dealer| (5..16).each { |player| hard[dealer][player] = "hit" }}
(2..11).each { |dealer| (17..21).each { |player| hard[dealer][player] = "stand" }}


p hard

#soft =



  # |dealer| (5..21).each { |player|


#hard = [dealer =>  player] = 'h'  }}
#p hard

#d << dealer} u << player}

#family = { "Homer" => "dad",
#  "Marge" => "mom",
#  "Lisa" => "sister",
#  "Maggie" => "sister",
#  "Abe" => "grandpa",
#  "Santa's Little Helper" => "dog"
#}



#hard = {
#{}"player" => {
#  "player" => ["52", "53", "54", "55", "56", "57", "58", "59", "510", "511", "62"]
