#!/bin/bash

choices=( yes no )

length=10
progress=$(($length/2))

# Hide cursor
printf "\e[?25l"
while true; do
  # Randomly shift the decision
  if [ $(( RANDOM % 2 )) -eq "0" ]; then
    ((progress++))
  else
    ((progress--))
  fi

  # Print progress bar
  printf '\rYes ['
  if [ $progress -ne 0 ]; then
    printf '_%.0s' $(eval echo {1.."$(($progress))"})
  fi
  printf '|'
  if [ $progress -ne $length ]; then
    printf '_%.0s' $(eval echo {"$(($progress+1))".."$((length))"})
  fi
  printf '] No'

  # Introduce some delay
  sleep 1

  # Check if either has been decided
  if [ $progress -eq 0 ]; then
    echo
    echo "Decision: Yes"
    break
  fi

  if [ $progress -eq $length ]; then
    echo
    echo "Decision: No"
    break
  fi
done

# Show cursor again
printf "\e[?25h"
