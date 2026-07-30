if file_exists("gamesave.ini"){
    file_delete("gamesave.ini");
}

global.game_started = true;
show_debug_message("game started");

room_goto(TestRoom);