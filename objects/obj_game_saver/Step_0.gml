if keyboard_check_pressed(ord("E")) and place_meeting(x, y, obj_player){
    ini_open("gamesave.ini");
    ini_write_real("Player", "X", obj_player.x);
    ini_write_real("Player", "Y", obj_player.y);
    ini_write_real("Player", "Room", room)
    ini_close();
    show_debug_message("Game saved nigga.")
    audio_play_sound(bulletinsert, 0, false);
}