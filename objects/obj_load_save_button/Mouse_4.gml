if !file_exists("gamesave.ini"){
    show_debug_message("You have no save file!");
    exit;
}

global.game_started = true;
show_debug_message("game started");

ini_open("gamesave.ini");
room_goto(ini_read_real("Player", "Room", TestRoom));
ini_close();
show_debug_message("Save file loaded nigga.");