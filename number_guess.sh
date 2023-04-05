#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

MAIN() {
  echo "Enter your username:"
  read USERNAME
  USER_DETAILS=$($PSQL "SELECT * FROM users WHERE username = '$USERNAME'")
  if [[ -z $USER_DETAILS ]]
  then
    echo "Welcome, $USERNAME! It looks like this is your first time here."
    INSERTED_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  else
    echo $USER_DETAILS | while IFS="|" read USER_ID USERNAME GAMES_PLAYED BEST_GAME
    do
      echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    done
  fi
  GAME
}

GAME(){
  RANDOM_NUMBER=$((1 + $RANDOM % 1000))
  echo "Guess the secret number between 1 and 1000:"
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username='$USERNAME'")
  BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username='$USERNAME'")
  GUESSES=0
  WINNER=false
  while [[ $WINNER = false ]]
  do
    read GUESS
    if [[ ! $GUESS =~ ^[0-9]+$ ]]
    then
      echo "That is not an integer, guess again:"
    else
      if [[ $GUESS = $RANDOM_NUMBER ]]
      then
        GUESSES=$(($GUESSES + 1))
        echo "You guessed it in $GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"
        WINNER=true
        GAMES_PLAYED=$(($GAMES_PLAYED+1))
        #compare best game
        if [[ -z $BEST_GAME ]]
        then
          BEST_GAME=$GUESSES
        fi
        if [[ $BEST_GAME -lt $GUESSES ]]
        then #update table
          UPDATED_USER=$($PSQL "UPDATE users SET games_played= $GAMES_PLAYED, best_game= $BEST_GAME WHERE username = '$USERNAME'")
        else
          UPDATED_USER=$($PSQL "UPDATE users SET games_played= $GAMES_PLAYED, best_game= $GUESSES WHERE username = '$USERNAME'")
        fi
      elif [[ $GUESS -lt $RANDOM_NUMBER ]]
      then
        echo "It's higher than that, guess again:"
        #increase number of guesses
        GUESSES=$(($GUESSES + 1))
      elif [[ $GUESS -gt $RANDOM_NUMBER ]]
      then
        echo "It's lower than that, guess again:"
        #increase number of guesses
        GUESSES=$(($GUESSES + 1))
      fi
    fi
  done
}

MAIN
