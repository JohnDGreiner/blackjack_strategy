def royal_values_finder(card)
  royal_values = {"J" => 10,
                  "Q" => 10,
                  "K" => 10,
                  "A" => { one:  1,
                           eleven: 11 }
                  }
  puts royal_values[card]
end

card = ''

puts "Enter a card:"
card = gets.chomp
royal_values_finder(card)


#card = ""
#puts "Enter First card you were dealt:"
#card = gets.chomp
