# create hard hash
hard = {2 => {}, 3 => {}, 4 => {}, 5 => {}, 6 => {}, 7 => {}, 8 => {}, 9 => {},
10 => {}, 11 => {} }

(2..11).each { |dealer| (5..16).each { |player| hard[dealer][player] = "Hit" }}
(2..11).each { |dealer| (17..21).each { |player| hard[dealer][player] = "Stand" }}
(4..6).each { |dealer| hard[dealer][12] = "Stand" }
(2..6).each { |dealer| (13..16).each { |player| hard[dealer][player] = "Stand" }}
[5,6].each { |dealer| hard[dealer][8] = "Double down if possible or Hit" }
(2..6).each { |dealer| hard[dealer][9] = "Double down if possible or Hit" }
(2..9).each { |dealer| hard[dealer][10] = "Double down if possible or Hit" }
(2..11).each { |dealer| hard[dealer][11] = "Double down if possible or Hit" }

# create soft hash
soft = {2 => {}, 3 => {}, 4 => {}, 5 => {}, 6 => {}, 7 => {}, 8 => {}, 9 => {},
10 => {}, 11 => {} }

[2,3].each { |dealer| (13..16).each { |player| soft[dealer][player] = "Hit" }}
(7..11).each { |dealer| (13..17).each { |player| soft[dealer][player] = "Hit" }}
[9,10].each { |dealer| soft[dealer][18] = "Hit" }
(5..6).each { |dealer| (13..16).each { |player| soft[dealer][player] = "Double down if possible or Hit" }}
(2..6).each { |dealer| soft[dealer][17] = "Double down if possible or Hit" }
(3..6).each { |dealer| soft[dealer][18] = "Double down if possible or Stand" }
soft[6][19] = "Double down if possible or Stand"
(2..11).each { |dealer| [20,21].each { |player| soft[dealer][player] = "Stand" }}
(2..5).each { |dealer| soft[dealer][19] = "Stand" }
(7..11).each { |dealer| soft[dealer][19] = "Stand" }
soft[2][18] = "Stand"
soft[11][18] = "Stand"
[7,8].each { |dealer| soft[dealer][18] = "Stand"}

# create pair hash
pair = {2 => {}, 3 => {}, 4 => {}, 5 => {}, 6 => {}, 7 => {}, 8 => {}, 9 => {},
10 => {}, 11 => {} }

(3..7).each { |dealer| pair[dealer]["22"] = "Split" }
[2,8,9,10,11].each { |dealer| pair[dealer]["22"] = "Hit" }
(4..7).each { |dealer| pair[dealer]["33"] = "Split" }
[2,3,8,9,10,11].each { |dealer| pair[dealer]["33"] = "Hit" }
[5,6].each { |dealer| pair[dealer]["44"] = "Double down if possible or Hit" }
[2,3,4,7,8,9,10,11].each { |dealer| pair[dealer]["44"] = "Hit" }
[10,11].each { |dealer| pair[dealer]["55"] = "Hit" }
(2..9).each { |dealer| pair[dealer]["55"] = "Double down if possible or Stand" }
(2..6).each { |dealer| pair[dealer]["66"] = "Split" }
(7..11).each { |dealer| pair[dealer]["66"] = "Hit" }
(2..7).each { |dealer| pair[dealer]["77"] = "Split" }
[8,9,11].each { |dealer| pair[dealer]["77"] = "Hit" }
pair[10]["77"] = "Stand"
(2..11).each { |dealer| pair[dealer]["88"] = "Split"}
(2..6).each { |dealer| pair[dealer]["99"] = "Split" }
[8,9].each { |dealer| pair[dealer]["99"] = "Split" }
[7,10,11].each { |dealer| pair[dealer]["99"] = "Stand" }
(2..11).each { |dealer| pair[dealer]["1010"] = "Stand"}
(2..11).each { |dealer| pair[dealer]["AA"] = "Split"}

# returns values for non numeric cards
def royal_values_finder(card)
  royal_values = { "J" => 10,
                   "Q" => 10,
                   "K" => 10 }
  return royal_values[card]
end

# get text for prompting user
def get_prompt_text(counter)
  prompt_strings = ["your first card","your second card","card dealer is showing"]
  return prompt_strings[counter]
end

counter = 0
r_card = 0
player_sum = 0
dealer_card = 0
answer_type = ''
cards = []


(0..2).each do |counter|
  puts "Enter " + get_prompt_text(counter) + ":"
  cards << gets.chomp
  if cards[counter].to_i.to_s != cards[counter]
    if cards[counter] != "A"
      cards[counter] = royal_values_finder(cards[counter])
    end
  elsif cards[counter] != "A"
    cards[counter] = cards[counter].to_i
  end
end
if cards[2] = "A"
  cards[2] = 11
end
if cards[0] == cards[1]
  puts pair[cards[2]][cards[0].to_s + cards[1].to_s]
elsif cards.include?("A")
  puts soft[cards[2]][cards[0].to_i + cards[1].to_i + 11]
else
  puts hard[cards[2]][cards[0].to_i + cards[1].to_i + 1]
end
