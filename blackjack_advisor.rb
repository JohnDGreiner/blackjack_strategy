
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


p hard

# returns values for non numeric cards
def royal_values_finder(card)
  royal_values = { "J" => 10,
                   "Q" => 10,
                   "K" => 10 }
  puts royal_values[card]
end

# get text for prompting user
def get_prompt_text(counter)
  prompt_strings = ["your first card","your second card","card dealer is showing"]
  return prompt_strings[counter]
end

card = ''
counter = 0
r_card = 0
player_sum = 0
dealer_card = 0

(0..2).each do |counter|
  puts "Enter " + get_prompt_text(counter) + ":"
  card = gets.chomp
  if card.to_i.to_s != card
    card = royal_values_finder(card)
  else
    card = card.to_i
  end
  if counter < 2
    player_sum += card
  else
    dealer_card = card
  end
end
puts dealer_card
puts player_sum


#card = ""
#puts "Enter First card you were dealt:"
#card = gets.chomp
