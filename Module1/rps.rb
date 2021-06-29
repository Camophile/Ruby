# return player entry if valid or call again until returns one of rock, paper or scissors
def getEntry(player)
  print "Player #{player} - Enter your selection: "
  entry = gets.chomp.downcase
  if entry == "rock" || entry == "paper" || entry == "scissors"
    entry
  else
    puts "No cheaters! Only Rock, Paper or Scissors are allowed"
    getEntry(player)
  end
end

def returnWinner(entry1, entry2)
  def callWinner(playerNumber)
    "Player #{playerNumber} wins."
  end

  paper = "Paper covers rock."
  rock = "Rock crushes scissors."
  scissors = "Scissors cuts paper."

  if entry1 == "rock"
    winner = entry2 == "paper" ? [paper, callWinner("2")] : [rock, callWinner("1")]
  elsif entry1 == "paper"
    winner = entry2 == "scissors" ? [scissors, callWinner("2")] : [paper, callWinner("1")]
  else # entry1 is scissors
    winner = entry2 == "rock" ? [rock, callWinner("2")] : [scissors, callWinner("1")]
  end   
end

# returns two-element array of winner statements, or single element when tied 
def gamePlay 
  winner = []
  playerOne = "1"
  playerTwo = "2"
  playerOneEntry = getEntry(playerOne)
  playerTwoEntry = getEntry(playerTwo)


  if playerOneEntry == playerTwoEntry
    winner.push( "Tie!")
  else
    winner = returnWinner(playerOneEntry, playerTwoEntry)
  end # if
end

puts "Rock Paper Scissors"

result = []
while result.empty? || result[0] == "Tie!"
  result = gamePlay
  result.each { | entry | puts entry unless entry.empty?  }
end
