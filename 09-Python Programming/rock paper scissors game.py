import random

print("Welcome to Rock Paper Scissors")

user_name = input("Your name : ")
print(f"Welcome to ours game {user_name} ")

print("If you want to choose Rock type => rock ")
print("If you want to choose Paper type => paper ")
print("If you want to choose Scissors type => scissors ")

while True:

    def rps_game():

        user_score = 0
        type_select = ["rock", "paper", "scissors"]
        bot_input = random.choice(type_select)
        user_input = input("Your turn : ")

        if (bot_input == "rock") & (user_input == "paper"):
            print("you win!")
            user_score += 1
            print(f"Your score is {user_score}")

        elif (bot_input == "paper") & (user_input == "scissors"):
            print("you win!")
            user_score += 1
            print(f"Your score is {user_score}")

        elif (bot_input == "scissors") & (user_input == "rock"):
            print("you win!")
            user_score += 1
            print(f"Your score is {user_score}")

        elif bot_input == user_input:
            print("Draw try again!")
            print(f"Your score is {user_score}")
        else:
            print("You lose!")
            print(f"Your score is {user_score}")

    user_ready = input("Are you ready! Yes or No ")

    if user_ready == "Yes":
        rps_game()
    else :
        print("Come on guy! come again")
        break
