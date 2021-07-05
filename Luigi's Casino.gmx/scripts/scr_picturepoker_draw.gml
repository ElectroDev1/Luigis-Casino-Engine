///Picture poker draw logic

//Info
var INST_STRING="Game: Picture Poker"

+"#Player: "+string(Player)

+"#Current score: "+string(Score[Gamestate.picturepoker])

+"##-High scores-#"
+"A - "+string(Highscore[Gamestate.picturepoker,0])
+"#B - "+string(Highscore[Gamestate.picturepoker,1])
+"#C - "+string(Highscore[Gamestate.picturepoker,2])
+"#D - "+string(Highscore[Gamestate.picturepoker,3])
+"#E - "+string(Highscore[Gamestate.picturepoker,4])

+"##-Instructions-#"+
"Get a better hand than#Luigi to win! If you're#confident your hand is#best, increase the#number of coins you bet!"

draw_set_halign(fa_left);
draw_set_alpha(0.7);
draw_set_colour(c_black);
draw_rectangle(-5,-1,string_width(INST_STRING)*0.05,string_height(INST_STRING)*0.05+1,0);
draw_set_colour(c_white);
draw_set_alpha(1);

draw_text_transformed(0,0,
INST_STRING
,.05,.05,0);
