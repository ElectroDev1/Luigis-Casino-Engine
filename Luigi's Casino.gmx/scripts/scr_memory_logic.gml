///Memory game logic

if(Control){

  for(var a=0; a<maxCards[Gamestate.memory]; a++){

      //Go through the cards
      with(Card[a]){
        
           
           
      
           //Check if you selected a card
           if(point_in_rectangle(mouse_x,mouse_y,bbox_left,bbox_top,bbox_right,bbox_bottom))
           &&(wavetime>=1){
           
              //Click
              if(mouse_check_button_pressed(mb_left))&&(TargetSide==1){
              
                 //Next state
                 other.Page++;
                 OFFY-=5;
                 
                 //FInished picking
                 if(other.Page==2){other.OG[1]=id; with(other){alarm[2]=30;}  other.Control=0; other.Page=3; }
                 //Pick the last one
                 else{ other.OG[0]=id; }     
                 
                 //We flip the card
                 TargetSide=-1;                               
                 
              }
           
           }
      }

  }
  
}

for(var a=0; a<maxCards[Gamestate.memory]; a++){
    
    with(Card[a]){
    
    OFFY=lerp(OFFY,0,0.5);
    
    other.D++;
    
    if(instance_number(obj_card)==2){ image_angle=sin(other.D/20)*6 }
    
    }
}

