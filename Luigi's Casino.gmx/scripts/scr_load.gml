///Load
var file=file_text_open_write("Highscores.dat");
   
   for(var a=0; a<MaxPoints; a++){
   
   file_text_write_string(file,string(Highscore[Gamestate.memory,a]));
   file_text_writeln(file);
   
   }
   
   file_text_close(file);
