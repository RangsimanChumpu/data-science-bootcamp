## rps game

greeting <- function() {
    flush.console()
    print("Welcome to our rock paper scissor game!")
    name_user <- readline("what is your nickname : ")
    print(paste("Nice to meet you", name_user))
    print("You can choose 3 choice in each round")
    print("Please type (r) if you want to select rock")
    print("Please type (s) if you want to select scissor")
    print("Please type (p) if you want to select paper")
    print("Let's play game!!")
}

game <- function() {
    user_score <- 0
    com_score <- 0

    while(TRUE) {
        flush.console()
        user_select <- readline("What is your select r,s,p or quit: ")
        bot_select <- sample(c("r","p","s"), 1)

        if (user_select == "quit") {
            break
        } else if (user_select == bot_select) {
            print("Draw")
        } else if (user_select == "r" & bot_select == "s" |
                   user_select == "s" & bot_select == "p" |
                   user_select == "p" & bot_select == "r") {
            print("your win!!")
            user_score <- user_score + 1
        } else if (user_select == "s" & bot_select == "r" |
                   user_select == "p" & bot_select == "s" |
                   user_select == "r" & bot_select == "p") {
            print("your lose!!")
            com_score <- com_score + 1
        } else {
            print(paste("Your total score : ", user_score, "Bot total score : ", com_score))
        }

    print(paste("Your total score : ", user_score, "Bot total score : ", com_score))
    print("Let's try again!")

    }
}

greeting()
game()

print("Thanks for joined🙏🏻")
