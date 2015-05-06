# returns values for non numeric cards
def royal_values_finder(card)
  royal_values = { "J" => 10,
                   "Q" => 10,
                   "K" => 10, }
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
    puts player_sum
  else
    dealer_card = card
  end
end
puts dealer_card
puts player_sum


#card = ""
#puts "Enter First card you were dealt:"
#card = gets.chomp
