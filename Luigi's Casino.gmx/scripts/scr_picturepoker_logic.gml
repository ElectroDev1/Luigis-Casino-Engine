///Picture poker logic
/*
The way this game works is that we get 5 random cards, and we can choose which to replace, the new cards will still be random though.
The game has specific card combinations with different scores, your final hand has to give a higher result than Luigi's, Luigi can replace his hand at random as well.
If we have the same score result as Luigi's, the game accounts for the card ranks:

(Cloud, Super Mushroom, Fire Flower, Luigi, Mario, Super Star)

Winning gives you an amount of coins based on the number of coins bet multiplied by the rank.
In the rare case a draw happens, we just get our coins back.
A certain amount of money is put in the bet automatically, increasing every 5 stars up to 4 coins, the losing conditions are the same as always.
You can incrase the amount of money you can bet.


We go through these game states:
Give cards and take coins --> Select cards and/or bet --> Luigi changes his cards --> Check for result
(depending on result
--> Luigi takes the coins you bet and restart if you have enough coins
--> Increased score and get coins, then restart
--> Get your coins back, then restart

*/
