
if(instance_exists(destination_id)){

if(pos_from_enemy_T==1)&&(place_meeting(x,y,destination_id)){Z_vsp=-6; pos_from_enemy_T=0;}

if(pos_from_enemy<pos_from_enemy_T){pos_from_enemy+=0.05;}
if(pos_from_enemy>pos_from_enemy_T){pos_from_enemy-=0.05;}

x=
xstart+(destination_id.x-xstart)*pos_from_enemy;

y=
ystart+(destination_id.y-ystart-destination_id.sprite_height)*pos_from_enemy
+Z
;

}
