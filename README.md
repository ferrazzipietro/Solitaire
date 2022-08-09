# Solitaire
Code to play a solitaire with Italian cards

This kind of deck contains 40 cards divided in 4 suits. 
The rules are very easy: the game start from 0. You pick one card and add the value of that one to your counter (e.g., if the first card you pick is a 3, at the first round your counter will be 0+3=3, if at the second round you pick a 6, the counter will increase to 6+3=9 and so on). Every time the counter is greater than 10, you take only the last digit (in the example, if the third card is a 7, the counter will be 9+7=16 > 10, so that it will be truncated to 6). At each round you lose if you pick a card that is equal to the counter (in the example, if at the fourth round you pick a 6, you'll lose since your counter is equal to the value of your card).
