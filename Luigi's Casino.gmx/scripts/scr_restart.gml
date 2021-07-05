
ex=unix_timestamp();
status="default";
dis_icon="default"

//Play music
audio_stop_all();
audio_play_sound(snd_casino,1,1);

//If you can have control on the game
Control=1;

//This variable is mostly to go through states and stuff
Page=0;

SubPage=0;

NextPage=0;

//A variable if you need to store specific card stuff
OG[0]=0;

//The amount of games
MaxGames=3;

//Amount of points in the leaderboards
MaxPoints=5;

//Set game
Game=-1//Gamestate.memory;

//The amount of cards to create based on game mode
maxCards[MaxGames]=8;

maxX[MaxGames]=8;
maxY[MaxGames]=4;

//The offssets for the cards
AnchorX[MaxGames]=32*2;
AnchorY[MaxGames]=64;

//Card ID
Card[maxCards[MaxGames]]=0;

//Variable to interact with cards
D=0;

//Scores
Score[MaxGames]=0;

for(var a=0; a<MaxGames; a++){
Highscore[a,MaxPoints]=0;
}

//If we're in multiplayer mode increase this number
Multiplayer=0;

//The player that is playing
Player=0;

//If we are in a game
InGame=0;

//State for the game (locked-unlocked), I might add a "mastered" option if you got a high enough score
//0- locked
//1- unlocked
GameState[MaxGames]=0;
GameState[0]=1;

//Luigi
L_wave=0;
L_OFFY=0;
L_sprite=spr_luigi_choose;

global.GUIX=0;
global.GUIY=0;
