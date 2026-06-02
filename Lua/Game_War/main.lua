--War card game
deck1 = nil
deck2 = nil
gameover = false
playhand = true
playagain = nil

----------------------------------------------------
while gameover == false do --full game loop
  -- Create a deck
  --13 cards, 4 suits
  --loop through 4 suits and add 13 cards to each
  
  deck1 = {}
  for suitIndex, suit in ipairs({'Club', 'Diamond', 'Heart', 'Spade'}) do
     for rank = 1, 13 do
      table.insert(deck1, {suit, rank})
    end
  end
  --Temporary (length of deck)
  --print(#deck1)
  
  ------------------------------------------------
  
  deck2 = {}
  for suitIndex, suit in ipairs({'Club', 'Diamond', 'Heart', 'Spade'}) do
     for rank = 1, 13 do
      table.insert(deck2, {suit, rank})
    end
  end
  --Temporary (length of deck)
  --print(#deck2)
  
  --------------------------------------------------
  
  --Play portion
  --Get two random cards, check which value is higher
  --Higher value gets the cards
  --Play until one person has all cards
  --War declared if cards are equal


  math.randomseed(os.time())
  math.random(); math.random(); math.random() --making things more random
  
  while playhand == true do --single hand loop
    --get card from each deck
    card1i = math.random(#deck1) --#deck1 is length of deck1
    card2i = math.random(#deck2)

    --prints out the cards that are being printed out
    print("Player 1 puts down: The ".. deck1[card1i][2].. " of " ..deck1[card1i][1].."s")
    print("Player 2 puts down: The ".. deck2[card2i][2].. " of " ..deck2[card2i][1].."s")

    --Player 1 wins
    if deck1[card1i][2] > deck2[card2i][2] then
      print("Player 1 Wins the Hand!")
      deck1[#deck1 + 1] = deck2[card2i] --add whole card
      table.remove(deck2, card2i) --remove whole card
    --Player 2 wins
    elseif deck1[card1i][2] < deck2[card2i][2] then
      print("Player 2 Wins the Hand!")
      deck2[#deck2 + 1] = deck1[card1i] --add whole card
      table.remove(deck1, card1i) --remove whole card  
    --Tie
    
      --On a tie, 4 cards are laid down, the fifth card is turned, highest card takes all of them. If still a tie, stalemate, cards go back to original decks.

    end
    --End of hand
    print(#deck1)
    print(#deck2)
    
    print ("Press any key to play next hand, X to exit")
    playagain = io.read()
    if string.upper(playagain) == "X" then
      playhand = false
      gameover = true
      break
    end    
  end
end