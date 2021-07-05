///Draw memory game logic

//Info
var INST_STRING="Game: Memory Match"

+"#Player: "+string(Player)

+"#Current score: "+string(Score[Gamestate.memory])

+"##-High scores-#"
+"A - "+string(Highscore[Gamestate.memory,0])
+"#B - "+string(Highscore[Gamestate.memory,1])
+"#C - "+string(Highscore[Gamestate.memory,2])
+"#D - "+string(Highscore[Gamestate.memory,3])
+"#E - "+string(Highscore[Gamestate.memory,4])

+"##-Instructions-#"+
"Pick two matching cards#to make them disappear.#Clear all the cards to win."

draw_set_halign(fa_left);
draw_set_alpha(0.7);
draw_set_colour(c_black);
draw_rectangle(-5,-1,string_width(INST_STRING)*0.05,string_height(INST_STRING)*0.05+1,0);
draw_set_colour(c_white);
draw_set_alpha(1);

draw_text_transformed(0,0,
INST_STRING
,.05,.05,0);




//Coin meter
draw_sprite(spr_coin,0,global.GUIX+13,global.GUIY+12);

draw_set_valign(fa_middle);

draw_set_colour(c_black);
draw_text_transformed(global.GUIX+13+7,global.GUIY+12,string(Coins),0.25,0.25,0);
draw_text_transformed(global.GUIX+13+8,global.GUIY+11,string(Coins),0.25,0.25,0);
draw_text_transformed(global.GUIX+13+9,global.GUIY+12,string(Coins),0.25,0.25,0);
draw_text_transformed(global.GUIX+13+8,global.GUIY+13,string(Coins),0.25,0.25,0);

draw_set_colour(make_colour_rgb(248,248,48));
draw_text_transformed(global.GUIX+13+8,global.GUIY+12,string(Coins),0.25,0.25,0);
draw_set_colour(c_black);

//Results
draw_set_valign(fa_top);
draw_set_halign(fa_center);

//Reveal all the cards if we lost
if(Won==-1){

  
   Control=0;
   with(obj_card){TargetSide=-1;}
   
}

//Give the coins and then wait
if(Won==1){

   var b=0;
   var c=0;
   
   

   //Give double the amount of coins
   if(F){     
   
      for(var a=0; a<(max_bet[Gamestate.memory]-Bet_pos)*2; a++){
      
          //Calculate position
          c++;          
          if(c%5==0){ b++; c=1; }
          
          var XC=-14*c;
          var YC=-16*b;
      
          //Create the coins
          if(instance_number(obj_coin)<(max_bet[Gamestate.memory]-Bet_pos)*2){
          
             with(instance_create(room_width-1+XC,room_height-90+YC,obj_coin)){       
       
                  move=0;
                  Dir_order=1;
                  depth=-10;
                  LuigiX=global.GUIX+10;
                  LuigiY=global.GUIY+12;
                  Offset=7;
                  alarm[1]=70+20*a;
                  add=1;
               
            }
               
          }else{F=0;}
   
     }   
   
   }
   
   //Start transition at giveaway end
   if(!instance_exists(obj_coin))&&(Control){ Control=0; alarm[3]=60; }

}

//We are done witht the match
if(abs(Won)==1){

  if(Won==-1){

  if(Kicked){

        //Save the thing
        for(var a=0; a<MaxPoints; a++){
                  
            //High score
            if(Score[Gamestate.memory]>Highscore[Gamestate.memory,a]){
                      
               for(var b=MaxPoints-1; b>a; b--){
                   Highscore[Gamestate.memory,b]=Highscore[Gamestate.memory,b-1];
               }
                      
               Highscore[Gamestate.memory,a]=Score[Gamestate.memory];
               scr_save();
               break;
           
            }
                      
        } 
  
  }else{ if(F){F=0; alarm[3]=180; } }
  
     //Go to the main menu if we lost
     if(keyboard_check_pressed(vk_space))&&(L_sprite!=spr_luigi_oke)&&(Kicked){
     
        NextPage=-1;
        L_sprite=spr_luigi_oke;  
        L_OFFY=-4;   
        L_wave=0;              
        alarm[3]=30; 
     
     
      }    
      
  }
 
  if(G2>0){G2--;}else{

   if(G<1){G+=0.025;}else{
   
      //Tell the player they can press space to get out
      if(Won==-1)&&(Kicked){
   
         draw_set_colour(c_white);
         draw_text_transformed(room_width/2-1,room_height+130-240*G+30,"Press SPACE",0.25,0.25,0);
         draw_text_transformed(room_width/2,room_height+130-240*G+30-1,"Press SPACE",0.25,0.25,0);
         draw_text_transformed(room_width/2+1,room_height+130-240*G+30,"Press SPACE",0.25,0.25,0);
         draw_text_transformed(room_width/2,room_height+130-240*G+30+1,"Press SPACE",0.25,0.25,0);
         draw_set_colour(c_black); 
     
         draw_text_transformed(room_width/2,room_height+130-240*G+30,"Press SPACE",0.25,0.25,0);
         
      }   
         
   }
   
   draw_sprite(spr_result,Won+1,room_width/2,room_height+130-240*G);
   
   //High score
   if(Score[Gamestate.memory]>Highscore[Gamestate.memory,0]){
      draw_sprite(spr_highscore,0,room_width/2,room_height+130-240*G-55);
   }
   
  }

}else{G=0;}


if(Control){L_wave=(sin(G3*0.1));}else{L_wave=0;}
G3++;
L_OFFY=scr_approach(L_OFFY,0,1);
//texture_set_blending(true);
draw_sprite_ext(L_sprite,G3/4,room_width+32,room_height+L_wave*1+4+L_OFFY,0.25,0.25,0,c_white,1);

var SX=sprite_get_xoffset(spr_star)*1.5;
var SY=room_height-sprite_get_yoffset(spr_star)*1.5-2;

//Draw the stars
for(var a=0; a<Score[Gamestate.memory]-(Packed_score*Maxstar); a++){
    
    //Draw the small stars
    if(!instance_exists(obj_star)){
        draw_sprite(spr_star,0,SX,SY- sprite_get_yoffset(spr_star)*1.5 -17*(a+1) );
    }
    
    
    //If the amount of stars is 5, we put them away in a big one
    if(Score[Gamestate.memory]%Maxstar==0)&&(!bigstar){

       //This check is to not make it increase the variable over and over again
       if(Packed_score*Maxstar<Score[Gamestate.memory]){

                 //Create falling stars
                 for(var c=0; c<=Maxstar-1; c++){
           
                     with(instance_create(SX,SY-sprite_get_yoffset(spr_star)*1.5 -17*(c+1),obj_star)){
                          move=0; alarm[1]=20; stop=1;
                          image_speed=0;
                          Destroy=0;
                          Dir_order=1;
                          LuigiY=SY;
                          LuigiX=SX+7;
                          SpeedY=2+0.4*c;
                          wait=2;
                          if(c==4){other.bigstar=1; add=1; Variable="Packed_score";}else{add=0;}
                          alarm[3]=37+5*c;
                          alarm[2]=37+5*c;
                     }
                      
                 }
           
       }
       
    }
    
    

}

//Draw the big star
if(Packed_score>0){

       draw_sprite_ext(spr_star,1,SX,SY,1.5,1.5,0,c_white,1);
       
       draw_set_halign(fa_center);
       draw_set_valign(fa_middle);
       draw_text_transformed(SX,SY,string(Packed_score*Maxstar),0.15,0.15,0);
       
       if(!instance_exists(obj_star)){bigstar=0;}
       
}
