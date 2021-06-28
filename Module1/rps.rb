puts "Rock Paper Scissors"
def getSelection(player)
  print "Player #{player} - Enter your selection: "
  entry = gets.chomp.downcase
  if entry == "rock" || entry == "paper" || entry == "scissors"
    entry
  else
    puts "No cheaters! Only Rock, Paper or Scissors are allowed"
    getSelection(player)
  end
end

def gamePlay
  winner = ""
  playerOne = getSelection("1")
  playerTwo = getSelection("2")

  paper = "Paper covers rock."
  rock = "Rock crushes scissors."
  scissors = "Scissors cuts paper."

  if playerOne == playerTwo
    puts "Tie!"
    gamePlay
  else
    case playerOne
    when "rock"
      case playerTwo
      when "paper"
        winner = paper
      when "scissors"
        winner = rock
      end # case
    when "paper"
      case playerTwo
      when "rock"
        winner = paper
      when "scissors"
        winner scissors
      end #case
    when "scissors"
      case playerTwo
      when "rock"
        winner = rock
      when "paper"
        winner = scissors
      end # case
    end # case 
  end # if
  winner
end

puts gamePlay
