## Home work 02
### Pao Ying Chub
### Users play unlimited times
### Have summary when ending

print("Welcome to rock paper scissors game !!!")
print("What's your name?")
names <- readLines(con="stdin",n=1)
print(paste("Hi!!",names))

print("Are you ready to play?")
print("yes or no.")
play <- readLines(con="stdin",n=1)
if (play == "yes"){
print("Let's get started!")
print ("If you need to end game you can type 'quit'")
}
player <- character()
win <- 0
lose <- 0
draw <- 0

while ((play=="yes")){
  bot <- sample(c("rock","paper","scissors"),1)
  print ("Please select r(rock), p(paper), s(scissors)")
  game <- readLines(con="stdin",n=1)
  if(game == "r"){
    print ("Player turn: rock")
    player <- "rock"
  }else if (game == "p"){
    print ("Player turn: paper")
    player <- "paper"
  }else if (game == "s"){
    print ("Player turn: scissors")
    player <- "scissors"
  }else if (game =="quit"){
    play <- "quit"
  }else if ((game!="r") | (game!="p") | (game!="s")){
    game <- "quit"
    print("Wrong input , Please try again")
  }
    
  if ((game == "r")|(game == "p")|(game == "s")){
      print(paste("Bot turn:",bot))
} 
  if(((game =="r" & bot=="scissors")
    |(game =="p" & bot=="rock")
    |(game =="s" & bot=="paper"))
    & (game != "quit")){
      print("You win!")
      win <- win +1
    }
  else if(player == bot & game != "quit"){
      print("Draw!")
      draw <- draw + 1
    }
  else if (game != "quit"){
    print("You lose!")
    lose <- lose + 1
  } 
  }
    

result <- data.frame (win,lose,draw)
if (play == "no" | play == "quit"){
  print("Your result : ")
  print(result)
  print("Thank You! , --- Hope you enjoy with our game ---")
  print("See you again next time!!!")
}